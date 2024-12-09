<%@ page import="cart.Cart" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="dao.OrderDAO" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDetailDAO" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="dao.VoucherDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object object = request.getParameter("order_id");
    int order_id = 0;
    if (object != null) {
        if (object instanceof Integer) {
            order_id = (Integer) object;
        } else if (object instanceof String) {
            order_id = Integer.valueOf((String) object);
        }
    }
//  Cart cart = (Cart) session.getAttribute("cart");
//  if (cart == null) cart = new Cart();
//  int total = 0;
//  Set set = cart.getData().keySet();
//  for (Object key : set
//  ) {
//    total += cart.getData().get(key).getProduct().getDiscount_price() * cart.getData().get(key).getQuantity();
//  }

    Object tempObj = session.getAttribute("percent_decrease");
    double percent_decrease = 0;
    if (tempObj != null) {
        if (tempObj instanceof Double) {
            percent_decrease = (Double) tempObj;
        } else if (tempObj instanceof String) {
            percent_decrease = Double.valueOf((String) tempObj);
        }
    }
    Order order = OrderDAO.getOrderById(order_id);
    List<OrderDetail> orderDetails = OrderDetailDAO.getOrderDetailByIdOrder(order_id);
    Voucher voucher = VoucherDAO.getVoucherById(order.getVoucher_id());
    System.out.println(order_id);
    System.out.println(order);
    System.out.println(orderDetails);
    request.getSession().setAttribute("order_id",order_id);
//  int decrease = (int) (total * percent_decrease);
//  int total_decrease = (int) (total - (total * percent_decrease));
    String reason = request.getParameter("reason");
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thanh Toán</title>
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/payment.css">

