<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.OrderDetail" %>
<%@ page import="service.OrderDetailService" %>
<%@ page import="model.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22/01/2024
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Order> orders = (List<Order>) session.getAttribute("orders");
    if (orders == null) orders = new ArrayList<>();
    System.out.println(orders);
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đơn hàng đã mua</title>
    <link rel="stylesheet" href="./css/ordered.css">
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="header.jsp" %>
<div id="main">
    <div id="content">
        <div class="container">
            <div class="display">
                <div class="toolbar">
                    <h4><span><%=user.getSex()%> </span><%=user.getFullName()%>
                    </h4>
                    <div class="mini-menu-toolbar">
                        <div class="order-frame">
                            <i class="fa-solid fa-rectangle-list" style="color: #4cdda0;"></i>
                            <a href="" class="order">Đơn hàng đã mua</a>
                        </div>
                        <div class="infor-frame">
                            <i class="fa-solid fa-address-card"></i>
                            <a href="account-page" class="thong-tin-va-dia-chi">Thông tin và địa chỉ</a>
                        </div>
                        <div class="log-off">
                            <a href="logOutController" class="dang-xuat">Đăng xuất</a>
                        </div>
                    </div>
                </div>
                <div class="content-mini">
                    <div class="title">
                        <span class="title-ordered">Đơn hàng đã mua</span>
                    </div>
                    <%
                        for (Order order : orders) {

                    %>
                    <div class="content-small">
                        <div class="code-order">
                            <span class="text-code-order"><span>Đơn hàng: </span>#<%=order.getId()%></span>
                            <span class="condition"><%=order.getStatus()%></span>
                        </div>
                        <%List<OrderDetail> orderDetails = OrderDetailService.getInstance().getOrderDetailByIdOrder(order.getId());%>
                        <%for (OrderDetail orderDetail : orderDetails) {%>
                        <% Product product = ProductService.getInstance().getById(orderDetail.getProduct_id());
                            if (product == null) product = new Product();
                        %>
                        <div class="product">
                            <img src="<%=product.getImg()%>" alt="">
                            <div class="information-product">
                                <div class="product-value">
                                    <span class="name-product"><%=product.getTitle()%></span>
                                    <%--                                    <span class="purchase">Thanh toán online thất bại</span>--%>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <span style="    float: right;    font-size: 16px;" class="total">Tổng tiền: <span
                                class="money"><%=numberFormat.format(order.getTotal_money())%>₫</span></span>
                        <div class="btn-bot">
                            <a href="view-detail?order_id=<%=order.getId()%>" class="xem-chi-tiet">Xem chi tiết</a>
                            <%if (order.getStatus().equalsIgnoreCase("Chưa chọn phương thức thanh toán")) {%>
                            <a style="margin-left: 10px" href="paymentorderedpage.jsp?order_id=<%=order.getId()%>"
                               class="mua-lai">Thanh toán</a>
                            <%}%>
                            <% if (!"Đã hủy".equalsIgnoreCase(order.getStatus()) && !"Đơn hàng đã giao".equalsIgnoreCase(order.getStatus()) && !"Thanh toán bằng ngân hàng thành công".equalsIgnoreCase(order.getStatus())) { %>
                            <a href="cancel-order?order_id=<%=order.getId()%>" class="mua-lai">Hủy đơn hàng</a>
                            <% } %>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>

</div>
<%@include file="footer.jsp" %>
<!--Phần tỉnh thành-->
<div class="modal-tinh-thanh js-modal-tinh-thanh">
    <div class="modal-container js-modal-container">
        <div class="header-modal">
            <div class="title-modal">
                <p>Quý khách vui lòng cho biết <span>Địa Chỉ Nhận Hàng </span>để biết chính xác thời gian dao hàng</p>
                <a class="js-close"><i class="fa-solid fa-x fa-2xs" style="color: #ffffff;"></i></i>Đóng</a>
            </div>
            <form action="">
                <input type="text" placeholder="Tìm nhanh tỉnh thành, quận huyện, phường xã" class="tim-khu-vuc">
                <div class="icon-mini">
                    <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                </div>
            </form>
        </div>
        <div class="content-big">
            <div class="content-modal">
                <p class="title">Hoặc chọn tỉnh, thành phố</p>
                <ul class="list-tinh-thanh">
                    <li><a href="">Hồ Chí Minh</a></li>
                    <li><a href="">Hà Nội</a></li>
                    <li><a href="">Đà Nẵng</a></li>
                    <li><a href="">An Giang</a></li>
                    <li><a href="">Bà Rịa - Vũng Tàu</a></li>
                    <li><a href="">Bắc Giang</a></li>
                    <li><a href="">Bắc Kạn</a></li>
                    <li><a href="">Bạc Liêu</a></li>
                    <li><a href="">Bắc Ninh</a></li>
                    <li><a href="">Bến Tre</a></li>
                    <li><a href="">Bình Định</a></li>
                    <li><a href="">Bình Dương</a></li>
                    <li><a href="">Bình Phước</a></li>
                    <li><a href="">Bình Thuận</a></li>
                    <li><a href="">Cà Mau</a></li>
                    <li><a href="">Cần Thơ</a></li>
                    <li><a href="">Cao Bằng</a></li>
                    <li><a href="">Đắk Lắk</a></li>
                    <li><a href="">Đắk Nông</a></li>
                    <li><a href="">Điện Biên</a></li>
                    <li><a href="">Đồng Nai</a></li>
                    <li><a href="">Đồng Tháp</a></li>
                    <li><a href="">Gia Lai</a></li>
                    <li><a href="">Hà Giang</a></li>
                    <li><a href="">Hà Nam</a></li>
                    <li><a href="">Hà Tĩnh</a></li>
                    <li><a href="">Hải Dương</a></li>
                    <li><a href="">Hải Phòng</a></li>
                    <li><a href="">Hậu Giang</a></li>
                    <li><a href="">Hòa Bình</a></li>
                    <li><a href="">Hưng Yên</a></li>
                    <li><a href="">Khánh Hòa</a></li>
                    <li><a href="">Kiên Giang</a></li>
                    <li><a href="">Kon Tum</a></li>
                    <li><a href="">Lai Châu</a></li>
                    <li><a href="">Lâm Đồng</a></li>
                    <li><a href="">Lạng Sơn</a></li>
                    <li><a href="">Lào Cai</a></li>
                    <li><a href="">Long An</a></li>
                    <li><a href="">Nam Định</a></li>
                    <li><a href="">Nghệ An</a></li>
                    <li><a href="">Ninh Bình</a></li>
                    <li><a href="">Ninh Thuận</a></li>
                    <li><a href="">Phú Thọ</a></li>
                    <li><a href="">Phú Yên</a></li>
                    <li><a href="">Quảng Bình</a></li>
                    <li><a href="">Quảng Nam</a></li>
                    <li><a href="">Quảng Ngãi</a></li>
                    <li><a href="">Quảng Ninh</a></li>
                    <li><a href="">Quảng Trị</a></li>
                    <li><a href="">Sóc Trăng</a></li>
                    <li><a href="">Sơn La</a></li>
                    <li><a href="">Tây Ninh</a></li>
                    <li><a href="">Thái Bình</a></li>
                    <li><a href="">Thái Nguyên</a></li>
                    <li><a href="">Thanh Hóa</a></li>
                    <li><a href="">Thừa Thiên Huế</a></li>
                    <li><a href="">Tiền Giang</a></li>
                    <li><a href="">Trà Vinh</a></li>
                    <li><a href="">Tuyên Quang</a></li>
                    <li><a href="">Vĩnh Long</a></li>
                    <li><a href="">Vĩnh Phúc</a></li>
                    <li><a href="">Yên Bái</a></li>
                </ul>
            </div>
        </div>

    </div>
    <script>
        const timTinh = document.querySelectorAll('.js-tim-tinh');
        const modal = document.querySelector('.js-modal-tinh-thanh');
        const close = document.querySelectorAll('.js-close');
        const modalContainer = document.querySelector('.js-modal-container');

        function showTinhThanh() {
            modal.classList.add('open');
        }

        function hideTinhThanh() {
            modal.classList.remove('open');
        }

        for (const timTinhElement of timTinh) {
            timTinhElement.addEventListener('click', showTinhThanh);

        }
        for (const closeElement of close) {
            closeElement.addEventListener('click', hideTinhThanh);

        }

        modal.addEventListener('click', hideTinhThanh);
        modalContainer.addEventListener('click', function (event) {
            event.stopPropagation();
        });
    </script>
</div>
<!--Kết thúc phẩn tỉnh thành-->
</body>
</html>
