/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.user.Administrator;
import model.ApplicationData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import model.hotel.HotelRoom;
import model.hotel.HotelService;
import model.user.Customer;
import model.user.FollowUsers;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import service.HotelItemService;
import service.impl.HotelItemServiceImp;
import service.UserService;
import service.impl.UserServiceImp;
import service.impl.ApplicationServiceImp;
import service.ApplicationService;

/**
 *
 * @author Do Hung Cuong
 */
@Controller
@RequestMapping(value = "/")
public class MainController {

    private final UserService userService = new UserServiceImp();
    private final HotelItemService hotelItemService = new HotelItemServiceImp();
    private final ApplicationService appService = new ApplicationServiceImp();

    //index
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(ModelMap model) {
        initialize(model);
        return "index";
    }

    //profile
    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public String profile(ModelMap model) {
        initialize(model);
        model.addAttribute("adminEdit", new Administrator());
        return "profile";
    }

    @RequestMapping(value = "profile-edited", method = RequestMethod.POST)
    public String editProfile(@ModelAttribute(value = "adminEdit") Administrator ad, ModelMap model) {
        if (ad.isEnoughInfor()) {
            userService.updateAdmin(ad);
            ApplicationData.admin = ad;
            model.put("editResult", "success");
        } else {
            model.put("editResult", "Please input enough information!");
        }
        initialize(model);
        return "profile";
    }

    @RequestMapping(value = "profile-img-edited", method = RequestMethod.POST)
    public String profileImgEdited(@RequestParam(value = "img") CommonsMultipartFile img, HttpServletRequest request, ModelMap model) {
        userService.editProfileImg(ApplicationData.admin.getUsername(), appService.uploadfile(img, request, model, "users"));
        ApplicationData.refreshAdmin();
        return profile(model);
    }

    //rooms
    @RequestMapping(value = "manage-rooms", method = RequestMethod.GET)
    public String manageRooms(ModelMap model) {
        initialize(model);
        model.put("listrooms", hotelItemService.getAllRooms());
        return "manage-rooms";
    }

    @RequestMapping(value = "room", method = RequestMethod.GET)
    public String singleRoom(ModelMap model) {
        return manageRooms(model);
    }

    @RequestMapping(value = "room/{roomname}", method = RequestMethod.GET)
    public String singleRoom(@PathVariable(value = "roomname") String roomname, ModelMap model) {
        return initializeSingleRoom(model, roomname, "room");
    }

    @RequestMapping(value = "edit-room/{roomname}", method = RequestMethod.GET)
    public String editRoom(@PathVariable(value = "roomname") String roomname, ModelMap model) {
        model.addAttribute("roomEdit", new HotelRoom());
        return initializeSingleRoom(model, roomname, "edit-room");
    }

    @RequestMapping(value = "room-edited", method = RequestMethod.POST)
    public String roomEdited(@ModelAttribute(value = "roomEdit") HotelRoom roomEdit, ModelMap model) {
        roomEdit.initializeSomeInfor();
        initialize(model);
        String strEdit = roomEdit.getAbleToEdit();
        model.put("editResult", strEdit);
        if (strEdit.equals("success")) {
            hotelItemService.updateRoom(roomEdit);
            model.put("room", roomEdit);
            model.put("relatedRoom", hotelItemService.getRelatedHotelRooms(roomEdit.getType()));
        } else {
            return initializeSingleRoom(model, roomEdit.getName(), "edit-room");
        }
        return "edit-room";
    }

    @RequestMapping(value = "remove-room/{roomname}", method = RequestMethod.GET)
    public String removeRoom(@PathVariable(value = "roomname") String roomname, ModelMap model) {
        hotelItemService.deleteRoom(roomname);
        model.put("deleteResult", "success");
        return manageRooms(model);
    }

