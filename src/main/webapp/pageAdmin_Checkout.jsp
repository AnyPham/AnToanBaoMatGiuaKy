<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Order> listOrderWaitConfirm = (List<Order>) session.getAttribute("listOrderWaitConfirm");
    if (listOrderWaitConfirm == null) listOrderWaitConfirm = new ArrayList<>();
    List<Order> listOrderConfirm = (List<Order>) session.getAttribute("listOrderConfirm");
    if (listOrderConfirm == null) listOrderConfirm = new ArrayList<>();
    List<Order> listOrderTransport = (List<Order>) session.getAttribute("listOrderTransport");
    if (listOrderTransport == null) listOrderTransport = new ArrayList<>();
    List<Order> listOrderTransported = (List<Order>) session.getAttribute("listOrderTransported");
    if (listOrderTransported == null) listOrderTransported = new ArrayList<>();
    List<Order> listOrderCancel = (List<Order>) session.getAttribute("listOrderCancel");
    if (listOrderCancel == null) listOrderCancel = new ArrayList<>();
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
    <link rel="stylesheet" href="./css/style.css">
    <%--    <link rel="stylesheet" href="./css/checkout.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <jsp:include page="cssDatatable.jsp"/>
    <style>
        .icon-wrapper {
            margin-top: 2px;
            background-color: #4a90e2;
            display: inline-block;
            margin-right: 10px;
            padding: 5px; /* Điều này tạo khoảng trắng xung quanh biểu tượng */
            border-radius: 50%; /* Để tạo biểu tượng hình tròn */
        }

        .icon-wrapper i {
            color: #ffffff; /* Màu trắng cho biểu tượng */
        }
    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>


