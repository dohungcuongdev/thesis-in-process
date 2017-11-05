/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import DAO.message.DAOActivity;
import DAO.message.ImpActivityDAO;
import DAO.hotel.ImpRoomDAO;
import DAO.user.DAOCustomer;
import DAO.user.ImpCustomerDAO;
import DAO.user.ImpUserDAO;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Activity;
import model.hotel.HotelRoom;
import model.user.Customer;
import model.user.FollowUsers;
import org.bson.types.ObjectId;
import service.application.DateTimeService;
import service.application.MailService;
import service.application.StringUtils;

/**
 *
 * @author Do Hung Cuong
 */
public class Test {

    public static void main(String args[]) {
        ImpCustomerDAO d = new ImpCustomerDAO();

        System.out.println(d.getListFeedbackRoom("cuongvip1295@gmail.com"));

    }

}
