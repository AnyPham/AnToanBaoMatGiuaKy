<%@ page import="model.Contact" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");%>
<% String contact_input = (String) request.getParameter("contact_input"); %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Phản hồi</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/jquery.dataTables.min.css">
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
            <div class="title">Danh Sách Phản Hồi</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row element-button">
                    </div>
                    <table id="table-id" class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Họ và tên</th>
                            <th scope="col">Email</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Nội dung</th>
                            <th scope="col">Nhập Nội dung</th>
                            <th scope="col">Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (Contact contact : contacts) {%>
                        <tr>
                            <th scope="row"><%=contact.getId()%></th>
                            <td><%=contact.getName()%></td>
                            <td><%=contact.getEmail()%></td>
                            <td><%=contact.getPhone_number()%></td>
                            <td><%=contact.getContent()%></td>
                            <form action="pageContactSend?id=<%=contact.getId()%>" accept-charset="UTF-8" method="post" >
                            <td><input type="text" name="contact_input" placeholder="Nhập nội dung phản hồi" ></td>
                            <td>
                                    <button class="btn btn-save" type="submit" style="margin-left: 60px">Phản hồi</button>
                                </a>
                            </td>
                            </form>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="jsDatatable.jsp" />
<script>
    new DataTable('#table-id', {
        layout: {
            topStart: {
                buttons: [
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: ':not(:nth-child(6)), :not(:nth-child(7))'
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: ':not(:nth-child(6)), :not(:nth-child(7))'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':not(:nth-child(6)), :not(:nth-child(7))'
                        }
                    },
                ]
            }
        },
    });
</script>
</body>
</html>
