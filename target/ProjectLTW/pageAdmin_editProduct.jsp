<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="dao.CategoryDAO" %>
<%@ page import="model.Brand" %>
<%@ page import="service.BrandService" %>
<%@ page import="model.TypeMachine" %>
<%@ page import="service.TypeMachineService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product) session.getAttribute("product");
    if (product == null) product = new Product();

%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lí - Chỉnh sửa sản phẩm</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="./js/pageAdmin_main.js"></script>
    <script src="./js/jquery.dataTables.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<section class="home-section">
    <div class="home-content">
        <div class="manager-product">
            <div class="title">Chỉnh sửa sản phẩm</div>
            <form class="row" action="edit-product" method="post" enctype="multipart/form-data">
                <div class="form-group col-md-3" style="display: none" type="hidden">
                    <input class="form-control" value="<%=product.getId()%>" type="hidden" placeholder=""
                           name="product_id">
                </div>
                <div class="form-group col-md-3">
                    <label class="control-label">Tên sản phẩm</label>
                    <input class="form-control" value="<%=product.getTitle()%>" type="text" name="nameProduct">
                </div>

                <div class="form-group  col-md-3">
                    <label class="control-label">Số lượng</label>


                    <input class="form-control" value="<%=product.getAvailable()%>" type="number"
                           name="availableProduct">
                </div>

                <%!
                    String generateOptions(List<?> items, int selectedId) {
                        StringBuilder options = new StringBuilder();
                        for (Object item : items) {
                            int id = 0;
                            String name = "";
                            if (item instanceof Category) {
                                id = ((Category) item).getId();
                                name = ((Category) item).getName();
                            } else if (item instanceof Brand) {
                                id = ((Brand) item).getId();
                                name = ((Brand) item).getName();
                            } else if (item instanceof TypeMachine) {
                                id = ((TypeMachine) item).getId();
                                name = ((TypeMachine) item).getType_name();
                            }
                            options.append("<option value=\"").append(id).append("\"");
                            if (id == selectedId) {
                                options.append(" selected");
                            }
                            options.append(">").append(name).append("</option>");
                        }
                        return options.toString();
                    }
                %>
                <%List<Category> categories = CategoryDAO.getListCategorys();%>
                <div class="form-group col-md-3">
                    <label class="control-label">Danh mục</label>
                    <select class="form-control" name="category">
                        <option>--- Chọn danh mục ---</option>
                        <%=generateOptions(categories, product.getCategory_id())%>
                    </select>
                </div>

                <%List<Brand> brands = BrandService.getInstance().getListBrand();%>
                <div class="form-group col-md-3">
                    <label class="control-label">Thương hiệu</label>
                    <select class="form-control" name="brand">
                        <option>--- Chọn danh mục ---</option>
                        <%=generateOptions(brands, product.getBrand_id())%>
                    </select>
                </div>

                <%List<TypeMachine> typeMachines = TypeMachineService.getInstance().getListTypeMachine();%>
                <div class="form-group col-md-3">
                    <label class="control-label">Loại máy</label>
                    <select class="form-control" name="typeMachine">
                        <option>--- Chọn danh mục ---</option>
                        <%=generateOptions(typeMachines, product.getType_machine_id())%>
                    </select>
                </div>

                <div class="form-group col-md-3">
                    <label class="control-label">Giá bán</label>
                    <input class="form-control" value="<%=product.getPrice()%>" type="text" name="priceProduct">
                </div>
                <div class="form-group col-md-3">
                    <label class="control-label">Giá giảm</label>
                    <input class="form-control" value="<%=product.getDiscount_price()%>" type="number"
                           name="discountPriceProduct">
                </div>
                <div class="form-group col-md-12">
                    <label style="display: block" class="control-label">Ảnh sản phẩm:</label>
                    <img style="width: 150px;" src="<%= product.getImg() %>" alt="Product Image">
                    <input style="display: block" type="file" name="imgProduct">
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label">Mô tả sản phẩm</label>
                    <textarea class="form-control" name="mota" id="mota"><%=product.getDescriptions()%></textarea>
                </div>
                <button class="btn btn-save" type="submit">Lưu lại</button>
                <a class="btn btn-cancel" href="pageAdmin_Product.jsp">Hủy bỏ</a>
            </form>



        </div>
    </div>
</section>
</body>
</html>
