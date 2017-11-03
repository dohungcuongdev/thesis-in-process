/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.user;

import java.util.ArrayList;
import java.util.List;
import model.user.Customer;

/**
 *
 * @author Do Hung Cuong
 */
public interface DAOCustomer {

    public Customer getCustomerByName(String username);

    public List<Customer> getAllCustomers();

    public boolean checkexsitCustomer(String username);
     
    public ArrayList<String> getDateVisit(String username);
}
