<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Quản lý</title>
    <link rel="stylesheet" href="./js/bootstrap.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<section class="home-section">
    <div class="home-content">
        <div class="view-box">
            <div class="header-box">
                <div class="title">Thống kê</div>
            </div>
            <div class="overview-boxes">
                <div class="box" style="margin-bottom: 10px">
                    <div class="right-side">
                        <a class="box-topic" href="./pageAdminRevenuer" style="">Doanh Thu</a>
                    </div>
                    <i class="fa-solid fa-dollar-sign cart three"></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <a class="box-topic" href="./thongKeDonHang" style="">Đơn Hàng</a>
                    </div>
                    <i class="fa-solid fa-cart-plus cart"></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <a class="box-topic" href="./thongKeDonHangHuy" style="">Đơn Hàng Huỷ</a>
                    </div>
                    <i class="fa-solid fa-xmark cart two"></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <a class="box-topic" href="./thongKeSanPham" style="">Sản phẩm bán chạy</a>
                    </div>
                    <i class="fa-solid fa-arrow-trend-up cart"></i>
                </div>
                <div class="box" style="margin-bottom: 10px">
                    <div class="right-side">
                        <a class="box-topic" href="./thongKeSanPhamNotSold" style="">Sản phẩm không bán được</a>
                    </div>
                    <i class="fa-solid fa-xmark cart"></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <a class="box-topic" href="./pageAdminInventoryController" style="">Sản phẩm tồn kho</a>
                    </div>
                    <i class="fa-solid fa-warehouse cart"></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <a class="box-topic" href="./pageAdminBeImportProduct" style="">Sản phẩm cần nhập kho</a>
                    </div>
                    <i class="fa-solid fa-plus cart"></i>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>