    @RequestMapping(value = "room-img-edited/{roomname}", method = RequestMethod.POST)
    public String roomImgEdited(@RequestParam(value = "img1") CommonsMultipartFile img1, @RequestParam(value = "img2") CommonsMultipartFile img2, HttpServletRequest request, @PathVariable(value = "roomname") String roomname, ModelMap model) {
        model.addAttribute("roomEdit", new HotelRoom());
        hotelItemService.editImageRoom(roomname, appService.uploadfile(img1, request, model, "rooms"), appService.uploadfile(img2, request, model, "rooms"));
        return initializeSingleRoom(model, roomname, "edit-room");
    }

    //restaurant
    @RequestMapping(value = "manage-restaurant", method = RequestMethod.GET)
    public String manageRestaurant(ModelMap model) {
        initialize(model);
        model.put("listservices", hotelItemService.getAllHotelServices());
        return "manage-restaurant";
    }

    @RequestMapping(value = "/service", method = RequestMethod.GET)
    public String singleService(ModelMap model) {
        return manageRestaurant(model);
    }

    @RequestMapping(value = "service/{servicename}", method = RequestMethod.GET)
    public String singleService(@PathVariable(value = "servicename") String servicename, ModelMap model) {
        return initializeSingleService(model, servicename, "service");
    }

    @RequestMapping(value = "/edit-service/{servicename}", method = RequestMethod.GET)
    public String editService(@PathVariable(value = "servicename") String servicename, ModelMap model) {
        model.addAttribute("serviceEdit", new HotelService());
        return initializeSingleService(model, servicename, "edit-service");
    }

    @RequestMapping(value = "service-edited", method = RequestMethod.POST)
    public String serviceEdited(@ModelAttribute(value = "serviceEdit") HotelService serviceEdit, ModelMap model) {
        serviceEdit.initializeSomeInfor();
        initialize(model);
        String strEdit = serviceEdit.getAbleToEdit();
        model.put("editResult", strEdit);
        if (strEdit.equals("success")) {
            hotelItemService.updateService(serviceEdit);
            model.put("service", serviceEdit);
            model.put("relatedServices", hotelItemService.getRelatedHotelServices(serviceEdit.getType()));
        } else {
            return initializeSingleService(model, serviceEdit.getName(), "edit-service");
        }
        return "edit-service";
    }

    @RequestMapping(value = "remove-service/{servicename}", method = RequestMethod.GET)
    public String removeService(@PathVariable(value = "servicename") String servicename, ModelMap model) {
        hotelItemService.deleteService(servicename);
        model.put("deleteResult", "success");
        return manageRestaurant(model);
    }

    @RequestMapping(value = "service-img-edited/{servicename}", method = RequestMethod.POST)
    public String serviceImgEdited(@RequestParam(value = "img1") CommonsMultipartFile img1, @RequestParam(value = "img2") CommonsMultipartFile img2, HttpServletRequest request, @PathVariable(value = "servicename") String servicename, ModelMap model) {
        model.addAttribute("serviceEdit", new HotelService());
        hotelItemService.editImageService(servicename, appService.uploadfile(img1, request, model, "restaurant"), appService.uploadfile(img2, request, model, "restaurant"));
        return initializeSingleService(model, servicename, "edit-service");
    }

    //users
    @RequestMapping(value = "manage-users", method = RequestMethod.GET)
    public String manageUsers(ModelMap model) {
        initialize(model);
        model.put("listusers", userService.getAllCustomers());
        model.put("cusDataCollection", userService.getDataCollection());
        return "manage-users";
    }

    @RequestMapping(value = "follow-users", method = RequestMethod.GET)
    public String followUsers(ModelMap model) {
        initialize(model);
        ArrayList<FollowUsers> list = userService.getListFollowUsers();
        model.put("listFollowUsers", list);

        model.put("mapFollowUsers", userService.getFollowUsersMap(list));
        model.put("mapFollowUsersIP", userService.getFollowUsersMapByIP(list));
        return "follow-users";
    }

    @RequestMapping(value = "follow-user-chart", method = RequestMethod.GET)
    public String followUserChart(ModelMap model) {
        initialize(model);
        ArrayList<FollowUsers> list = userService.getListFollowUsers();
        model.put("jsonchart",userService.getFollowUsersCountry(list));
        return "follow-user-chart";
    }

