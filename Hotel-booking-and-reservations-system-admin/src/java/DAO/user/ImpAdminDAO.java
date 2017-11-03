/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import connectMongoDB.MongoDBConnector;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.user.Administrator;
import service.application.EditImageDBService;

/**
 *
 * @author Do Hung Cuong
 */
public class ImpAdminDAO implements DAOAdmin {

    Gson gson;
    DBCollection collection;

    {
        try {
            collection = MongoDBConnector.createConnection("admin");
            gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").create();
        } catch (UnknownHostException ex) {
            Logger.getLogger(ImpAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Administrator getAdminByUserName(String username) {
        BasicDBObject whereQuery = new BasicDBObject();
        whereQuery.put("username", username);
        DBCursor cursor = collection.find(whereQuery);
        while (cursor.hasNext()) {
            return gson.fromJson(cursor.next().toString(), Administrator.class);
        }
        return null;
    }

    @Override
    public void updateAdmin(Administrator ad) {
        DBObject document = (DBObject) JSON.parse(gson.toJson(ad));
        DBObject searchObject = new BasicDBObject();
        searchObject.put("username", ad.getUsername());
        collection.update(searchObject, document);
    }

    @Override
    public void updatePassword(String currentpassword, String correctpassword, String newpassword, String confirm) {
        if (currentpassword.equals(correctpassword) && newpassword.equals(confirm)) {
            BasicDBObject document = new BasicDBObject();
            document.append("$set", new BasicDBObject().append("password", newpassword));
            BasicDBObject searchQuery = new BasicDBObject().append("username", "cuongvip1295@yahoo.com.vn");
            collection.update(searchQuery, document);
        }
    }

    @Override
    public void editProfileImg(String username, String img) {
        EditImageDBService.editImagebyUserName(collection, username, img);
    }
}
