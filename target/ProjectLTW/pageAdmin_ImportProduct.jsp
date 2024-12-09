<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Category" %>
<%@ page import="dao.CategoryDAO" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="service.ImportProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products == null) products = new ArrayList<>();
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý nhập hàng</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="DataTables/datatables.min.css" rel="stylesheet">
    <script src="DataTables/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
            <div class="title">Danh Sách Nhập Hàng</div>
            <div class="row element-button">
                <div class="col-sm-2">
                    <a class="btn btn-add btn-sm" href="./importProductHistoryController" title="Lịch sử nhập hàng">
                        <i class="a-solid fa-warehouse"></i>
                        Lịch sử nhập hàng</a>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <table id="table-id" class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Trạng Thái</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Tồn kho</th>
                            <th scope="col">Tỉ lệ bán ra so với nhập</th>
                            <th scope="col">Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Product product : products) {
                        %>
                        <tr>
                            <th scope="row"><%=product.getId()%></th>
                            <td><%=product.getTitle()%></td>
                            <td><img src="<%=product.getImg()%>" style="max-width: 100px; max-height: 100px;"></td>
                            <td>
                                <% if (product.getAvailable() > 0) { %>
                                <span class="badge bg-success">Còn hàng</span>
                                <% } else { %>
                                <span style="background-color: #efbfbf !important; color: #790202 !important;" class="badge bg-failed">Hết hàng</span>
                                <% } %>
                            </td>
                            <td><%=product.getAvailable()%></td>
                            <td><%=numberFormat.format(product.getPrice())%><sup>đ</sup></td>
                            <td><%=ImportProductService.getInstance().countInventory(product.getId())%></td>
                            <td><%=ImportProductService.getInstance().getProductSalesRatio(product.getId())%>%</td>
                            <td>
                                <a title="Nhập hàng" href="#" class="icon-link import-btn" data-bs-toggle="modal" data-bs-target="#importModal<%=product.getId()%>">
                                    <i class="icon-wrapper">
                                        <i class="fa-solid fa-plus"></i>
                                    </i>
                                </a>
                                <!-- Modal -->
                                <div class="modal fade" id="importModal<%=product.getId()%>" tabindex="-1" aria-labelledby="importModalLabel<%=product.getId()%>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="importModalLabel<%=product.getId()%>">Nhập hàng</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="importForm" method="post" action="plusImportProductController?id=<%=product.getId()%>">
                                                    <input type="hidden" id="productId" name="productId" value="<%=product.getId()%>">
                                                    <div class="mb-3">
                                                        <label for="importQuantity<%=product.getId()%>" class="form-label">Số lượng</label>
                                                        <input type="number" class="form-control" id="importQuantity<%=product.getId()%>" name="importQuantity" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="importPrice<%=product.getId()%>" class="form-label">Giá nhập</label>
                                                        <input type="number" class="form-control" id="importPrice<%=product.getId()%>" name="importPrice" required>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="jsDatatable.jsp" />
<script>
    $(document).ready(function() {
        $('#table-id').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: ':not(:nth-child(3)):not(:nth-child(9))'
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: ':not(:nth-child(3)):not(:nth-child(9))'
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: ':not(:nth-child(3)):not(:nth-child(9))'
                    }
                }
            ]
        });
    });
</script>
</body>
</html>
