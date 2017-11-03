<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/sub-content.jspf"%>

<!-- Main row -->
<div class="row">

    <div class="col-md-8">
        <section class="panel">
            <header class="panel-heading">
                Notifications
            </header>
            <div class="panel-body" id="noti-box"> 
                <div class="alert alert-danger">
                    <button data-dismiss="alert" class="close close-sm" type="button"></button>
                    <strong>${activity.time}!</strong>
                    <h5>Username: ${activity.username}</h5>
                    <h5>Full Name: ${activity.fullname}</h5>
                    <h5>Email: ${activity.email}</h5>
                    <h5>Phone: ${activity.phone}</h5>
                    <h5>Details: ${activity.details}</h5>
                    <h5>Note: ${activity.note}</h5>
                    <h5>Response: ${activity.response}</h5>
                    <h5>Contents: </h5>
                    <p>${activity.content}</P>
                </div>
            </div>
        </section>
    </div>

    <%@ include file="common/mes-note.jspf"%>


</div>

<div class="row">
    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                Email Reply
            </header>

            <ul class="media-list">
                <li class="media">
                    <a href="#" class="pull-left">
                        <img src="${pageContext.request.contextPath}/resources/img/users/${ad.img}" alt="Avatar" class="img-circle" width="48" height="48">
                    </a>
                    <div class="media-body">
                        <a href="${pageContext.request.contextPath}/profile.htm">
                            <strong>${ad.name}</strong>
                        </a>
                        <p>
                            Send an email to reply this message! Forget the contents?
                            <a href="#" class="text-danger">
                                <strong>#view the message again!</strong>
                            </a>
                        </p>
                    </div>
                </li>
            </ul>


            <div class="panel-body">
                <div class="twt-area">
                    <form action="${pageContext.request.contextPath}/send-mail.htm" method="post" accept-charset="UTF-8">
                        <textarea name="message" class="form-control" name="profile-tweet" placeholder="Write something on reply.." rows="7"></textarea>
                        <input type="hidden" name="activity-id" value="${activity.id}"/>
                        <input type="hidden" name="user-email" value="${activity.username}"/>
                        <input type="hidden" name="subject" value="${activity.name}"/>
                        <div class="clearfix">
                            <button class="btn btn-sm btn-primary pull-right" type="submit">
                                <i class="fa fa-envelope-o"></i>
                                Send Email
                            </button>
                            <a class="btn btn-link btn-icon fa fa-location-arrow" data-original-title="Add Location" data-placement="bottom" data-toggle="tooltip"
                               href="#" style="text-decoration:none;" title=""></a>
                            <a class="btn btn-link btn-icon fa fa-camera" data-original-title="Add Photo" data-placement="bottom" data-toggle="tooltip"
                               href="#" style="text-decoration:none;" title=""></a>
                        </div>
                    </form>
                </div>
            </div>

            <header class="panel-heading">
                Sample email reply 1
            </header>
            <div class="panel-body">
                <div class="twt-area">
                    <form action="${pageContext.request.contextPath}/send-mail.htm" method="post" accept-charset="UTF-8">
                        <textarea class="form-control" name="message" placeholder="Write something on reply.." rows="14">Dear ${activity.fullname}, &#13;&#13;Thank you for your interest in our hotel. This email is to acknowledge the receipt of your email and thank you for sending us your request. We will carefully review your request. Should your request match our ability, we will contact you soon. In other cases, we will keep the request for future opportunities.&#13;&#13;With best regards, .&#13Hùng Cường, Hotel Owner.&#13&#13...&#13Holiday Crown.&#13Address: 24 Street 7, Bình An Ward, District 2.&#13Phone Number: 0908998923.&#13Hotline: (08).37404802.
                        </textarea>
                        <input type="hidden" name="activity-id" value="${activity.id}"/>
                        <input type="hidden" name="user-email" value="${activity.username}"/>
                        <input type="hidden" name="subject" value="${activity.name}"/>

                        <div class="clearfix">
                            <button class="btn btn-sm btn-primary pull-right" type="submit">
                                <i class="fa fa-envelope-o"></i>
                                Send Email
                            </button>
                            <a class="btn btn-link btn-icon fa fa-location-arrow" data-original-title="Add Location" data-placement="bottom" data-toggle="tooltip"
                               href="#" style="text-decoration:none;" title=""></a>
                            <a class="btn btn-link btn-icon fa fa-camera" data-original-title="Add Photo" data-placement="bottom" data-toggle="tooltip"
                               href="#" style="text-decoration:none;" title=""></a>
                        </div>
                    </form>
                </div>
            </div>

            <header class="panel-heading">
                Sample email reply 2
            </header>
            <div class="panel-body">
                <div class="twt-area">
                    <form action="${pageContext.request.contextPath}/send-mail.htm" method="post" accept-charset="UTF-8">
                        <textarea class="form-control" name="message" placeholder="Write something on reply.." rows="14">Dear ${activity.fullname}, &#13;&#13;Here is your booking information:&#13; - ${activity.details}.&#13; - ${activity.note}.&#13;&#13;Thank you for booking room in our hotel. This email is to acknowledge the receipt of your email and thank you for interest in our hotel. Should anything unexpectedly happen i will contact you immediately.&#13;&#13;With best regards, .&#13Hùng Cường, Hotel Owner.&#13&#13...&#13Holiday Crown.&#13Address: 24 Street 7, Bình An Ward, District 2.&#13Phone Number: 0908998923.&#13Hotline: (08).37404802.
                        </textarea>
                        <input type="hidden" name="activity-id" value="${activity.id}"/>
                        <input type="hidden" name="user-email" value="${activity.username}"/>
                        <input type="hidden" name="subject" value="${activity.name}"/>
                        <div class="clearfix">
                            <button class="btn btn-sm btn-primary pull-right" type="submit">
                                <i class="fa fa-envelope-o"></i>
                                Send Email
                            </button>
                            <a class="btn btn-link btn-icon fa fa-location-arrow" data-original-title="Add Location" data-placement="bottom" data-toggle="tooltip"
                               href="#" style="text-decoration:none;" title=""></a>
                            <a class="btn btn-link btn-icon fa fa-camera" data-original-title="Add Photo" data-placement="bottom" data-toggle="tooltip"
                               href="#" style="text-decoration:none;" title=""></a>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>


<!-- Main row -->
<div class="row">

    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                Related Message
            </header>
            <div class="panel-body" id="noti-box">

                <div class="alert alert-block alert-danger">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July, 162017 5:16:30pm!</strong>                                    User cuongvip1295@yahoo.com.vn booked the 101.
                </div>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July, 162017 5:16:30pm!</strong>                                    A new user signed in with username cuongvip1295@yahoo.com.vn.
                </div>
                <div class="alert alert-info">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July, 162017 5:16:30pm!</strong>                                    A guest with email cuongvip1295@yahoo.com.vn send a reservation resquest.
                </div>
                <div class="alert alert-warning">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July, 162017 5:16:30pm!</strong>                                    A customer send a contact message.
                </div>
            </div>
        </section>

    </div>


</div>
<!-- row end -->
<%@ include file="common/footer.jspf"%>