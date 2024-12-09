<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% User userAdmin = (User) session.getAttribute("user");
    String checkLogin = userAdmin != null ? "pageAdminController" : "login.jsp";
    String isCheckLogin = userAdmin != null ? "pageAdmin_Product.jsp" : "login.jsp";
    String isCheckLogin1 = userAdmin != null ? "page-admin-checkout" : "login.jsp";
    String isCheckLogin2 = userAdmin != null ? "pageAdminUserController" : "login.jsp";
    String isCheckLogin3 = userAdmin != null ? "pageAdminCommentController" : "login.jsp";
    String isCheckLogin4 = userAdmin != null ? "pageAdminContact" : "login.jsp";
    String isCheckLogin5 = userAdmin != null ? "importProductController" : "login.jsp";
    String isCheckLogin6 = userAdmin != null ? "pageAdmin_Log.jsp" : "login.jsp";
%>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
    <link rel="stylesheet" href="./css/checkout.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
<div class="sidebar">
    <div style="height: 150px" class="logo-details">
        <a href="/ProjectLTW_war/trangchu" style="height: 212px"><img
                src="https://th.bing.com/th/id/OIP.ZpscpAS7kf2k2s_W_YdeuQHaHa?pid=ImgDet&rs=1" width="240px"
                height="240px"></a>
    </div>
    <ul class="nav-links">
        <li>
            <a href="<%=checkLogin%>" class="active">
                <i class="fa-solid fa-border-all"></i>
                <span class="links_name">Trang chủ</span>
            </a>
        </li>

        <li>
            <a href="<%=isCheckLogin%>">
                <i class="fa-solid fa-box-archive"></i>
                <span class="links_name">Quản Lý Sản Phẩm</span>
            </a>
        </li>
        <li>
            <a href="<%=isCheckLogin1%>">
                <i class="fa-solid fa-note-sticky"></i>
                <span class="links_name">Quản Lý Đơn Hàng</span>
            </a>
        </li>
        <li>
            <a href="<%=isCheckLogin2%>">
                <i class="fa-solid fa-user"></i>
                <span class="links_name">Quản Lý Tài Khoản</span>
            </a>
        </li>
        <li>
            <a href="<%=isCheckLogin3%>">
                <i class="fa-regular fa-comment"></i>
                <span class="links_name">Quản lý bình luận</span>
            </a>
        </li>
        <li>
            <a href="<%=isCheckLogin4%>" class="active">
                <i class="fa-solid fa-box-open"></i>
                <span class="links_name">Quản lý phản hồi</span>
            </a>
        </li>
        <li>
            <a href="<%=isCheckLogin5%>" class="active">
                <i class="fa-solid fa-plus"></i>
                <span class="links_name">Quản lý nhập hàng</span>
            </a>
        </li>
        <li>
            <a href="<%=isCheckLogin6%>" class="active">
                <i class="fa-solid fa-plus"></i>
                <span class="links_name">Quản lý logs</span>
            </a>
        </li>
        <li class="log_out">
            <a href="logOutController">
                <i class="fa-solid fa-right-from-bracket"></i>
                <span class="links_name">Đăng xuất</span>
            </a>
        </li>
    </ul>
</div>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/pageAdmin_main.js"></script>
<script>

    // $("#table-id-1").DataTable();

</script>
</body>
</html>
