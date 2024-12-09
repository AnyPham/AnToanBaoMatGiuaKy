<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<% User userEdit = (User) request.getAttribute("userEdit");%>
<% String tendangnhap = (String) request.getParameter("tendangnhap"); %>
<% String hovaten = (String) request.getParameter("hovaten"); %>
<% String sdt = (String) request.getParameter("sdt"); %>
<% String gmail = (String) request.getParameter("gmail"); %>
<% String pass = (String) request.getParameter("pass"); %>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật tài khoản</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<section class="home-section">
    <div class="home-content">
        <div class="manager-product">
            <div class="title">Cập nhật tài khoản</div>
            <form class="row" action="adminEditUser?id=<%=userEdit.getId()%>" method="post">
                <div class="form-group col-md-4">
                    <label class="control-label">Tên tài khoản</label>
                    <input class="form-control" type="text" name="tendangnhap" value="<%=userEdit.getUserName()!=null?userEdit.getUserName():""%>" placeholder="">
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Họ và tên</label>
                    <input class="form-control" type="text" name="hovaten" value="<%=userEdit.getFullName()!=null?userEdit.getFullName():""%>">
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Số điện thoại</label>
                    <input class="form-control" type="text" name="sdt" value="<%=userEdit.getPhoneNumber()!=null?userEdit.getPhoneNumber():""%>">
                </div>
                <div class="form-group col-md-6 ">
                    <label class="control-label">Email</label>
                    <input class="form-control" type="email" name="gmail" value="<%=userEdit.getEmail()!=null?userEdit.getEmail():""%>">
                </div>
                <div class="form-group col-md-6">
                    <label class="control-label">Mật khẩu</label>
                    <input class="form-control" type="password" name="pass" value="<%=userEdit.getPassword()!=null?userEdit.getPassword():""%>">
                </div>
                <button class="btn btn-save" type="submit">Lưu lại</button>
            </form>
        </div>
    </div>
</section>
<script src="./js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src=./js/bootstrap.bundle.min.js"></script>
<script src="./js/pageAdmin_main.js"></script>
</body>
</html>
