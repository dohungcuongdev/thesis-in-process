/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service.impl;

import DAO.message.DAOActivity;
import DAO.message.ImpActivityDAO;
import DAO.user.DAOAdmin;
import DAO.user.DAOCustomer;
import DAO.user.DAOUser;
import DAO.user.ImpAdminDAO;
import DAO.user.ImpCustomerDAO;
import DAO.user.ImpUserDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Activity;
import model.CustomerDataCollection;
import model.DataCollection;
import model.FeedbackRoom;
import model.user.Administrator;
import model.user.Customer;
import model.user.FollowUsers;
import service.UserService;

/**
 *
 * @author HUNGCUONG
 */
public class UserServiceImp implements UserService {
    
    private final DAOUser userDAO = new ImpUserDAO();
    private final DAOAdmin adminDAO = new ImpAdminDAO();
    private final DAOCustomer customerDAO = new ImpCustomerDAO();
    private final DAOActivity activityDAO = new ImpActivityDAO();

    @Override
    public ArrayList<FollowUsers> getListFollowUsers() {
        return userDAO.getListFollowUsers();
    }

    @Override
    public Map getFollowUsersMap(ArrayList<FollowUsers> list) {
        return userDAO.getFollowUsersMap(list);
    }

    @Override
    public Map getFollowUsersMapByIP(ArrayList<FollowUsers> list) {
        return userDAO.getFollowUsersMapByIP(list);
    }

    @Override
    public Map getFollowUsersMapByOneIP(ArrayList<FollowUsers> list, String ip) {
        return userDAO.getFollowUsersMapByOneIP(list, ip);
    }

    @Override
    public Map getMapFollowUsersCountry(ArrayList<FollowUsers> list) {
        return userDAO.getMapFollowUsersCountry(list);
    }

    @Override
    public String getFollowUsersCountry(ArrayList<FollowUsers> list) {
        return userDAO.getFollowUsersCountry(list);
    }

    @Override
    public Customer getCustomerByName(String username) {
        return customerDAO.getCustomerByName(username);
    }

    @Override
    public List<Customer> getAllCustomers() {
        return customerDAO.getAllCustomers();
    }

    @Override
    public boolean checkexsitCustomer(String username) {
        return customerDAO.checkexsitCustomer(username);
    }

    @Override
    public ArrayList<String> getDateVisit(String username) {
        return customerDAO.getDateVisit(username);
    }

    @Override
    public Administrator getAdminByUserName(String username) {
        return adminDAO.getAdminByUserName(username);
    }

    @Override
    public void updateAdmin(Administrator ad) {
        adminDAO.updateAdmin(ad);
    }

    @Override
    public void updatePassword(String currentpassword, String correctpassword, String newpassword, String confirm) {
        adminDAO.updatePassword(currentpassword, correctpassword, newpassword, confirm);
    }

    @Override
    public void editProfileImg(String username, String img) {
        adminDAO.editProfileImg(username, img);
    }

    @Override
    public List<Activity> getAllActivity() {
        return activityDAO.getAllActivity();
    }

    @Override
    public List<Activity> getAllActivityByUserName(String username) {
        return activityDAO.getAllActivityByUserName(username);
    }

    @Override
    public List<Activity> getNewListNotification() {
        return activityDAO.getNewListNotification();
    }

    @Override
    public Activity getActivityBy(String id) {
        return activityDAO.getActivityBy(id);
    }

    @Override
    public void seenNotification(String id) {
        activityDAO.seenNotification(id);
    }

    @Override
    public ArrayList<DataCollection> getListRoomBooked(String username) {
        return customerDAO.getListRoomBooked(username);
    }

    @Override
    public List<DataCollection> getListRoomCanceled(String username) {
        return customerDAO.getListRoomCanceled(username);
    }

    @Override
    public double getAvgStarRoomFeedback(String username) {
        return customerDAO.getAvgStarRoomFeedback(username);
    }

    @Override
    public List<CustomerDataCollection> getDataCollection() {
        return customerDAO.getDataCollection();
    }

    @Override
    public double getAvgStarFeedback(String username) {
        return customerDAO.getAvgStarFeedback(username);
    }

    @Override
    public CustomerDataCollection getOneDataCollection(String username) {
        return customerDAO.getOneDataCollection(username);
    }

    @Override
    public List<FeedbackRoom> getListFeedbackRoom(String username) {
        return customerDAO.getListFeedbackRoom(username);
    }
    
}
