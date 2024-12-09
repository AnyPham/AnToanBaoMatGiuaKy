<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.ImportProduct" %>
<%@ page import="service.ImportProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ImportProduct> importProducts = (List<ImportProduct>) request.getAttribute("importProducts");
    if (importProducts == null) importProducts = new ArrayList<>();
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="DataTables/datatables.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-+eDO2Q4A/8L+B+tc4HP0UO8VVFG+X5tUn8xCsxOh+dc=" crossorigin="anonymous"></script>
    <script src="DataTables/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="cssDatatable.jsp"/>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<section class="home-section">
    <div class="home-content">
        <div class="manager-product">
            <div class="title">Lịch sử nhập hàng</div>
            <div class="row">
                <div class="col-md-12">
                    <table id="table-id" class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Tên Sản Phẩm</th>
                            <th scope="col"> Số lượng </th>
                            <th scope="col">Giá Nhập</th>
                            <th scope="col"> Ngày nhập </th>
                            <th scope="col"> Người nhập </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (ImportProduct importProduct : importProducts) {
                        %>
                        <tr>
                            <th scope="row"><%=importProduct.getId()%></th>
                            <td><%=ImportProductService.getInstance().getNameProductById(importProduct.getProductId())%></td>
                            <td><%=importProduct.getQuantity()%></td>
                            <td><%=numberFormat.format(importProduct.getPrice())%> vnđ</td>
                            <td><%=importProduct.getCreated_At()%></td>
                            <td><%=ImportProductService.getInstance().getFullNameById(importProduct.getUserId())%></td>
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

                    },
                    {
                        extend: 'pdf',

                    },
                    {
                        extend: 'print',

                    },

                ]
            }
        },

    });
</script>
</body>
</html>
