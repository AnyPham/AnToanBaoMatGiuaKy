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
                    this.action = "filter?page_id=3&brand_id=" + brandId + "&type_id=" + typeId;
                });
            </script>
            <!--            Kết thúc phần lọc sản phẩm-->
            <div class="product-content">
                <div class="content-may-loc">
                    <% for(Product p : products) { %>
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
                            <h3><%=p.getTitle()%></h3>
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
                                <a href="add-card?id=<%=p.getId()%>&page=5" class="item-ss"><i class="fa-solid fa-code-compare"
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
<div class="modal-tinh-thanh js-modal-tinh-thanh">
    <div class="modal-container js-modal-container">
        <div class="header-modal">
            <div class="title-modal">
                <p>Quý khách vui lòng cho biết <span>Địa Chỉ Nhận Hàng </span>để biết chính xác thời gian dao hàng</p>
                <a class="js-close"><i class="fa-solid fa-x fa-2xs" style="color: #ffffff;"></i></i>Đóng</a>
            </div>
            <form action="">
                <input type="text" placeholder="Tìm nhanh tỉnh thành, quận huyện, phường xã" class="tim-khu-vuc">
                <div class="icon-mini">
                    <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                </div>
            </form>
        </div>
        <div class="content-big">
            <div class="content-modal">
                <p class="title">Hoặc chọn tỉnh, thành phố</p>
                <ul class="list-tinh-thanh">
                    <li><a href="">Hồ Chí Minh</a></li>
                    <li><a href="">Hà Nội</a></li>
                    <li><a href="">Đà Nẵng</a></li>
                    <li><a href="">An Giang</a></li>
                    <li><a href="">Bà Rịa - Vũng Tàu</a></li>
                    <li><a href="">Bắc Giang</a></li>
                    <li><a href="">Bắc Kạn</a></li>
                    <li><a href="">Bạc Liêu</a></li>
                    <li><a href="">Bắc Ninh</a></li>
                    <li><a href="">Bến Tre</a></li>
                    <li><a href="">Bình Định</a></li>
                    <li><a href="">Bình Dương</a></li>
                    <li><a href="">Bình Phước</a></li>
                    <li><a href="">Bình Thuận</a></li>
                    <li><a href="">Cà Mau</a></li>
                    <li><a href="">Cần Thơ</a></li>
                    <li><a href="">Cao Bằng</a></li>
                    <li><a href="">Đắk Lắk</a></li>
                    <li><a href="">Đắk Nông</a></li>
                    <li><a href="">Điện Biên</a></li>
                    <li><a href="">Đồng Nai</a></li>
                    <li><a href="">Đồng Tháp</a></li>
                    <li><a href="">Gia Lai</a></li>
                    <li><a href="">Hà Giang</a></li>
                    <li><a href="">Hà Nam</a></li>
                    <li><a href="">Hà Tĩnh</a></li>
                    <li><a href="">Hải Dương</a></li>
                    <li><a href="">Hải Phòng</a></li>
                    <li><a href="">Hậu Giang</a></li>
                    <li><a href="">Hòa Bình</a></li>
                    <li><a href="">Hưng Yên</a></li>
                    <li><a href="">Khánh Hòa</a></li>
                    <li><a href="">Kiên Giang</a></li>
                    <li><a href="">Kon Tum</a></li>
                    <li><a href="">Lai Châu</a></li>
                    <li><a href="">Lâm Đồng</a></li>
                    <li><a href="">Lạng Sơn</a></li>
                    <li><a href="">Lào Cai</a></li>
                    <li><a href="">Long An</a></li>
                    <li><a href="">Nam Định</a></li>
                    <li><a href="">Nghệ An</a></li>
                    <li><a href="">Ninh Bình</a></li>
                    <li><a href="">Ninh Thuận</a></li>
                    <li><a href="">Phú Thọ</a></li>
                    <li><a href="">Phú Yên</a></li>
                    <li><a href="">Quảng Bình</a></li>
                    <li><a href="">Quảng Nam</a></li>
                    <li><a href="">Quảng Ngãi</a></li>
                    <li><a href="">Quảng Ninh</a></li>
                    <li><a href="">Quảng Trị</a></li>
                    <li><a href="">Sóc Trăng</a></li>
                    <li><a href="">Sơn La</a></li>
                    <li><a href="">Tây Ninh</a></li>
                    <li><a href="">Thái Bình</a></li>
                    <li><a href="">Thái Nguyên</a></li>
                    <li><a href="">Thanh Hóa</a></li>
                    <li><a href="">Thừa Thiên Huế</a></li>
                    <li><a href="">Tiền Giang</a></li>
                    <li><a href="">Trà Vinh</a></li>
                    <li><a href="">Tuyên Quang</a></li>
                    <li><a href="">Vĩnh Long</a></li>
                    <li><a href="">Vĩnh Phúc</a></li>
                    <li><a href="">Yên Bái</a></li>
                </ul>
            </div>
        </div>

    </div>
    <script>
        const timTinh = document.querySelectorAll('.js-tim-tinh');
        const modal = document.querySelector('.js-modal-tinh-thanh');
        const close = document.querySelectorAll('.js-close');
        const modalContainer = document.querySelector('.js-modal-container');

        function showTinhThanh() {
            modal.classList.add('open');
        }

        function hideTinhThanh() {
            modal.classList.remove('open');
        }

        for (const timTinhElement of timTinh) {
            timTinhElement.addEventListener('click', showTinhThanh);

        }
        for (const closeElement of close) {
            closeElement.addEventListener('click', hideTinhThanh);

        }

        modal.addEventListener('click', hideTinhThanh);
        modalContainer.addEventListener('click', function (event) {
            event.stopPropagation();
        });
    </script>
</div>
</body>
</html>