</head>
<body>
<!--header-->
<%@include file="header.jsp"%>
<div id="main">
    !--Phần tỉnh thành-->
    <div class="modal-tinh-thanh js-modal-tinh-thanh">
        <div class="modal-container js-modal-container">
            <div class="header-modal">
                <div class="title-modal">
                    <p>Quý khách vui lòng cho biết <span>Địa Chỉ Nhận Hàng </span>để biết chính xác thời gian dao hàng
                    </p>
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
    <!--silder-->
    <div class="slider">
        <div class="container">
            <div class="payment">
                <h1 class="payment-h1">Thanh Toán <i class="fa-solid fa-money-bill"></i></h1>
                <div class="payment-id">
                    <h2 class="payment-id-title">Đơn hàng của bạn</h2>
                    <h3 id="payment-id-main">Mã đơn hàng: #<%=order.getId()%>
                    </h3>
                    <button type="submit" href="" id="cancel-form">Huỷ đơn hàng</button>

                </div>
                <div class="payment-information">
                    <div class="information-1">
                        <h4>Người nhận hàng: </h4>
                        <p><%=user.getFullName()%>
                        </p>
                    </div>
                    <div class="information-2">
                        <h4>Số điện thoại nhận hàng:</h4>
                        <p><%=user.getPhoneNumber()%>
                        </p>
                    </div>
                    <div class="information-3">
                        <h4>Giao đến: </h4>
                        <p><%=order.getAddress()%> (nhân viên sẽ gọi xác nhận trước khi giao)</p>
                    </div>

                </div>
                <div class="payment-title">
                    <h3 class="title-1">Sản phẩm</h3>
                    <h3 class="title-2">Tổng tiền</h3>
                </div>

                <%int total = 0;%>
                <%
                    for (OrderDetail od : orderDetails

                    ) {
                        total += od.getTotal_money();

                %>
                <div class="product">
                    <p class="product-1"><%=ProductDAO.getById(od.getProduct_id()).getTitle()%>
                        x <%=od.getQuantity()%>
                    </p>
                    <p class="product-price"><%=numberFormat.format(od.getTotal_money())%>
                        ₫</p>
                </div>
                <%}%>
                <div class="tax">
                    <p class="tax-title"><%=voucher.getVoucher_name()%>
                    </p>
                    <p class="tax-price"><%=numberFormat.format(total - order.getTotal_money())%>₫
                    </p>
                </div>
                <div class="total">
                    <p class="total-title">Tồng tiền</p>
                    <p class="total-price"><%=numberFormat.format(order.getTotal_money())%>₫</p>
                </div>
                <form id="paymentForm" action="payment-order">
                    <h3 style="padding: 0 24px">Chọn hình thức thanh toán</h3>
                    <div class="payment-type">
                        <div class="payment-type-1">
                            <input type="radio" value="Thanh toán bằng tiền mặt" name="paymentOption"
                                   class="checkbox-2">
                            <p>Thanh toán bằng tiền mặt</p>
                        </div>
                        <div class="payment-type-1">
                            <input type="radio" value="Thanh toán bằng thẻ ngân hàng" name="paymentOption"
                                   class="checkbox-2">
                            <p>Thanh toán bằng thẻ ngân hàng</p>
                        </div>
                    </div>
                    <button type="submit" class="submit">
                        <i class="fa-solid fa-bag-shopping"></i>
                        Thanh Toán
                    </button>
                </form>

                <script>
                    document.getElementById('paymentForm').addEventListener('submit', function (e) {
                        var radios = document.getElementsByName('paymentOption');
                        var isChecked = false;
                        var selectedValue;
                        var form = document.getElementById('paymentForm');
                        for (var i = 0; i < radios.length; i++) {
                            if (radios[i].checked) {
                                isChecked = true;
                                selectedValue = radios[i].value; // Lấy giá trị của radio button được chọn
                                form.action += "?payment_type=" + selectedValue; // Sử dụng URL ban đầu khi cập nhật action của form
                                break;
                            }
                        }
                        if (!isChecked) {
                            e.preventDefault();
                            alert('Vui lòng chọn một hình thức thanh toán.');
                        }
                    });
                </script>


            </div>
        </div>
    </div>
    <div class="cancel-form">
        <form action="cancel-order?order_id=<%=order.getId()%>&reason=<%=reason%>" id="cancel">
            <%--        <%String reason = "Cần thay đổi thông tin địa chỉ giao hàng";--%>
            <%--            String reason1 = "Cần thay đổi sdt người nhận";--%>
            <%--            String reason2 = "Giá cả không hợp lý";--%>
            <%--        %>--%>
            <div class="cancel-form-content">
                <i class="fa-solid fa-x" id="close"></i>
                <h3 style="padding-top: 50px;
    padding-bottom: 30px;">Vui lòng chọn lý do bạn muốn huỷ đơn hàng</h3>
                <%--            <div class="cancel-1">--%>
                <%--                <input type="radio" name="cancelReason" value="<%=reason%>" class="checkbox-cancel-1">--%>
                <%--                <p><%=reason%></p>--%>
                <%--            </div>--%>
                <%--            <div class="cancel-2">--%>
                <%--                <input type="radio" name="cancelReason" value="<%=reason1%>" class="checkbox-cancel-2">--%>
                <%--                <p><%=reason1%></p>--%>
                <%--            </div>--%>
                <%--            <div class="cancel-3">--%>
                <%--                <input type="radio" name="cancelReason" value="<%=reason2%>" class="checkbox-cancel-3">--%>
                <%--                <p><%=reason2%></p>--%>
                <%--            </div>--%>
                <%--            <div class="cancel-4">--%>
                <%--                <input type="radio" name="cancelReason" value="other" class="checkbox-cancel-4">--%>
                <%--                <p>Lý do khác</p>--%>
                <%--            </div>--%>
                <textarea name="reason" id="otherReason" cols="30" rows="10"
                          placeholder="Nhập lý do muốn huỷ đơn hàng"></textarea>
                <button type="submit">Xác nhận</button>
            </div>
        </form>

        <%--    <script>--%>
        <%--        function updateAction() {--%>
        <%--            var form = document.getElementById('cancel');--%>
        <%--            var checkedRadio = document.querySelector('input[name="cancelReason"]:checked');--%>
        <%--            var textarea = document.getElementById('otherReason');--%>
        <%--            if (checkedRadio.value === 'other') {--%>
        <%--                if (textarea.value.trim() === '') {--%>
        <%--                    alert('Vui lòng nhập lý do muốn huỷ đơn hàng');--%>
        <%--                    return false;--%>
        <%--                }--%>
        <%--                form.action += "&reason=" + encodeURIComponent(textarea.value);--%>
        <%--            } else {--%>
        <%--                form.action += "&reason=" + encodeURIComponent(checkedRadio.value);--%>
        <%--            }--%>
        <%--            return true;--%>
        <%--        }--%>
        <%--    </script>--%>
    </div>
    <%@include file="footer.jsp" %>
    <script src="./js/payment.js"></script>
</body>
</html>
