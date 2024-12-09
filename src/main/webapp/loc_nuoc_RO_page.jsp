<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="model.Brand" %>
<%@ page import="service.BrandService" %>
<%@ page import="model.TypeMachine" %>
<%@ page import="service.TypeMachineService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Product> products = (List<Product>) request.getAttribute("data");
    if (products == null) products = new ArrayList<>();
    List<Brand> brands = BrandService.getInstance().getListBrand();
    if (brands == null) brands = new ArrayList<>();
    List<TypeMachine> typeMachines = TypeMachineService.getInstance().getListTypeMachine();
    if (typeMachines == null) typeMachines = new ArrayList<>();
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lọc nước RO</title>
    <link rel="stylesheet" href="css/loc_nuoc_RO_page.css">
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="main">
    <%@include file="header.jsp" %>
    <div id="poster">
        <div class="container">
            <div class="big-poster">
                <img src="img/800-200-800x200-19.png" alt="">
            </div>
            <div class="mini-poster">
                <img class="first-mini-poster" src="img/390-97-390x97-1.png" alt="">
                <img src="img/Frame-3939-390x97.png" alt="">
            </div>
        </div>
    </div>
    <div id="content">
        <div class="container">
            <!--            Phần lọc sản phẩm-->
            <form id="filterForm" action="filter">
                <div class="filter-content">
                    <select style="    width: 200px;
    height: 30px;
    font-size: 14px;
    margin-top: 40px;
    border-radius: 5px;    margin-right: 15px;" id="filter-type-machine" class="" name="brand_id">
                        <option disabled value="">Lọc theo hãng</option>
                        <%for (Brand b : brands) {%>
                        <option value="<%=b.getId()%>"><%=b.getName()%></option>
                        <%}%>
                    </select>
                    <select style="    width: 200px;
    height: 30px;
    font-size: 14px;
    margin-top: 40px;
    border-radius: 5px;    margin-right: 15px;" id="filter-brand" class="" name="type_id">
                        <option disabled value="">Lọc theo loại máy</option>
                        <%for (TypeMachine t : typeMachines) {%>
                        <option value="<%=t.getId()%>"><%=t.getType_name()%></option>
                        <%}%>
                    </select>
                    <button style="    height: 30px;
    border-radius: 5px;
    border: 1px solid;
    width: 50px;cursor: pointer;" type="submit">Lọc</button>
                </div>
            </form>

            <script>
                document.getElementById('filterForm').addEventListener('submit', function (event) {
                    var brandId = document.getElementById('filter-type-machine').value;
                    var typeId = document.getElementById('filter-brand').value;
                    this.action = "filter?page_id=1&brand_id=" + brandId + "&type_id=" + typeId;
                });
            </script>

            <!--            Kết thúc phần lọc sản phẩm-->
            <div class="product-content">
                <div class="content-may-loc">
                    <% for (Product p : products) { %>
                    <div class="content-may-loc-mini">
                        <a href="trangsanpham?id=<%=p.getId()%>" class="deal-items">
                            <div class="item-label">
                                <span>Trả góp 0%</span>
                            </div>
                            <div class="item-img">
                                <img src="<%=p.getImg()%>"
                                     alt="">
                            </div>
                            <p class="label-gia-re">
                                <img src="img/50x50-100x101-3.webp" alt="">
                                <span>GIÁ RẺ QUÁ</span>
                            </p>
                            <h3><%=p.getTitle()%>
                            </h3>
                            <div class="item-compare">
                                <span>Tủ đứng</span>
                                <span>Lắp đặt miễn phí</span>
                            </div>
                            <p class="item-online-gia-re">
                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>
                                Online giá rẻ quá
                            </p>
                            <div class="gia-sale">
                                <p class="price-old"><%=numberFormat.format(p.getPrice())%>₫ </p>
                                <span class="percent">-54%</span>
                            </div>
                            <strong class="price-sale"><%=numberFormat.format(p.getDiscount_price())%>₫</strong>
                            <div class="item-rating">
                                <p>
                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>
                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>
                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>
                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>
                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>
                                </p>
                                <p class="item-rating-total">40</p>
                                <a href="add-card?id=<%=p.getId()%>&page=2" class="item-ss"><i
                                        class="fa-solid fa-code-compare"
                                        style="color: #333333;"></i>
                                    Thêm vào giỏ hàng </a>
                            </div>
                        </a>
                    </div>
                    <%}%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="content-may-loc-mini">--%>
                    <%--                        <a href="" class="deal-items">--%>
                    <%--                            <div class="item-label">--%>
                    <%--                                <span>Trả góp 0%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="item-img">--%>
                    <%--                                <img src="img/ro-sunhouse-sha88118k-10-loi-kg-210223-102600-600x600.jpg"--%>
                    <%--                                     alt="">--%>
                    <%--                            </div>--%>
                    <%--                            <p class="label-gia-re">--%>
                    <%--                                <img src="img/50x50-100x101-3.webp" alt="">--%>
                    <%--                                <span>GIÁ RẺ QUÁ</span>--%>
                    <%--                            </p>--%>
                    <%--                            <h3>Máy lọc nước RO Sunhouse SHA88118K</h3>--%>
                    <%--                            <div class="item-compare">--%>
                    <%--                                <span>Tủ đứng</span>--%>
                    <%--                                <span>Lắp đặt miễn phí</span>--%>
                    <%--                            </div>--%>
                    <%--                            <p class="item-online-gia-re">--%>
                    <%--                                <i class="fa-solid fa-coins" style="color: #db2663;"></i>--%>
                    <%--                                Online giá rẻ quá--%>
                    <%--                            </p>--%>
                    <%--                            <div class="gia-sale">--%>
                    <%--                                <p class="price-old">8.690.000 </p>--%>
                    <%--                                <span class="percent">-54%</span>--%>
                    <%--                            </div>--%>
                    <%--                            <strong class="price-sale">3.990.000₫</strong>--%>
                    <%--                            <div class="item-rating">--%>
                    <%--                                <p>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ea744d;"></i>--%>
                    <%--                                    <i class="fa-solid fa-star" style="color: #ededed;"></i>--%>
                    <%--                                </p>--%>
                    <%--                                <p class="item-rating-total">40</p>--%>
                    <%--                                <a href="" class="item-ss"><i class="fa-solid fa-code-compare"--%>
                    <%--                                                              style="color: #333333;"></i>--%>
                    <%--                                    So sánh</a>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>