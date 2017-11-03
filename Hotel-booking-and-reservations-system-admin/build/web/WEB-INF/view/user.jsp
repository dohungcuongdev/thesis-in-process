<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="common/sub-content.jspf"%>


<div class="row">
    <div class="col-lg-4">
        <section class="panel">
            <header class="panel-heading" style="font-weight: bold; color:red">
                ${customer.name}
            </header>
            <div class="panel-body">
                <form role="form">
                    <div class="form-group"><strong>User Name</strong>: ${customer.username}</div>
                    <div class="form-group"><strong>Full Name</strong>: ${customer.name}</div>
                    <div class="form-group"><strong>Register Time</strong>: ${customer.registered_date}</div>
                    <div class="form-group"><strong>Phone Number</strong>: ${customer.phone}</div>
                    <div class="form-group"><strong>Address</strong>: ${customer.address}</div>
                </form>

            </div>
        </section>
        <!--chat start-->
        <section class="panel">
            <header class="panel-heading">
                Notes
            </header>
            <div class="panel-body">

                <div class="alert alert-info">
                    <strong>Booking!</strong> This is the booking request of this customer.
                </div>
                <div class="alert alert-block alert-danger">
                    <strong>Cancel!</strong> This is the room cancel request of this customer.
                </div>
                <div class="alert alert-success">
                    <strong>Register!</strong> This is the the registration of this customer.
                </div>
                <div class="alert alert-warning">
                    <strong>Feed Back!</strong> This is the feed back of this customer.
                </div>
            </div>
        </section>
    </div>
    <div class="col-md-8">
        <section class="panel">
            <header class="panel-heading">
                List of Activity
            </header>
            <div class="panel-body" id="activity-box">

                <c:forEach var="activity" items="${customer.activity}">
                    <c:if test="${activity.click.equals('feedback')}"> 
                        <div class="alert alert-block alert-warning">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button> 
                            <strong style="cursor: pointer" 
                                    onclick="location.href = '${pageContext.request.contextPath}/notification.htm'"> ${activity.time}! 
                            </strong>
                            <br>UserName: ${customer.username}
                            <br>Sent content: ${activity.content}
                        </div>
                    </c:if>
                    <c:if test="${activity.click.equals('register')}"> 
                        <div class="alert alert-block alert-success">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button> 
                            <strong style="cursor: pointer" 
                                    onclick="location.href = '${pageContext.request.contextPath}/notification.htm'"> ${activity.time}! 
                            </strong>
                            <br>UserName: ${customer.username}
                            <br>Received content: ${activity.content}
                        </div>
                    </c:if>
                    <c:if test="${activity.name.equals('Book Room')}"> 
                        <div class="alert alert-block alert-info">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button> 
                            <strong style="cursor: pointer" 
                                    onclick="location.href = '${pageContext.request.contextPath}/notification.htm'"> ${activity.time}! 
                            </strong>
                            <br>UserName: ${customer.username}
                            <br>Received content: ${activity.content}
                        </div>
                    </c:if>
                    <c:if test="${activity.name.equals('Cancel Room')}"> 
                        <div class="alert alert-block alert-danger">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button> 
                            <strong style="cursor: pointer" 
                                    onclick="location.href = '${pageContext.request.contextPath}/notification.htm'"> ${activity.time}! 
                            </strong>
                            <br>UserName: ${customer.username}
                            <br>Received content: ${activity.content}
                        </div>
                    </c:if>
                </c:forEach>


            </div>
        </section>

    </div>
</div>
<!--row1-->

<%@ include file="common/footer.jspf"%>