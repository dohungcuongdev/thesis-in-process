/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.user;

import DAO.hotel.ImpRoomDAO;
import DAO.message.ImpActivityDAO;
import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import connectMongoDB.MongoDBConnector;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Activity;
import model.CustomerDataCollection;
import model.DataCollection;
import model.FeedbackRoom;
import model.user.Customer;
import service.application.DateTimeService;

/**
 *
 * @author Do Hung Cuong
 */
public class ImpCustomerDAO implements DAOCustomer {

    Gson gson = new Gson();
    DBCollection collection;

    {
        try {
            collection = MongoDBConnector.createConnection("customers");
        } catch (UnknownHostException ex) {
            Logger.getLogger(ImpRoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Customer getCustomerByName(String username) {
        BasicDBObject whereQuery = new BasicDBObject();
        whereQuery.put("username", username);
        DBCursor cursor = collection.find(whereQuery);
        Customer cus = new Customer();
        while (cursor.hasNext()) {
            DBObject obj = cursor.next();
            cus = gson.fromJson(obj + "", Customer.class);
            cus.setRegistered_date(DateTimeService.getDateTime(obj.get("created_at") + ""));
        }
        return cus;
    }

    @Override
    public List<Customer> getAllCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        DBCursor cursor = collection.find();
        while (cursor.hasNext()) {
            DBObject obj = cursor.next();
            Customer cus = gson.fromJson(obj + "", Customer.class);
            cus.setRegistered_date(DateTimeService.getDateTime(obj.get("created_at") + ""));
            cus.setDateVisit(getDateVisit(cus.getUsername()));
            customers.add(cus);
        }
        return customers;
    }

    @Override
    public boolean checkexsitCustomer(String username) {
        return getAllCustomers().stream().anyMatch((customer) -> (customer.getUsername().equals(username)));
    }

    @Override
    public ArrayList<String> getDateVisit(String username) {
        ArrayList<String> dateVisits = new ArrayList<>();
        new ImpUserDAO().getListFollowUsers().stream().filter((fu) -> (fu.getUsername() != null && fu.getUsername().equals(username))).map((fu) -> fu.getDate_access().toString().substring(0, 10) + fu.getDate_access().toString().substring(19, 28)).forEach((dateVisit) -> {
            if (dateVisits.isEmpty()) {
                dateVisits.add(dateVisit);
            } else if (!dateVisits.contains(dateVisit)) {
                dateVisits.add(dateVisit);
            }
        });
        return dateVisits;
    }

    @Override
    public ArrayList<DataCollection> getListRoomBooked(String username) {
        ArrayList<DataCollection> roombooked = new ArrayList<>();
        for (Activity act : new ImpActivityDAO().getAllActivityByUserName(username)) {
            if (act.getName().equals("Book Room")) {
                roombooked.add(new DataCollection(act.getTime() + "", act.getDetails().substring(12)));
            }
        }
        return roombooked;
    }

    @Override
    public List<DataCollection> getListRoomCanceled(String username) {
        List<DataCollection> roomcanceled = new ArrayList<>();
        for (Activity act : new ImpActivityDAO().getAllActivityByUserName(username)) {
            if (act.getName().equals("Cancel Room")) {
                roomcanceled.add(new DataCollection(act.getTime() + "", act.getDetails().substring(20)));
            }
        }
        return roomcanceled;
    }

    @Override
    public double getAvgStarRoomFeedback(String username) {
        int star = 0, count = 0;
        for (Activity act : new ImpActivityDAO().getAllActivityByUserName(username)) {
            if (act.getName().equals("Feedback Room")) {
                star += act.getNote().charAt(21) - 48;
                count++;
            }
        }
        return star * 1.0 / count;
    }

    public int getTotalStarRoomFeedback(String username) {
        int star = 0;
        for (Activity act : new ImpActivityDAO().getAllActivityByUserName(username)) {
            if (act.getName().equals("Feedback Room")) {
                star += act.getNote().charAt(21) - 48;
            }
        }
        return star;
    }

    @Override
    public double getAvgStarFeedback(String username) {
        int star = 0, count = 0;
        for (Activity act : new ImpActivityDAO().getAllActivityByUserName(username)) {
            if (act.getName().equals("Feedback")) {
                star += act.getNote().charAt(12) - 48;
                count++;
            }
        }
        return star * 1.0 / count;
    }

    public double getTotalStarFeedback(String username) {
        int star = 0;
        for (Activity act : new ImpActivityDAO().getAllActivityByUserName(username)) {
            if (act.getName().equals("Feedback")) {
                star += act.getNote().charAt(12) - 48;
            }
        }
        return star;
    }

    @Override
    public List<CustomerDataCollection> getDataCollection() {
        List<CustomerDataCollection> cdc = new ArrayList<>();
        List<Customer> customers = getAllCustomers();
        for (Customer c : customers) {
            String un = c.getUsername();
            cdc.add(new CustomerDataCollection(c, getListRoomBooked(un), getListRoomCanceled(un), getDateVisit(un), getListFeedbackRoom(un), getAvgStarRoomFeedback(un), getAvgStarFeedback(un)));
        }
        return cdc;
    }

    @Override
    public CustomerDataCollection getOneDataCollection(String un) {
        return new CustomerDataCollection(getCustomerByName(un), getListRoomBooked(un), getListRoomCanceled(un), getDateVisit(un), getListFeedbackRoom(un), getAvgStarRoomFeedback(un), getAvgStarFeedback(un));
    }

    @Override
    public List<FeedbackRoom> getListFeedbackRoom(String username) {
        List<FeedbackRoom> fbr = new ArrayList();
        for (Activity act : new ImpActivityDAO().getAllActivityByUserName(username)) {
            if (act.getName().equals("Feedback Room")) {
                String date = act.getTime() + "";
                String room = act.getNote().substring(12, 15);
                int star = act.getNote().charAt(21) - 48;
                String feedback = act.getContent();
                fbr.add(new FeedbackRoom(date, room, star, feedback));
            }
        }
        return fbr;
    }
}
