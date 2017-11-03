<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/sub-content.jspf"%>


<div class="row">
    <div class="col-xs-12">
        <div class="panel">
            <header class="panel-heading">
                Manage Customers

            </header>
            <!-- <div class="box-header"> -->
            <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

            <!-- </div> -->
            <div class="panel-body table-responsive">
                <div class="box-tools m-b-15">
                    <div class="input-group">
                        <input type="text" name="table_search" class="form-control input-sm pull-right" 
                               style="width: 150px;" id="myInput" onkeyup="search()" 
                               placeholder="Search for names.." title="Type in a name"/>
                        <div class="input-group-btn">
                            <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
                <table id="myTable">
                    <tr>
                        <th style="cursor: pointer" onclick="sortNum(0,'myTable')">No.</th>
                        <th style="cursor: pointer" onclick="sortAlpha(1,'myTable')">User</th>
                        <th style="cursor: pointer" onclick="sortDate(2,'myTable')">Register Time</th>
                        <th style="cursor: pointer" onclick="sortAlpha(3,'myTable')">Full Name</th>
                        <th style="cursor: pointer" onclick="sortAlpha(4,'myTable')">Phone</th>
                        <th style="cursor: pointer" onclick="sortAlpha(5,'myTable')">Address</th>
                        <th style="cursor: pointer" onclick="sortNum(6,'myTable')">Total Dates Visited</th>
                        <th>View</th>
                        <th>Del</th>
                        <th>Ban</th>
                    </tr>

                    <c:forEach var="user" items="${listusers}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${user.username}</td>
                            <td>${user.registered_date}</td>
                            <td>${user.name}</td>
                            <td><span class="label label-success">${user.phone}</span></td>
                            <td>${user.address}</td>
                            <td>${user.dateVisit.size()}</td>
                            <td><button onclick="location.href = '${pageContext.request.contextPath}/user/${user.username}.htm'" class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-ban"></i></button></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
</div>
<%@ include file="common/footer.jspf"%>