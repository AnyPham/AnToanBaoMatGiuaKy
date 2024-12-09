<%@ page import="model.Order" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderDetail" %>
<%@ page import="service.OrderDetailService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="service.VoucherService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Order order = (Order) session.getAttribute("order");
    if (order == null) order = new Order();
    User user = UserDAO.getUserById(order.getUser_id());
    List<OrderDetail> orderDetails = OrderDetailService.getInstance().getOrderDetailByIdOrder(order.getId());
    if (orderDetails == null) orderDetails = new ArrayList<OrderDetail>();
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/checkout.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
                        <button class="tablinks col-sm-2" id="defaultOpen" onclick="openCity(event, 'tab1')">Chi tiết
                            đơn hàng
                        </button>

                    </div>
                    <div id="tab1" class="tabcontent">
                        <p><span style="font-weight: bold">Tên người nhận: </span> <%=order.getName()%></p>
                        <p><span style="font-weight: bold">Số điện thoại: </span> <%=order.getPhone()%></p>
                        <p><span style="font-weight: bold">Ngày đặt hàng: </span> <%=order.getOrder_date()%></p>
                        <p><span style="font-weight: bold">Địa chỉ: </span> <%=order.getAddress()%></p>
                        <div class="card"><div class="card-body"><table class="table">
                                    <thead>
                                    <tr>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Giá tiền</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Thành tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (OrderDetail o : orderDetails) {
                                            Product product = ProductService.getInstance().getById(o.getProduct_id());
                                    %>
                                    <tr>
                                        <th style="font-weight: normal" scope="row"><%=product.getTitle()%></th>
                                        <td><a><%=numberFormat.format(product.getDiscount_price())%><sup>đ</sup></a></td>
                                        <td><a><%=o.getQuantity()%>
                                        </a></td>
                                        <td><%=numberFormat.format(o.getTotal_money())%><sup>đ</sup></td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <p style="margin-left: 835px; color: red"><span style="font-weight: bold">Phí giao hàng: </span>
                            0<sup>đ</sup></p>
                        <p style="margin-left: 835px; color: red"><span style="font-weight: bold">Khuyến mãi: </span>
                            <%=VoucherService.getInstance().getVoucherById(order.getVoucher_id()).getVoucher_name()%></p>
                        <p style="margin-left: 835px; color: red"><span style="font-weight: bold">Tổng tiền: </span>
                           <%=numberFormat.format(order.getTotal_money())%><sup>đ</sup></p>
                    </div>


                </div>
            </div>
        </div>
    </div>
</section>


<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/pageAdmin_main.js"></script>
<script>

    // $("#table-id-1").DataTable();

</script>

</body>
</html>
