<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="service.OrderService" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="service.OrderDetailService" %>
<%@ page import="model.*" %>
<%@ page import="service.VoucherService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Object object = request.getParameter("order_id");
    int order_id = 0;
    if (object != null) {
        if (object instanceof Double) {
            order_id = (Integer) object;
        } else if (object instanceof String) {
            order_id = Integer.valueOf((String) object);
        }
    }
    Order order = OrderService.getInstance().getOrderById(order_id);
    Voucher voucher = VoucherService.getInstance().getVoucherById(order.getVoucher_id());
    if (order == null) order = new Order();
    List<OrderDetail> orderDetails = OrderDetailService.getInstance().getOrderDetailByIdOrder(order_id);
    if (orderDetails == null) orderDetails = new ArrayList<>();

%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="./css/chi_tiet_don_hang.css">
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
                            <a href="ordered-page" class="order">Đơn hàng đã mua</a>
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
                        <span class="title-ordered">Chi tiết đơn hàng <span
                                class="">#<%=order.getId()%></span> - <span><%=order.getStatus()%></span></span>
                        <%--                        <p class="ly-do-huy">Lý do: <span class="ly-do">Tìm thấy chỗ khác tốt hơn</span></p>--%>
                    </div>
                    <div class="information-receive">
                        <div class="thong-tin-nhan-hang">
                            <div class="title-infor">
                                <p><i class="fa-solid fa-map-location-dot"></i>THÔNG TIN NHẬN
                                    HÀNG</p>
                            </div>
                            <form action="change-info-order?order_id=<%=order.getId()%>" method="post">
                            <div class="content-receive">
                                <p>Người nhận: </p>
                                <input style="width: 385px;
    height: 30px;
    border-radius: 4px; margin: auto" type="text" name="name" value="<%=(order.getName()!=null && order.getName()!="")? order.getName():""%>">
                                <p>Địa chỉ: </p>
                                <input style="width: 385px;
    height: 30px;
    border-radius: 4px; margin: auto" type="text" name="address" value="<%=(order.getAddress()!=null && order.getAddress()!="")? order.getAddress():""%>">
                                <p>Số điện thoại: </p>
                                <input style="width: 385px;
    height: 30px;
    border-radius: 4px; margin: auto" type="text" name="phone" value="<%=(order.getPhone()!=null && order.getPhone()!="")? order.getPhone():""%>">
                            </div>
                                <%String error = (String) request.getSession().getAttribute("error");
                                if (error!=null){%>
                                <div style="text-align: center"><span style="color:red;"><%=error%></span></div>
                                <%}%>
                                <%request.getSession().removeAttribute("error");%>
                                <button type="submit" style="    text-align: center;
    display: block;
    font-size: 14px;
    text-decoration: none;
    color: #4a90e2;
    margin: auto;
    margin-top: 15px;
    background-color: white;
    border: 1px #4a90e2;" href="">Cập nhật</button>
                            </form>

                        </div>
                        <div class="payment">
                            <div class="title-infor">
                                <p><i class="fa-regular fa-credit-card"></i>HÌNH THỨC THANH TOÁN
                                </p>
                            </div>
                            <div class="content-payment">
                                <p><%=order.getStatus()%>
                                </p>
                                <span class="describe">Đơn hàng sẽ được giao đến anh bằng hình thức Thanh toán tiền mặt khi nhận hàng</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-detail">
                        <div class="title-infor">
                            <p><i class="fa-solid fa-bag-shopping"></i>THÔNG TIN SẢN PHẨM</p>
                        </div>
                        <%for (OrderDetail orderDetail : orderDetails) {%>
                        <% Product product = ProductService.getInstance().getById(orderDetail.getProduct_id());%>
                        <div class="detail-pd">
                            <div class="product-san-pham">
                                <img src="<%=product.getImg()%>" alt="">
                                <div class="label-pd">
                                    <p class="label-name"><%=product.getTitle()%> <span
                                            class="cost"><%=numberFormat.format(product.getDiscount_price())%>₫</span>
                                    </p>
                                    <p class="discount-label">Khuyến mãi: <%=voucher.getVoucher_name()%></p>
                                    <p class="amount-label">Số lượng: <span
                                            class="amount"><%=orderDetail.getQuantity()%></span></p>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <div class="total-pd">
                            <div class="frame-flex">
                                <span class="tam-tinh">Tạm tính: </span><span
                                    class="money"><%=numberFormat.format(order.getTotal_money())%>₫</span>
                                <span class="can-thanh-toan">Cần thanh toán </span><span
                                    class="strong-money"><%=numberFormat.format(order.getTotal_money())%>₫</span>
                            </div>
                        </div>
                        <div class="btn-return">
                            <a href="ordered-page" class="return-btn">VỀ TRANG DANH SÁCH ĐƠN HÀNG</a>
                        </div>
                    </div>
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
