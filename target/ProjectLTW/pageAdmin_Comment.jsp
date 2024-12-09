<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    if (comments==null) comments = new ArrayList<>();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý bình luận</title>
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
            padding: 5px;
            border-radius: 50%;
        }
        .icon-wrapper i {
            color: #ffffff;
        }
    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<section class="home-section">
    <div class="home-content">
        <div class="manager-product">
            <div class="title">Danh Sách bình luận</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row element-button">
                    </div>
                    <table id="table-id" class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Mã bình luận</th>
<%--                            <th scope="col">Tên người dùng</th>--%>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Nội dung</th>
                            <th scope="col">Số sao</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Ngày đánh giá</th>
                            <th scope="col">Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (Comment comment : comments) {%>
                        <tr>
                            <th scope="row"><%=comment.getId()%></th>
<%--                            <td><%= UserService.getInstance().getFullNameById(comment.getUserId()) %></td>--%>
                            <td><%= ProductService.getInstance().getNameById(comment.getProductId()) %></td>
                            <td><%=comment.getContents()%></td>
                            <td><span class="badge bg-success"><%=comment.getStar()%></span></td>
                            <td><%  int display = comment.getDisplay();
                                if ( display == 1) {
                            %>
                                Hiển thị
                                <%
                                } else {
                                %>
                                Ẩn
                                <%
                                    }
                                %>
                            </td>
                            <td><%=comment.getCreate_date()%></td>
                            <td>
                                <a title="Chỉnh sửa" href="editDisplay?id=<%=comment.getId()%>" class="icon-link">
                                    <i>Chỉnh sửa trạng thái</i>
                                    <i class="icon-wrapper">
                                        <i class="fa-solid fa-up-down"></i>
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
                            columns: ' :not(:nth-child(7))'
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: ' :not(:nth-child(7))'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ' :not(:nth-child(7))'
                        }
                    },
                ]
            }
        },
    });
</script>
</body>
</html>
