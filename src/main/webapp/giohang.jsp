<%@ page import="cart.CartProduct" %>
<%@ page import="cart.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.FieldPosition" %>
<%@ page import="java.text.ParsePosition" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Voucher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<% Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) cart = new Cart();
    Set set = cart.getData().keySet();
    int total = 0;
    for (Object key : set
    ) {
        total += cart.getData().get(key).getProduct().getDiscount_price() * cart.getData().get(key).getQuantity();
    }
    ArrayList<Voucher> vouchers = (ArrayList<Voucher>) session.getAttribute("vouchers");
    Object tempObj = session.getAttribute("percent_decrease");
    double percent_decrease = 0;
    if (tempObj != null) {
        if (tempObj instanceof Double) {
            percent_decrease = (Double) tempObj;
        } else if (tempObj instanceof String) {
            percent_decrease = Double.valueOf((String) tempObj);
        }
    }

    int total_decrease = (int) (total - (total * percent_decrease));
    Object object = request.getParameter("voucher_id");
    int voucher_id = 0;
    if (object != null) {
        if (object instanceof Integer) {
            voucher_id = (Integer) object;
        } else if (object instanceof String) {
            voucher_id = Integer.valueOf((String) object);
        }
    }
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<%--<% int products = cart.getData().size(); %>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="css/giohang.css">
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="main">
    <%@include file="header.jsp" %>
    <%if (cart.getData().size() < 1) {%>
    <div id="content-none">
        <div class="container content-mini-trong">
            <img src="img/giohang.jsp-removebg-preview.png" alt="">
            <span>Không có sản phẩm nào trong giỏ hàng</span>
            <a href="trangchu">Về trang chủ</a>
        </div>
    </div>
    <%}%>
    <%if (cart.getData().size() > 0) {%>
    <div id="content" class="appear">
        <div class="section">
            <div class="nav-section">
                <a href="/ProjectLTW_war_exploded/trangchu" class="mua-them">Mua thêm sản phẩm khác</a>
                <span>Giỏ hàng của bạn</span>
            </div>
            <div class="gio-hang">
                <ul class="list-san-pham">
                    <% for
                    (
                            Object
                                    key
                            :
                            set
                    ) {%>
                    <div class="san-pham">
                        <div class="img-sp">
                            <div href="" class="link-sp">
                                <img src=<%=cart.getData().get(key).getProduct().getImg()%> alt="">
                                <a href="remove-card?id=<%=cart.getData().get(key).getProduct().getId()%>"
                                   class="remove">Xóa</a>
                            </div>
                        </div>
                        <div class="data-sp">
                            <div class="data-sp-title">
                                <a href=""
                                   class="data-sp-title-label"><%=cart
                                        .
                                        getData
                                                (
                                                )
                                                .
                                        get
                                                (
                                                        key
                                                )
                                                .
                                        getProduct
                                                (
                                                )
                                                .
                                        getTitle
                                                (
                                                )%>
                                </a>

                            </div>
                            <span class="data-sp-price"><%=numberFormat.format(cart.getData().get(key).getProduct().getDiscount_price())%>₫
                                    <strike class="line-gach"><%=numberFormat.format(cart.getData().get(key).getProduct().getPrice())%>₫</strike></span>
                            <ul class="data-sp-discount">
                                <li>- Miễn phí công lắp đặt</li>
                                <li>- Giảm thêm 10% khi mua cùng sản phẩm có giá cao hơn (trừ Xe đạp, sản phẩm Apple,
                                    sản phẩm giá sốc)
                                </li>
                                <li>- Cơ hội trúng TIVI LG 65 inch.</li>
                                <li>- Tặng coupon Miễn phí lõi lọc thô số 1 và 3 coupon Giảm 20% khi mua lõi lần sau.
                                </li>
                            </ul>
                            <div class="data-sp-quantity-color">

                                <div class="data-sp-quantity">
                                    <a href="decrease?id=<%=cart.getData().get(key).getProduct().getId()%>"
                                       class="except">-</a>
                                    <div class="quantity-sp js-quantity-sp"><%=cart
                                            .
                                            getData
                                                    (
                                                    )
                                                    .
                                            get
                                                    (
                                                            key
                                                    )
                                                    .
                                            getQuantity
                                                    (
                                                    )%>
                                    </div>
                                    <a href="increase?id=<%=cart.getData().get(key).getProduct().getId()%>"
                                       class="plus">+</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </ul>
                <div class="total-san-pham">
                    <span class="quanlity-san-pham"><span class="total-label">Tạm tính </span>(<span
                            id="quantity-products"><%=cart.getTotal()%></span> sản phẩm):</span>
                    <span class="total-money"><%=numberFormat.format(total)%>₫</span>
                </div>
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                %>
                <div>
                    <p style="color: red; font-weight: bold; padding: 0 30px"><%= errorMessage != null ? errorMessage : ""
                    %>
                    </p>
                </div>
                <%request.removeAttribute("errorMessage");%>

                <div class="voucher">
                    <p class="label-voucher">Mã giảm giá/ Phiếu mua hàng</p>
                    <div class="nhap-voucher">
                        <%int id = 0;%>
                        <select id="ma-giam-gia">
                            <option selected disabled>Chọn mã giảm giá</option>
                            <%for (Voucher v : vouchers) {%>
                            <option class="voucher-option" value="<%=v.getId()%>"><%=v.getVoucher_name()%>
                            </option>
                            <%}%>
                        </select>

                        <a href="#" id="ap-dung" class="ap-dung">Áp dụng</a>
                        <script>
                            document.getElementById('ma-giam-gia').addEventListener('change', function () {
                                var id = this.value;
                                document.getElementById('ap-dung').href = "use-voucher?voucher_id=" + id;

                            });
                        </script>
                    </div>
                </div>
                <div class="total-money-big">
                    <div class="label-total-big">
                        <span class="text-total-big">Tổng tiền:</span>
                        <span class="money-big"><%=numberFormat.format(total_decrease)%>₫</span>
                    </div>
                    <div class="policy">
                        <input type="checkbox" id="checkbox-policy">
                        <span class="text-policy">Tôi đồng ý với Chính sách xử lý dữ liệu cá nhân của Healthy Water</span>
                    </div>
                    <div class="btn-order-frame">
                        <form action="order-controller" method="GET">
                            <input type="hidden" name="total_decrease" value="<%=total_decrease%>">
                            <input type="hidden" name="voucher_id" value="<%=voucher_id%>">
                            <%
                                String error = (String) request.getSession().getAttribute("error");
                            %>
                            <%if (error != null) {%>
                            <div><span><%=error%></span></div>
                            <%}%>
                            <%request.getSession().removeAttribute("error");%>
                            <button type="button" id="btn-order" class="btn-order">Đặt hàng</button>
                        </form>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script>
                        $(document).ready(function () {
                            $("#btn-order").click(function () {
                                var checked = $("#checkbox-policy").prop("checked");
                                if (checked) {
                                    // Chuyển hướng đến order-controller với các tham số
                                    var url = "order-controller?total_decrease=" + $("input[name='total_decrease']").val() + "&voucher_id=" + $("input[name='voucher_id']").val();
                                    window.location.href = url;
                                } else {
                                    // Hiển thị thông báo yêu cầu chọn checkbox-policy
                                    alert("Bạn phải đồng ý với Chính sách xử lý dữ liệu cá nhân của Healthy Water trước khi đặt hàng.");
                                }
                            });
                        });
                    </script>
                    <div class="note"><span>Bạn có thể chọn hình thức thanh toán sau khi đặt hàng</span></div>
                </div>
            </div>
        </div>
    </div>
    <%}%>
    <%@include file="footer.jsp" %>
</div>
<!--Phần tỉnh thành-->
<div class="modal-tinh-thanh js-modal-tinh-thanh">
    <div class="modal-container js-modal-container">
        <div class="header-modal">
            <div class="title-modal">
                <p>Quý khách vui lòng cho biết <span>Địa Chỉ Nhận Hàng </span>để biết chính xác thời gian giao hàng</p>
                <a class="js-close"><i class="fa-solid fa-x fa-2xs" style="color: #ffffff;"></i></i>Đóng</a>
            </div>
            <form action="">
                <input type="text" placeholder="Tìm nhanh tỉnh thành, quận huyện, phường xã" class="tim-khu-vuc">
                <div class="icon-mini">
                    <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>