    @RequestMapping(value = "follow-user-ip/{ip}", method = RequestMethod.GET)
    public String followUsersIP(@PathVariable(value = "ip") String ip, ModelMap model) {
        initialize(model);
        ArrayList<FollowUsers> list = userService.getListFollowUsers();
        model.put("listFollowUsers", list);
        model.put("mapFollowUserIP", userService.getFollowUsersMapByOneIP(list, ip));
        return "follow-user-ip";
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String singleUser(ModelMap model) {
        return manageUsers(model);
    }
    
    @RequestMapping(value = "customer", method = RequestMethod.GET)
    public String singleCustomer(ModelMap model) {
        return manageUsers(model);
    }

    @RequestMapping(value = "user/{username}", method = RequestMethod.GET)
    public String singleUser(@PathVariable(value = "username") String username, ModelMap model) {
        initialize(model);
        Customer cus = userService.getCustomerByName(username);
        cus.setActivity(userService.getAllActivityByUserName(username));
        model.put("customer", cus);
        return "user";
    }
    
    @RequestMapping(value = "customer/{username}", method = RequestMethod.GET)
    public String singleCustomer(@PathVariable(value = "username") String username, ModelMap model) {
        initialize(model);
        model.put("cusDataCollection", userService.getOneDataCollection(username));
        return "customer";
    }

    //message
    @RequestMapping(value = "message", method = RequestMethod.GET)
    public String message(ModelMap model) {
        initialize(model);
        return "message";
    }

    @RequestMapping(value = "notification/{id}", method = RequestMethod.GET)
    public String notification(@PathVariable(value = "id") String id, ModelMap model) {
        userService.seenNotification(id);
        model.put("activity", userService.getActivityBy(id));
        initialize(model);
        return "notification";
    }

    @RequestMapping(value = "reply Book Room/{id}", method = RequestMethod.GET)
    public String replyBooking(@PathVariable(value = "id") String id, ModelMap model) {
        userService.seenNotification(id);
        model.put("activity", userService.getActivityBy(id));
        initialize(model);
        return "reply Book Room";
    }

    @RequestMapping(value = "reply Cancel Room/{id}", method = RequestMethod.GET)
    public String replyCancel(@PathVariable(value = "id") String id, ModelMap model) {
        userService.seenNotification(id);
        model.put("activity", userService.getActivityBy(id));
        initialize(model);
        return "reply Cancel Room";
    }

    @RequestMapping(value = "/send-mail", method = RequestMethod.POST)
    public String sendMail(@RequestParam("activity-id") String id, @RequestParam("message") String message, @RequestParam("user-email") String useremail, @RequestParam("subject") String subject, ModelMap model) {
        appService.sendEmail(appService.removeAccent(message), useremail, subject);
        return notification(id, model);
    }

    //fqa
    @RequestMapping(value = "fqa", method = RequestMethod.GET)
    public String fqa(ModelMap model) {
        initialize(model);
        return "fqa";
    }

    //initialize function
    private void initialize(ModelMap model) {
        model.put("ad", ApplicationData.admin);
        model.put("newNotifications", userService.getNewListNotification());
        model.put("listactivily", userService.getAllActivity());
    }

    private String initializeSingleRoom(ModelMap model, String roomname, String redirect) {
        initialize(model);
        HotelRoom room = hotelItemService.getRoomByName(roomname);
        model.put("room", room);
        model.put("relatedRoom", hotelItemService.getRelatedHotelRooms(room.getType()));
        return redirect;
    }

    private String initializeSingleService(ModelMap model, String servicename, String redirect) {
        initialize(model);
        HotelService service = hotelItemService.getHotelServiceByName(servicename);
        model.put("service", service);
        model.put("relatedServices", hotelItemService.getRelatedHotelServices(service.getType()));
        return redirect;
    }

}
