<%@ page import="java.util.List" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="service.UserService" %>
<%@ page import="model.*" %>
<%@ page import="dao.CategoryDAO" %>
<%@ page import="service.PageAdminService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> productBestSellers = (List<Product>) request.getAttribute("productBestSellers");
    if (productBestSellers == null) productBestSellers = new ArrayList<>();
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<% String startDateConverted = (String) session.getAttribute("startDateConverted");%>
<% String endDateConverted = (String) session.getAttribute("endDateConverted"); %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm bán chạy</title>
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
            <div class="" style="margin-bottom: 20px">
                <form action="./sanPhamStartEnd" method="post">
                    <label for="start-date">Ngày bắt đầu:</label>
                    <input type="date" id="start-date" name="start-date" required>
                    <br><br>
                    <label for="end-date">Ngày kết thúc:</label>
                    <input type="date" id="end-date" name="end-date" required>
                    <br><br>
                    <input type="submit" value="Thống kê">
                </form>
            </div>
            <div class="title">
                <% if (startDateConverted != null && endDateConverted != null) { %>
                Sản phẩm bán chạy từ <%= startDateConverted %> đến <%= endDateConverted %>
                <% } else { %>
                Sản phẩm bán chạy
                <% } %>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table id="table-id" class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Danh mục</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Tình trạng</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Giá giảm</th>
                            <th scope="col">Đã bán</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Product product : productBestSellers) {
                                String category_name = CategoryDAO.getCategoryNameById(product.getCategory_id());
                        %>
                        <tr>
                            <th scope="row"><%=product.getId()%></th>
                            <td><%=category_name%></td>
                            <td><%=product.getTitle()%></td>
                            <td><img src="<%=product.getImg()%>"
                                     style="max-width: 100px; max-height: 100px;">
                            </td>
                            <%if (product.getAvailable() > 0) {%>
                            <td><span class="badge bg-success">Còn hàng</span></td>
                            <%} else {%>
                            <td><span style="background-color: #efbfbf !important;
    color: #790202 !important;" class="badge bg-failed">Hết hàng</span></td>
                            <%}%>
                            <td><%=product.getAvailable()%></td>
                            <td><%=numberFormat.format(product.getPrice())%><sup>đ</sup></td>
                            <td><%=numberFormat.format(product.getDiscount_price())%>đ</td>
                            <td><%=PageAdminService.getInstance().countProductSoldQuantity(product.getId())%></td>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-2.0.8/datatables.min.js"></script>
<jsp:include page="jsDatatable.jsp" />
<script>
    $(document).ready(function() {
        $('#table-id').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: ':not(:nth-child(4))' // Không in cột "Ảnh"
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: ':not(:nth-child(4))' // Không in cột "Ảnh"
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: ':not(:nth-child(4))' // Không in cột "Ảnh"
                    }
                }
            ]
        });
    });
</script>
</body>
</html>
