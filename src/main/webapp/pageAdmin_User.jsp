<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<User> users = (List<User>) request.getAttribute("users");
    if (users == null) users = new ArrayList<>();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý tài khoản</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <jsp:include page="cssDatatable.jsp"/>
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
        <div class="manager-product">
            <div class="title">Danh Sách Tài Khoản</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="./pageAdmin_addUser.jsp" title="Thêm">
                                <i class="fas fa-plus"></i>
                                Thêm tài khoản</a>
                        </div>

                    </div>
                    <table id="table-id" class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Mã tài khoản</th>
                            <th scope="col">Tên tài khoản</th>
                            <th scope="col">Tên người dùng</th>
                            <th scope="col">Email</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Quyền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (User user : users) {%>
                        <tr>
                            <div>
                                <th scope="row"><%=user.getId()%>
                                </th>
                                <td><%=user.getUserName()%></td>
                                <td><%=user.getFullName()%></td>
                                <td><%=user.getEmail()%></td>
                                <td><%=user.getPhoneNumber()%></td>
                                <td><% int role = user.getRoleId();
                                    if (role == 1) {
                                %>
                                    Admin
                                    <%
                                    } else {
                                    %>
                                    User
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        int status = user.getStatus();
                                        if (status == 1) {
                                    %>
                                    Hoạt động
                                    <%
                                    } else {
                                    %>
                                    Đã khóa
                                    <%
                                        }
                                    %>
                                </td
                            </div>
                            <td>
                                <a title="Khóa tài khoản" href="editStatus?id=<%=user.getId()%>" class="icon-link">
                                    <i>Chỉnh sửa trạng thái</i>
                                    <i class="icon-wrapper">
                                        <i class="fa-solid fa-x"></i>
                                    </i>
                                </a>
                                <a title="Phân quyền" href="editRoleUser?id=<%=user.getId()%>" class="icon-link">
                                    <i>Phân quyền</i>
                                    <i class="icon-wrapper">
                                        <i class="fa-solid fa-up-down"></i>
                                    </i>
                                </a>
                                <a title="Chỉnh sửa" href="pageAdminUpdateUser?id=<%=user.getId()%>" class="icon-link">
                                    <i>Cập nhật </i>
                                    <i class="icon-wrapper">
                                        <i class="fas fa-pen"></i>
                                    </i>
                                </a>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="./js/bootstrap.bundle.min.js"></script>
<jsp:include page="jsDatatable.jsp" />
<script>
    new DataTable('#table-id', {
        layout: {
            topStart: {
                buttons: [
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: ' :not(:nth-child(8))'
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: ' :not(:nth-child(8))'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ' :not(:nth-child(8))'
                        }
                    },
                ]
            }
        },
    });
</script>
</script>
</body>
</html>
