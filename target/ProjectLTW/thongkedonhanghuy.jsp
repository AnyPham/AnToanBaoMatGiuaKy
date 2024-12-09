<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Order> listOrdersCancel = (List<Order>) request.getAttribute("listOrdersCancel");
    if (listOrdersCancel == null) listOrdersCancel = new ArrayList<>();
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>

<% String startDateConverted = (String) session.getAttribute("startDateConverted");%>
<% String endDateConverted = (String) session.getAttribute("endDateConverted"); %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đơn hàng huỷ</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <jsp:include page="cssDatatable.jsp" />
    <style>
        .icon-wrapper {
            margin-top: 2px;
            background-color: #4a90e2;
            display: inline-block;
            margin-right: 10px;
            padding: 5px;
            border-radius: 50%;
        }
        .icon-wrapper i {
            color: #ffffff;
        }
    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<section class="home-section">
    <div class="home-content">
        <div class="manager-product">
            <div class="" style="margin-bottom: 20px">
                <form action="./donHangStartEndHuy" method="post">
                    <label for="start-date">Ngày bắt đầu:</label>
                    <input type="date" id="start-date" name="start-date" required>
                    <br><br>
                    <label for="end-date">Ngày kết thúc:</label>
                    <input type="date" id="end-date" name="end-date" required>
                    <br><br>
                    <input type="submit" value="Thống kê">
                </form>
            </div>
            <div class="title">
                <% if (startDateConverted != null && endDateConverted != null) { %>
                Đơn hàng huỷ từ <%= startDateConverted %> đến <%= endDateConverted %>
                <% } else { %>
                Thống kê Đơn hàng huỷ gần đây
                <% } %>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table id="table-id" class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Mã đơn hàng</th>
                            <th scope="col">Tên Khách Hàng</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col">Ngày đặt</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Tổng tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (Order order : listOrdersCancel) {%>
                        <tr>
                            <th scope="row"><%=order.getId()%>
                            </th>
                            <td><%=UserService.getFullNameById(order.getUser_id())%>
                            </td>
                            <td><%=order.getAddress()%>
                            </td>
                            <td><%=order.getOrder_date()%>
                            </td>
                            <td><%=order.getPhone()%>
                            </td>
                            <td><%=order.getStatus()%>
                            </td>
                            <td><%=numberFormat.format(order.getTotal_money())%></td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="./js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-2.0.8/datatables.min.js"></script>
<jsp:include page="jsDatatable.jsp" />
<script>
    new DataTable('#table-id', {
        layout: {
            topStart: {
                buttons: [
                    {
                        extend: 'excel',

                    },
                    {
                        extend: 'pdf',

                    },
                    {
                        extend: 'print',

                    },

                ]
            }
        },

    });
</script>

</body>
</html>
