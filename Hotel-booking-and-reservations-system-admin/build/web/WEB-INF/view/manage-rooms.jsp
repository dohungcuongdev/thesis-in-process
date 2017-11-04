<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/sub-content.jspf"%>


<div class="row">
    <div class="col-xs-12">
        <div class="panel">
            <header class="panel-heading">
                Manage Rooms

            </header>
            <!-- <div class="box-header"> -->
            <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

            <!-- </div> -->
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
            <div class="panel-body table-responsive" id="manage-rooms-box">    
                <table id="myTable">
                    <tr>
                        <th style="cursor: pointer" onclick="sortNum(0,'myTable')">No.</th>
                        <th style="cursor: pointer" onclick="sortAlpha(1,'myTable')">Room</th>
                        <th style="cursor: pointer" onclick="sortAlpha(2,'myTable')">Type</th>
                        <th style="cursor: pointer" onclick="sortNum(3,'myTable')">Size(sq)</th>
                        <th style="cursor: pointer" onclick="sortNum(4,'myTable')">Price($/day)</th>
                        <th style="cursor: pointer" onclick="sortAlpha(5,'myTable')">Status</th>
                        <th style="cursor: pointer" onclick="sortNum(6,'myTable')">No. of Adults</th>
                        <th style="cursor: pointer" onclick="sortNum(7,'myTable')">Amenities</th>
                        <th>View</th>
                        <th>Edit</th>
                        <th>Del</th>
                    </tr>

                    <c:forEach var="room" items="${listrooms}" varStatus="loop">

                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${room.name}</td>
                            <c:if test="${room.type.equalsIgnoreCase('deluxe')}">  
                                <td><span style="font-size: 14px" class="label label-danger">${room.type}</span></td>
                                </c:if>   
                                <c:if test="${room.type.equalsIgnoreCase('family')}">  
                                <td><span style="font-size: 14px" class="label label-success">${room.type}</span></td>
                                </c:if> 
                                <c:if test="${room.type.equalsIgnoreCase('couple')}">  
                                <td><span style="font-size: 14px" class="label label-primary">${room.type}</span></td>
                                </c:if>
                                <c:if test="${room.type.equalsIgnoreCase('single')}">  
                                <td><span style="font-size: 14px" class="label label-warning">${room.type}</span></td>
                                </c:if>  
                            <td>${room.size}</td>
                            <td>${room.price}</td>
                            <td>${room.status}</td>
                            <td align="center">${room.numpeople}</td>
                            <td>${room.avgAminities}</td>
                            <td><button onclick="location.href = '${pageContext.request.contextPath}/room/${room.name}.htm'" class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button onclick="location.href = '${pageContext.request.contextPath}/edit-room/${room.name}.htm'" class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button onclick="deleteRoom('${room.name}')" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
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
<script>
    window.onload = function () { //first loat page
        var r = '${deleteResult}';
        if (r !== undefined && r === "success") {
            swal("Deleted!", "The room has been deleted.", "success");
            window.history.pushState("string", "Hotel Admin", "${pageContext.request.contextPath}/manage-rooms.htm");
        }
    };
</script>