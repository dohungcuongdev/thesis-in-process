<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="common/sub-content.jspf"%>

<!-- Main row -->
<div class="row">

    <div class="col-md-8">
        <!--earning graph start-->
        <section class="panel">
            <header class="panel-heading">
                Earning Graph 6 months
            </header>
            <div class="panel-body">
                <canvas id="linechart" width="600" height="330"></canvas>
            </div>
        </section>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugins/chart.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                "use strict";
                //BAR CHART
                var data = {
                    labels: ["January", "February", "March", "April", "May", "June", "July"],
                    datasets: [
                        {
                            label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [65, 59, 80, 81, 56, 55, 40]
                        },
                        {
                            label: "My Second dataset",
                            fillColor: "rgba(151,187,205,0.2)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(151,187,205,1)",
                            data: [28, 48, 40, 19, 86, 27, 90]
                        }
                    ]
                };
                new Chart(document.getElementById("linechart").getContext("2d")).Line(data, {
                    responsive: true,
                    maintainAspectRatio: false,
                });

            });
            // Chart.defaults.global.responsive = true;
        </script>
        <!--earning graph end-->

    </div>
    <div class="col-md-4">
        <div class="panel">
            <header class="panel-heading">
                Statistical Data

            </header>
            <div class="panel-body">
                <table id="myTable">
                    <tr>
                        <th style="width: 10px">No.</th>
                        <th>Data</th>
                        <th>Quantity</th>
                        <th style="width: 40px">Percent</th>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>Users</td>
                        <td>
                            50
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-danger" style="width: 10%"></div>
                            </div>
                        </td>
                        <td><span class="badge bg-red">10%</span></td>
                    </tr>
                    <tr>
                        <td>2.</td>
                        <td>Message</td>
                        <td>
                            1000
                            <div class="progress xs">
                                <div class="progress-bar progress-bar-warning" style="width: 75%"></div>
                            </div>
                        </td>
                        <td><span class="badge bg-yellow">75%</span></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td>Booking</td>
                        <td>
                            1000
                            <div class="progress xs progress-striped active">
                                <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                            </div>
                        </td>
                        <td><span class="badge bg-light-blue">30%</span></td>
                    </tr>
                    <tr>
                        <td>4.</td>
                        <td>Rooms</td>
                        <td>
                            1000
                            <div class="progress xs progress-striped active">
                                <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                            </div>
                        </td>
                        <td><span class="badge bg-green">90%</span></td>
                    </tr>
                    <tr>
                        <td>5.</td>
                        <td>Orders</td>
                        <td>
                            1000
                            <div class="progress xs progress-striped active">
                                <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                            </div>
                        </td>
                        <td><span class="badge bg-red">90%</span></td>
                    </tr>
                    <tr>
                        <td>6.</td>
                        <td>Services</td>
                        <td>
                            1000
                            <div class="progress xs progress-striped active">
                                <div class="progress-bar progress-bar-warning" style="width: 90%"></div>
                            </div>
                        </td>
                        <td><span class="badge bg-yellow">90%</span></td>
                    </tr>
                </table>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</div>



<div class="row">

    <div class="col-md-8">
        <section class="panel">
            <header class="panel-heading">
                Notifications
            </header>
            <div class="panel-body" id="noti-box">

                <div class="alert alert-block alert-danger">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                User cuongvip1295@yahoo.com.vn booked the 101.
                </div>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                A new user signed in with username cuongvip1295@yahoo.com.vn.
                </div>
                <div class="alert alert-info">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                A guess with email cuongvip1295@yahoo.com.vn send a reservation resquest.
                </div>
                <div class="alert alert-warning">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                A customer send a contact message.
                </div>


                <div class="alert alert-block alert-danger">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                User cuongvip1295@yahoo.com.vn booked the 101.
                </div>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                A new user signed in with username cuongvip1295@yahoo.com.vn.
                </div>
                <div class="alert alert-info">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                A guess with email cuongvip1295@yahoo.com.vn send a reservation resquest.
                </div>
                <div class="alert alert-warning">
                    <button data-dismiss="alert" class="close close-sm" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong style="cursor: pointer" onclick="location.href = '${pageContext.request.contextPath}/notification.htm'">Sunday, July 16,2017 5:16:30pm!</strong>                                A customer send a contact message.
                </div>


            </div>
        </section>

    </div>
    <div class="col-lg-4">

        <!--chat start-->
        <section class="panel">
            <header class="panel-heading">
                Notes
            </header>
            <div class="panel-body" id="noti-box">

                <div class="alert alert-block alert-danger">
                    <strong>Important!</strong> This is the booking request of a membership.
                </div>
                <div class="alert alert-success">
                    <strong>Register!</strong> This is the the registration of a customer.
                </div>
                <div class="alert alert-info">
                    <strong>Reservation!</strong> This is the reservation request of a guest.
                </div>
                <div class="alert alert-warning">
                    <strong>Contact!</strong> This is a contact message of a customer.
                </div>

            </div>
        </section>



    </div>


</div>
<div class="row">

    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                Booking Request
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
                            <th>Check in</th>
                            <th>Check out</th>
                            <th>Room</th>
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
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-danger">101</span></td>
                            <td><span class="label label-danger">Deluxe</span></td>
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
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-info">101</span></td>
                            <td><span class="label label-info">Deluxe</span></td>
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
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-success">101</span></td>
                            <td><span class="label label-success">Deluxe</span></td>
                            <td><span class="label label-success">100$</span></td>
                            <td><span class="badge badge-success">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-warning">101</span></td>
                            <td><span class="label label-warning">Deluxe</span></td>
                            <td><span class="label label-warning">$100</span></td>
                            <td><span class="badge badge-warning">75%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-danger">101</span></td>
                            <td><span class="label label-danger">Deluxe</span></td>
                            <td><span class="label label-danger">100$</span></td>
                            <td><span class="badge badge-danger">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-info">101</span></td>
                            <td><span class="label label-info">Deluxe</span></td>
                            <td><span class="label label-info">100$</span></td>
                            <td><span class="badge badge-info">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-success">101</span></td>
                            <td><span class="label label-success">Deluxe</span></td>
                            <td><span class="label label-success">100$</span></td>
                            <td><span class="badge badge-success">50%</span></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                            <td><button class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>cuongvip1295@yahoo.com.vn</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td>Sunday, ‎July ‎16, ‎2017: 5:16:30pm</td>
                            <td><span class="label label-warning">101</span></td>
                            <td><span class="label label-warning">Deluxe</span></td>
                            <td><span class="label label-warning">$100</span></td>
                            <td><span class="badge badge-warning">75%</span></td>
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

</div>

<!-- row end -->

<!-- /.content -->


<%@ include file="common/footer.jspf"%>