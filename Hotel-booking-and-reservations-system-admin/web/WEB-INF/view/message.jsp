<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/sub-content.jspf"%>

<!-- Main row -->
<div class="row">

    <div class="col-md-8" id="all-notifications">
        <section class="panel">
            <header class="panel-heading">
                Notifications
            </header>
            <div class="panel-body" id="noti-box">
                <c:choose>
                    <c:when test="${newNotifications.size() <= 0}"> 
                        <div class="alert alert-block alert-danger" style="text-align: center">
                            <strong>No notification available!</strong> 
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="activity" items="${newNotifications}">
                            <c:if test="${activity.click.equals('feedback')}"> 
                                <div class="alert alert-block alert-info">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/notification/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>UserName: ${activity.username}
                                    <br>Sent content: ${activity.content}
                                </div>
                            </c:if>
                            <c:if test="${activity.click.equals('register')}"> 
                                <div class="alert alert-block alert-success">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/reply-register/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>UserName: ${activity.username}
                                    <br>Received content: ${activity.content}
                                </div>
                            </c:if>
                            <c:if test="${activity.name.equals('Book Room') || activity.name.equals('Cancel Room')}"> 
                                <div class="alert alert-block alert-danger">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/reply ${activity.name}/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>UserName: ${activity.username}
                                    <br>Received content: ${activity.content}
                                </div>
                            </c:if>
                            <c:if test="${activity.click.equals('contact') || activity.click.equals('reservation')}"> 
                                <div class="alert alert-block alert-warning">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/reply-${activity.click}/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>${activity.username}
                                    <br>Sent content: ${activity.content}
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>



            </div>
        </section>

    </div>
    <%@ include file="common/mes-note.jspf"%>


</div>


<!-- Main row -->
<div class="row" id="all-message">

    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                All Message
            </header>

            <div class="box-tools m-b-15">
                <div class="input-group">
                    <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"
                           />
                    <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div>
            <div class="panel-body" id="all-message-box">

                <c:choose>
                    <c:when test="${listactivily.size() <= 0}"> 
                        <div class="alert alert-block alert-danger" style="text-align: center">
                            <strong>No notification available!</strong> 
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="activity" items="${listactivily}">
                            <c:if test="${activity.click.equals('feedback')}"> 
                                <div class="alert alert-block alert-info">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/notification/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>UserName: ${activity.username}
                                    <br>Sent content: ${activity.content}
                                </div>
                            </c:if>
                            <c:if test="${activity.click.equals('register')}"> 
                                <div class="alert alert-block alert-success">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/reply-register/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>UserName: ${activity.username}
                                    <br>Received content: ${activity.content}
                                </div>
                            </c:if>
                            <c:if test="${activity.name.equals('Book Room') || activity.name.equals('Cancel Room')}"> 
                                <div class="alert alert-block alert-danger">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/reply ${activity.name}/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>UserName: ${activity.username}
                                    <br>Received content: ${activity.content}
                                </div>
                            </c:if>
                            <c:if test="${activity.click.equals('contact') || activity.click.equals('reservation')}"> 
                                <div class="alert alert-block alert-warning">
                                    <button data-dismiss="alert" class="close close-sm" type="button">
                                        <i class="fa fa-times"></i>
                                    </button> 
                                    <strong style="cursor: pointer" 
                                            onclick="location.href = '${pageContext.request.contextPath}/reply-${activity.click}/${activity.id}.htm'"> ${activity.time}! 
                                    </strong>
                                    <br>${activity.username}
                                    <br>Sent content: ${activity.content}
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>



            </div>
        </section>

    </div>


</div>
<!-- row end -->
<%@ include file="common/footer.jspf"%>