<section class="home-section">
    <div class="home-content">
        <div class="manager-checkout">
            <div class="title">Quản Lý Đơn Hàng</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tab row element-button">
                        <button class="tablinks col-sm-2" id="defaultOpen" onclick="openCity(event, 'tab1')">Chờ xác
                            nhận
                        </button>
                        <button class="tablinks col-sm-2" onclick="openCity(event, 'tab2')">Đã xác nhận</button>
                        <button class="tablinks col-sm-2" onclick="openCity(event, 'tab4')">Đang giao</button>
                        <button class="tablinks col-sm-2" onclick="openCity(event, 'tab5')">Đã giao</button>
                        <button class="tablinks col-sm-2" onclick="openCity(event, 'tab3')">Đã hủy</button>
                    </div>
                    <div id="tab1" class="tabcontent">
                        <table id="table-id-1" class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Chức năng</th>
                            </tr>
                            </thead>
                            <tbody id="body-table1">
                            <%
                                for (Order o : listOrderWaitConfirm) {
                                    User user = UserDAO.getUserById(o.getUser_id());
                            %>
                            <tr>
                                <th scope="row"><%=o.getId()%>
                                </th>
                                <td><%=user.getFullName()%>
                                </td>
                                <td><%=o.getOrder_date()%>
                                </td>
                                <td><%=o.getAddress()%>
                                </td>
                                <td><%=numberFormat.format(o.getTotal_money())%><sup>đ</sup></td>
                                <td>
                                    <a title="xem chi tiết đơn hàng"
                                       href="page-admin-check-detail?order_id=<%=o.getId()%>" class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-search"></i> <!-- Biểu tượng kính lúp -->
                                        </i>
                                    </a>
                                    <button style="border: none; background: none;" tsitle="Xác nhận đơn hàng"
                                            onclick="confirmOrder(<%=o.getId()%>)" class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-check"></i>
                                        </i>
                                    </button>
                                    <%--    adminCancelOrder?order_id=<%=o.getId()%>&page_id=1--%>
                                    <button style="border: none; background: none;" title="hủy đơn hàng"
                                            onclick="cancelOrder(<%=o.getId()%>)"
                                            class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-trash-alt"></i> <!-- Biểu tượng thùng rác -->
                                        </i>
                                    </button>
                                </td>
                            </tr>
                            <%}%>

                            </tbody>
                        </table>
                    </div>

                    <div id="tab2" class="tabcontent">
                        <table style="width: 100%" id="table-id-2" class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Chức năng</th>


                            </tr>
                            </thead>
                            <tbody id="body-table2">
                            <%
                                for (Order o : listOrderConfirm) {
                                    User user = UserDAO.getUserById(o.getUser_id());
                            %>
                            <tr>
                                <th scope="row"><%=o.getId()%>
                                </th>
                                <td><%=user.getFullName()%>
                                </td>
                                <td><%=o.getOrder_date()%>
                                </td>
                                <td><%=o.getAddress()%>
                                </td>

                                <td><%=numberFormat.format(o.getTotal_money())%><sup>đ</sup></td>
                                <td>
                                    <a title="xem chi tiết đơn hàng"
                                       href="page-admin-check-detail?order_id=<%=o.getId()%>" class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-search"></i> <!-- Biểu tượng kính lúp -->
                                        </i>
                                    </a>
                                    <a title="giao hàng" href="transportOrder?order_id=<%=o.getId()%>"
                                       class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-check"></i> <!-- Biểu tượng thùng rác -->
                                        </i>
                                    </a>
                                    <a title="hủy đơn hàng" href="adminCancelOrder?order_id=<%=o.getId()%>&page_id=1"
                                       class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-trash-alt"></i> <!-- Biểu tượng thùng rác -->
                                        </i>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>

                    <div id="tab3" class="tabcontent">
                        <table style="width: 100%" id="table-id" class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Chức năng</th>
                            </tr>
                            </thead>
                            <tbody id="body-cancel">
                            <%
                                for (Order o : listOrderCancel) {
                                    User user = UserDAO.getUserById(o.getUser_id());
                            %>
                            <tr>
                                <th scope="row"><%=o.getId()%>
                                </th>
                                <td><%=user.getFullName()%>
                                </td>
                                <td><%=o.getOrder_date()%>
                                </td>
                                <td><%=o.getAddress()%>
                                </td>

                                <td><%=numberFormat.format(o.getTotal_money())%><sup>đ</sup></td>
                                <td>
                                    <a title="xem chi tiết đơn hàng"
                                       href="page-admin-check-detail?order_id=<%=o.getId()%>" class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-search"></i> <!-- Biểu tượng kính lúp -->
                                        </i>
                                    </a>

                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div id="tab4" class="tabcontent">
                        <table style="width: 100%" id="table-id-4" class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Chức năng</th>


                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Order o : listOrderTransport) {
                                    User user = UserDAO.getUserById(o.getUser_id());
                            %>
                            <tr>
                                <th scope="row"><%=o.getId()%>
                                </th>
                                <td><%=user.getFullName()%>
                                </td>
                                <td><%=o.getOrder_date()%>
                                </td>
                                <td><%=o.getAddress()%>
                                </td>

                                <td><%=numberFormat.format(o.getTotal_money())%><sup>đ</sup></td>
                                <td>
                                    <a title="xem chi tiết đơn hàng"
                                       href="page-admin-check-detail?order_id=<%=o.getId()%>" class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-search"></i> <!-- Biểu tượng kính lúp -->
                                        </i>
                                    </a>
                                    <a title="giao hàng" href="transportedOrder?order_id=<%=o.getId()%>"
                                       class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-check"></i> <!-- Biểu tượng thùng rác -->
                                        </i>
                                    </a>
                                    <a title="hủy đơn hàng" href="adminCancelOrder?order_id=<%=o.getId()%>&page_id=1"
                                       class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-trash-alt"></i> <!-- Biểu tượng thùng rác -->
                                        </i>
                                    </a>
                                </td>
                            </tr>
                            <%}%>

                            </tbody>
                        </table>
                    </div>
                    <div id="tab5" class="tabcontent">
                        <table style="width: 100%" id="table-id-5" class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Chức năng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Order o : listOrderTransported) {
                                    User user = UserDAO.getUserById(o.getUser_id());
                            %>
                            <tr>
                                <th scope="row"><%=o.getId()%>
                                </th>
                                <td><%=user.getFullName()%>
                                </td>
                                <td><%=o.getOrder_date()%>
                                </td>
                                <td><%=o.getAddress()%>
                                </td>

                                <td><%=numberFormat.format(o.getTotal_money())%><sup>đ</sup></td>
                                <td>
                                    <a title="xem chi tiết đơn hàng"
                                       href="page-admin-check-detail?order_id=<%=o.getId()%>" class="icon-link">
                                        <i class="icon-wrapper">
                                            <i class="fas fa-search"></i> <!-- Biểu tượng kính lúp -->
                                        </i>
                                    </a>
                                </td>
                            </tr>
                            <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<script src="./js/pageAdmin_main.js"></script>
<jsp:include page="jsDatatable.jsp"/>

<script>
    let table1 = $("#table-id-1").DataTable();
    let table2 = $("#table-id-2").DataTable();
    let table3 = $("#table-id").DataTable();
    let table4 = $("#table-id-4").DataTable();
    let table5 = $("#table-id-5").DataTable();

    function cancelOrder(order_id) {
        $.ajax({
            url: '/ProjectLTW_war/adminCancelOrder',
            type: "POST",
            data: {
                order_id: order_id
            },
            success: function (response) {
                var index = null;
                var data = table1.column(0).data();
                for (i = 0; i < data.length; i++) {
                    if (parseInt(order_id) === parseInt(data[i])) {
                        index = i;
                        break;
                    }
                }
                if (index !== null) {
                    table1.row(index).remove().draw();
                }
                var body = document.getElementById('body-cancel')
                body.innerHTML = response;
            },
            error: function (error) {
            }
        });
    }

    function confirmOrder(order_id) {
        $.ajax({
            url: '/ProjectLTW_war/confirmOrder',
            type: "POST",
            data: {
                order_id: order_id
            },
            success: function (response) {
                var index = null;
                var data = table1.column(0).data();
                for (i = 0; i < data.length; i++) {
                    if (parseInt(order_id) === parseInt(data[i])) {
                        index = i;
                        break;
                    }
                }
                if (index !== null) {
                    table1.row(index).remove().draw();
                }
                var body = document.getElementById('body-table2')
                body.innerHTML = response;
            },
            error: function (error) {
            }
        });
    }

</script>

</body>
</html>
