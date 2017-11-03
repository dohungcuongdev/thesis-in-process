<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common/sub-content.jspf"%>


<!--<div class="row">

    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                Orders Request
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
            <div class="panel-body table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Order Time</th>
                            <th>Service</th>
                            <th>Type</th>
                            <th>Price</th>
                            <th>Deposit</th>
                            <th>View</th>
                            <th>Edit</th>
                            <th>Del</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-danger">Hambuger</span></td>
                            <td><span class="label label-danger">Food</span></td>
                            <td><span class="label label-danger">100$</span></td>
                            <td><span class="badge badge-danger">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-info">Hambuger</span></td>
                            <td><span class="label label-info">Food</span></td>
                            <td><span class="label label-info">100$</span></td>
                            <td><span class="badge badge-info">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-warning">Hambuger</span></td>
                            <td><span class="label label-warning">Food</span></td>
                            <td><span class="label label-warning">100$</span></td>
                            <td><span class="badge badge-warning">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-success">Hambuger</span></td>
                            <td><span class="label label-success">Food</span></td>
                            <td><span class="label label-success">100$</span></td>
                            <td><span class="badge badge-success">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                    </tbody>
                </table>

                <div class="table-foot">
                    <ul class="pagination pagination-sm no-margin pull-right">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </section>


    </div>

</div>-->

<div class="row">
    <div class="col-xs-12">
        <div class="panel">
            <header class="panel-heading">
                Manage Restaurant and Hotel Services

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
            <div class="panel-body table-responsive" id="manage-services-box">
                <table id="myTable">
                    <tr>
                        <th style="cursor: pointer" onclick="sortAlpha(0,'myTable')">No.</th>
                        <th style="cursor: pointer" onclick="sortAlpha(1,'myTable')">Name</th>
                        <th style="cursor: pointer" onclick="sortAlpha(2,'myTable')">Type</th>
                        <th style="cursor: pointer" onclick="sortNum(3,'myTable')">Pirce($)</th>
                        <th style="cursor: pointer" onclick="sortNum(4,'myTable')">Quantity</th>
                        <th style="cursor: pointer" onclick="sortAlpha(5,'myTable')">Note</th>
                        <th>View</th>
                        <th>Edit</th>
                        <th>Del</th>
                    </tr>
                    <c:forEach var="service" items="${listservices}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${service.name}</td>
                            <c:if test="${service.type.equalsIgnoreCase('ice-cream')}">  
                                <td><span style="font-size: 14px" class="label label-danger">${service.type}</span></td>
                                </c:if>   
                                <c:if test="${service.type.equalsIgnoreCase('drink')}">  
                                <td><span style="font-size: 14px" class="label label-success">${service.type}</span></td>
                                </c:if> 
                                <c:if test="${service.type.equalsIgnoreCase('food')}">  
                                <td><span style="font-size: 14px" class="label label-primary">${service.type}</span></td>
                                </c:if>
                                <c:if test="${service.type.equalsIgnoreCase('fruit')}">  
                                <td><span style="font-size: 14px" class="label label-warning">${service.type}</span></td>
                                </c:if>  
                            <td>${service.price}</td>
                            <td>${service.quantity}</td>
                            <td>${service.note}</td>
                            <td><button onclick="location.href = '${pageContext.request.contextPath}/service/${service.name}.htm'" class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button onclick="location.href = '${pageContext.request.contextPath}/edit-service/${service.name}.htm'" class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button onclick ="deleteService('${service.name}')" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
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
            swal("Deleted!", "The service has been deleted.", "success");
            window.history.pushState("string", "Hotel Admin", "${pageContext.request.contextPath}/manage-restaurant.htm");
        }
    };
</script>