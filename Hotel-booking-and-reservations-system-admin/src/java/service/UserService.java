/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

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

/**
 *
 * @author HUNGCUONG
 */
public interface UserService {    
    
    public ArrayList<FollowUsers> getListFollowUsers();
    
    public Map getFollowUsersMap(ArrayList<FollowUsers> list);
    
    public Map getFollowUsersMapByIP(ArrayList<FollowUsers> list);
    
    public Map getFollowUsersMapByOneIP(ArrayList<FollowUsers> list, String ip);
    
    public Map getMapFollowUsersCountry(ArrayList<FollowUsers> list);
    
    public String getFollowUsersCountry(ArrayList<FollowUsers> list);    
    
    public Customer getCustomerByName(String username);

    public List<Customer> getAllCustomers();

    public boolean checkexsitCustomer(String username);
     
    public ArrayList<String> getDateVisit(String username);
    
    public ArrayList<DataCollection> getListRoomBooked(String username);
    
    public List<DataCollection> getListRoomCanceled(String username);
    
    public double getAvgStarRoomFeedback(String username);
    
    public double getAvgStarFeedback(String username);
    
    public List<FeedbackRoom> getListFeedbackRoom(String username);
    
    public List<CustomerDataCollection> getDataCollection();
    
    public CustomerDataCollection getOneDataCollection(String username);
    
    public Administrator getAdminByUserName(String username);

    public void updateAdmin(Administrator ad);

    public void updatePassword(String currentpassword, String correctpassword, String newpassword, String confirm);

    public void editProfileImg(String username, String img);

    public List<Activity> getAllActivity();

    public List<Activity> getAllActivityByUserName(String username);

    public List<Activity> getNewListNotification();

    public Activity getActivityBy(String id);

    public void seenNotification(String id);
}
