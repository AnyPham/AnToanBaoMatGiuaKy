<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý - Thêm tài khoản</title>
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
            <div class="title">Thêm Tài Khoản</div>
            <form class="row" action="pageAdminAddUser">
                <div style="display: none" class="form-group col-md-4">
                    <label class="control-label">Mã tài khoản </label>
                    <input class="form-control" type="number" placeholder="">
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Họ và tên</label>
                    <input class="form-control" type="text" name="name2" >
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Số điện thoại</label>
                    <input class="form-control" type="text" name="phone2" >
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Tên người dùng</label>
                    <input class="form-control" type="text" name="username2" >
                </div>
                <div class="form-group col-md-4 ">
                    <label class="control-label" >Phân quyền</label>
                    <select class="form-control" name="roleUser">
                        <option disabled>-- Chọn quyền --</option>
                        <option value="1">Admin</option>
                        <option value="2">User</option>
                    </select>
                </div>
                <div class="form-group col-md-6 ">
                    <label class="control-label">Email</label>
                    <input class="form-control" type="email" name="email2">
                </div>
                <div class="form-group col-md-6">
                    <label class="control-label">Mật khẩu</label>
                    <input class="form-control" type="password" name="password2">
                </div>
                <%String error = (String) request.getSession().getAttribute("error2");
                if(error!=null){%>
                    <span style="color: red; margin: auto"><%=error%></span>
                <%}%>

                <%request.getSession().removeAttribute("error2");%>
                <div style="width: 100%; display: flex"><button style="margin-right: 15px" class="btn btn-save" type="submit">Lưu lại</button>
                    <a class="btn btn-cancel" href="pageAdminUserController">Hủy bỏ</a></div>
            </form>


        </div>
    </div>
</section>
<script src="../../../js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="../../../js/bootstrap.bundle.min.js"></script>
<script src="../../../js/pageAdmin_main.js"></script>
</body>
</html>
