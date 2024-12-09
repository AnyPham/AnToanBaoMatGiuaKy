<%@ page import="dao.UserDAO" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error1 = (String) session.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thông tin và địa chỉ</title>
    <link rel="stylesheet" href="./css/accountdetails.css">
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="main">
    <%@include file="header.jsp" %>
    <div id="content">
        <div class="container">
            <div class="display">
                <div class="toolbar">
                    <h4><span><%=user.getSex()%> </span><%=user.getFullName().toUpperCase(java.util.Locale.ROOT)%>
                    </h4>
                    <div class="mini-menu-toolbar">
                        <div class="order-frame">
                            <i class="fa-solid fa-rectangle-list"></i>
                            <a href="ordered-page" class="order">Đơn hàng đã mua</a>
                        </div>
                        <div class="infor-frame">
                            <i class="fa-solid fa-address-card"></i>
                            <a href="" class="thong-tin-va-dia-chi">Thông tin và địa chỉ</a>
                        </div>
                        <div class="log-off">
                            <a href="logOutController" class="dang-xuat">Đăng xuất</a>
                        </div>
                    </div>
                </div>
                <div class="content-mini">
                    <div class="title">
                        <span class="title-ordered">Thông tin tài khoản</span>
                    </div>
                    <div class="infor-user">
                        <form action="update-user?id=<%=user.getId()%>">
                            <div class="thong-tin-ca-nhan">
                                <p>THÔNG TIN CÁ NHÂN</p>
                                <span><%=user.getSex() == null ? "" : user.getSex()%> <span><%=user.getFullName().toUpperCase(java.util.Locale.ROOT)%></span> - <span><%=user.getPhoneNumber() == null ? "Chưa có số điện thoại" : user.getPhoneNumber()%></span></span>
                            </div>
                            <div class="select-infor">
                                <div class="sex">
                                    <div class="sex">
                                        <input type="radio" id="male" name="gender" value="Anh"
                                            <% if (user.getSex() != null && user.getSex().equals("Nam")) { %>
                                               checked="checked" <% } %>>
                                        <span>Anh</span>
                                        <input type="radio" id="female" name="gender" value="Chị"
                                            <% if (user.getSex() != null && user.getSex().equals("Nữ")) { %>
                                               checked="checked" <% } %>>
                                        <span>Chị</span>
                                    </div>
                                </div>
                                <div class="name-phone">
                                    <div class="name">
                                        <span class="ho-va-ten-label">Họ & tên:</span>
                                        <input type="text" id="ho-va-ten"
                                               value="<%=user.getFullName()!=null?user.getFullName():""%>"
                                               name="inputFullName">
                                    </div>
                                    <div class="phone">
                                        <span class="so-dien-thoai-label">Số điện thoại:</span>
                                        <input type="text" id="so-dien-thoai"
                                               value="<%=user.getPhoneNumber()!=null?user.getPhoneNumber():""%>"
                                               name="inputPhone">
                                    </div>
                                </div>
                                <div class="btn-cancel-save">
                                    <button href="" class="save-btn">Lưu</button>
                                </div>
                            </div>
                        </form>

                    </div>
                    <form action="update-address?id=<%=user.getId()%>">
                        <div class="infor-address">
                            <div class="dia-chi-nhan-hang">
                                <p>ĐỊA CHỈ NHẬN HÀNG</p>
                            </div>
                            <div class="nhap-dia-chi">
                                <span class="tinh-label">Địa chỉ:</span>
                                <input type="text" placeholder="Nhập địa chỉ" id="dia-chi" class="all"
                                       value="<%=user.getAddress()!=null?user.getAddress():""%>" name="inputAddress">
                            </div>
                            <div class="btn-frame">
                                <button type="submit" class="cap-nhat">Cập nhật</button>
                            </div>
                        </div>
                    </form>
                    <form action="change-pass">
                        <div class="infor-address">
                            <div class="dia-chi-nhan-hang">
                                <p>ĐỔI MẬT KHẨU</p>
                            </div>
                            <div class="nhap-dia-chi">
                                <span class="tinh-label">Mật khẩu cũ:</span>
                                <input type="password" placeholder="Nhập mật khẩu cũ" class="all"
                                       value="" name="oldPass">

                                <span class="tinh-label">Mật khẩu mới:</span>
                                <input type="password" placeholder="Nhập mật khẩu mới" class="all"
                                       value="" name="newPass">

                                <span class="tinh-label">Nhập lại mật khẩu mới:</span>
                                <input type="password" placeholder="Nhập lại mật khẩu mới" class="all"
                                       value="" name="re-enter-pass">
                            </div>
                            <%if (error1 != null) {%>
                            <div style="    text-align: center;
    margin-bottom: 25px;
    font-size: 14px;">
                                <span style="color: red"><%=error1%></span>
                            </div>
                            <%}%>
                            <div class="btn-frame">
                                <button type="submit" class="cap-nhat">Cập nhật</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
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
