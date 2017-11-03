<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/sub-content.jspf"%>

<div class="row">
    <div class="col-xs-12">
        <div class="panel">
            <header class="panel-heading">
                Page Access Statistics with User IP: ${ip}

            </header>
            <!-- <div class="box-header"> -->
            <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

            <!-- </div> -->
            <div class="panel-body table-responsive">
                <div class="box-tools m-b-15">
                    <div class="input-group">
                        <input type="text" name="table_search" class="form-control input-sm pull-right" 
                               style="width: 150px;" id="myInput1" onkeyup="searchInputTable('myInput1', 'myTable1')" 
                               placeholder="Search for page access.." title="Type in a page access"/>
                        <div class="input-group-btn">
                            <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
                <table id="myTable1">
                    <tr>
                        <th style="cursor: pointer" onclick="sortNum(0, 'myTable1')">No.</th>
                        <th style="cursor: pointer" onclick="sortAlpha(2, 'myTable1')">Page Access</th>
                        <th style="cursor: pointer" onclick="sortAlpha(1, 'myTable1')">IP Address</th>
                        <th style="cursor: pointer" onclick="sortNum(3, 'myTable1')">Visit Times</th>
                    </tr>

                    <c:forEach var="map" items="${mapFollowUserIP}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${map.key}</td>
                            <td>${ip}</td>
                            <td>${map.value}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
</div>

<div class="row">
    <div class="col-xs-12">
        <div class="panel">
            <header class="panel-heading">
                Follow Users

            </header>
            <!-- <div class="box-header"> -->
            <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

            <!-- </div> -->
            <div class="panel-body table-responsive">
                <div class="box-tools m-b-15">
                    <div class="input-group">
                        <input type="text" name="table_search" class="form-control input-sm pull-right" 
                               style="width: 150px;" id="myInput2" onkeyup="searchInputTable('myInput2', 'myTable2')" 
                               placeholder="Search for ip address.." title="Type in a ip address"/>
                        <div class="input-group-btn">
                            <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
                <table id="myTable2">
                    <tr>
                        <th style="cursor: pointer" onclick="sortNum(0, 'myTable2')">No.</th>
                        <th style="cursor: pointer" onclick="sortAlpha(1, 'myTable2')">User IP Address</th>
                        <th style="cursor: pointer" onclick="sortAlpha(2, 'myTable2')">External IP Address</th>
                        <th style="cursor: pointer" onclick="sortAlpha(3, 'myTable2')">Country</th>
                        <th style="cursor: pointer" onclick="sortAlpha(4, 'myTable2')">User</th>
                        <th style="cursor: pointer" onclick="sortDate(5, 'myTable2')">Date Access</th>
                        <th style="cursor: pointer" onclick="sortAlpha(6, 'myTable2')">Page Access</th>
                        <th style="cursor: pointer" onclick="sortAlpha(7, 'myTable2')">Duration</th>
                    </tr>

                    <c:forEach var="user" items="${listFollowUsers}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/follow-user-ip/${user.user_ip_address}.htm'">${user.user_ip_address}</td>
                            <td style="cursor: pointer" onclick="location.href = 'http://whatismyipaddress.com/ip/${user.external_ip_address}'">${user.external_ip_address}</td>
                            <td>${user.country}</td>
                            <c:if test="${user.username == null}"> 
                                <td>guest</td>
                            </c:if>
                            <c:if test="${user.username != null}"> 
                                <td style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/user/${user.username}.htm'">${user.username}</td>
                            </c:if>
                            <td>${user.date_access}</td>
                            <td>${user.page_access}</td>
                            <td>${user.durationTime}</td>
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