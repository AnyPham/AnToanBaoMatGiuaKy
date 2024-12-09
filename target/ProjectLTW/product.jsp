<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Gallery" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Comment" %>
<%@ page import="service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Product product = (Product) request.getAttribute("product");
    if (product == null) product = new Product();
    List<Gallery> galleries = (List<Gallery>) request.getAttribute("galleries");
    if (galleries == null) galleries = new ArrayList<>();

    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    if (comments == null) comments = new ArrayList<>();
%>

<% String error = (String) request.getAttribute("error");%>
<% String content = (String) request.getParameter("content"); %>
<% String rating = (String) request.getParameter("rating"); %>
<% int idProduct = product.getId(); %>


<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm demo</title>
    <link rel="stylesheet" href="css/product.css">
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="main">
    <%@include file="header.jsp" %>
    <!-------------------------------Product--------------------------->
    <section class="product">
        <div class="container">
            <div class="product-content">
                <div class="product-content-top">
                    <p style="font-size: 13.5px">Trang chủ<span>&#10230;</span></p>
                    <p style="font-size: 13.5px">Máy lọc nước<span>&#10230;</span></p>
                    <p style="font-size: 13.5px"><%=product.getTitle()%>
                    </p>
                </div>
                <div class="product-content-left">

                    <div class="product-content-left-big-img">
                        <img src="<%=product.getImg()%>"/>
                    </div>
                    <div class="product-content-left-small-img">
                        <img src="<%=galleries.get(0).getImg()%>"/>
                        <img src="<%=galleries.get(1).getImg()%>"/>
                        <img src="<%=galleries.get(2).getImg()%>"/>
                    </div>

                    <div class="product-content-right">
                        <div class="product-content-right-product-name">
                            <h1 style="font-size: 22px"><%=product.getTitle()%>
                            </h1>
                        </div>
                        <div class="product-content-right-product-price">
                            <p style="font-size: 22px; color: #f18f31"><%=numberFormat.format(product.getDiscount_price())%>
                                <sup>đ
                                </sup>
                            </p>
                        </div>
                        <div class="banner-khuyenmai">
                            <img src="img/CANG-MUA-CANG-GIAM-V2-920x230.png"/>
                        </div>
                        <div class="khuyenmai">
                            <div class="khuyenmai ">
                                <form action="">
                                    <div class="khuyenmai-title">
                                        <h1 style="font-size: 14px">Khuyến mãi</h1>
                                        <h2 style="font-size: 12px">Khuyến mãi áp dụng đến 23:59 | 22/10</h2>
                                    </div>
                                    <div class="khuyenmai-content">
                                        <ol>
                                            <li style="font-size: 11px">Tặng coupon Miễn phí lõi lọc thô số 1 và 3
                                                coupon Giảm 20% khi mua lõi lần sau.
                                                <a href="https://www.dienmayxanh.com/khuyen-mai/uong-sach-khoe-qua-may-loc-nuoc-gia-re-qua-1539939">Xem
                                                    chi tiết</a></li>
                                            <li style="font-size: 11px">Cơ hội trúng TIVI LG 65 inch <a
                                                    href="https://www.dienmayxanh.com/khuyen-mai/mua-may-loc-nuoc-co-hoi-trung-10-tivi-lg-65-inch-1540000">Xem
                                                chi tiết</a></li>
                                        </ol>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="product-content-right-product-button">
                            <%String CheckLogin = user != null ? "add-card?id=" + product.getId() + "&page=7" : "login.jsp";%>
                            <a href="<%=CheckLogin%>">MUA NGAY</a>

                        </div>
                        <div class="product-content-right-goidatmua">
                            <p style="font-size: 13.5px">Gọi đặt mua <b style="color: #2f80ed">1800.1061</b> (7:30 -
                                22:00)</p>
                        </div>
                    </div>
                </div>
                <div class="product-content-baohanh">
                    <div class="product-content-baohanh-head">
                        <p style="font-size: 13.5px"><i class="fa-solid fa-gears"></i> <b>Lắp đặt miễn phí</b> lúc giao
                            hàng</p>
                        <p style="font-size: 13.5px"><i class="fa-solid fa-rotate-right"></i> Hư gì đổi nấy <b>12
                            tháng</b> tận nhà (miễn phí tháng đầu)<a
                                href="https://www.dienmayxanh.com/bao-hanh-doi-tra">Xem chi tiết</a></p>
                    </div>
                    <div class="product-content-baohanh-bottom">
                        <p style="font-size: 13.5px"><i class="fa-solid fa-shield"></i> Bảo hành <b>chính hãng 2 năm</b>,
                            có người đến tận nhà</p>
                        <p style="font-size: 13.5px"><i class="fa-solid fa-circle-info"></i> Miễn phí công lắp đặt. Phí
                            vật tư có thể phát sinh: <b>65.000₫</b></p>
                    </div>
                </div>
                <div class="product-content-big-content">
                    <div class="product-content-big-content-title">
                        <div class="product-content-title-item ttsp">
                            <p style="font-size: 15px">Thông tin sản phẩm</p>
                        </div>
                    </div>
                    <div class="product-content-thongtin">
                        <div class="product-content-thongtinsanpham">
                            <p><b style="font-style: italic" style="font-size: 15px"><%=product.getTitle()%></b></p>
                            <p><b><%=product.getTitle()%> <%=product.getDescriptions()%></b></p>
                                <img src="<%=galleries.get(2).getImg()%>"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="danhgia-sp">
                <div class="rating">
                    <form id="reviewForm" action="javascript:void(0);">
                        <div class="star-rating">
                            <input type="radio" id="star1" name="rating" value="1">
                            <label for="star1"><i class="fa-solid fa-star" style="color: #f18f31"></i></label>
                            <input type="radio" id="star2" name="rating" value="2">
                            <label for="star2"><i class="fa-solid fa-star" style="color: #f18f31"></i></label>
                            <input type="radio" id="star3" name="rating" value="3">
                            <label for="star3"><i class="fa-solid fa-star" style="color: #f18f31"></i></label>
                            <input type="radio" id="star4" name="rating" value="4">
                            <label for="star4"><i class="fa-solid fa-star" style="color: #f18f31"></i></label>
                            <input type="radio" id="star5" name="rating" value="5" checked>
                            <label for="star5"><i class="fa-solid fa-star" style="color: #f18f31"></i></label>
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Viết đánh giá" name="content" id="content">
                        </div>
                        <span class="error-message" style="color: red; font-size: 14px;padding-left: 20px;"></span>
                        <div class="sent-btn">
                            <button type="submit" id="gui" class="btn">Gửi đánh giá</button>
                        </div>
                    </form>
                </div>
                <div class="danhgia-sp-footer">
                    <% for (Comment comment : comments) { %>
                    <div class="khachhang1" id="comment-<%= comment.getId() %>">
                        <h3>Người dùng: <%= UserService.getInstance().getFullNameById(comment.getUserId()) %></h3>
                        <h2>Đánh giá
                            <%
                                int starCount = Integer.parseInt(comment.getStar());
                                for (int i = 0; i < starCount; i++) {
                            %>
                            <i class="fa-solid fa-star" style="color: #f18f31"></i>
                            <%
                                }
                            %>
                        </h2>
                        <p>Nội dung: <%= comment.getContents() %></p>
                        <p>Thời gian: <%= comment.getCreate_date() %></p>
                    </div>
                    <% } %>
                </div>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script>
                $(document).ready(function() {
                    $('#reviewForm').on('submit', function(e) {
                        e.preventDefault();
                        var content = $('#content').val();
                        var rating = $('input[name="rating"]:checked').val();
                        var productId = '<%=idProduct%>';

                        $.ajax({
                            url: './commentController',
                            type: 'POST',
                            data: {
                                content: content,
                                rating: rating,
                                id: productId
                            },
                            success: function(response) {
                                var commentHtml = '<div class="khachhang1"><h3>Người dùng: ' + response.userFullName + '</h3><h2>Đánh giá';
                                for (var i = 0; i < response.rating; i++) {
                                    commentHtml += '<i class="fa-solid fa-star" style="color: #f18f31"></i>';
                                }
                                commentHtml += '</h2><p>Nội dung: ' + response.content + '</p><p>Thời gian: ' + response.createDate + '</p></div>';
                                $('.danhgia-sp-footer').append(commentHtml);
                                $('#content').val('');
                                $('input[name="rating"]').prop('checked', false);
                                $('#star5').prop('checked', true);
                            },
                            error: function(response) {
                                alert('Đã xảy ra lỗi. Vui lòng thử lại.');
                            }
                        });
                    });
                });
            </script>

            <!--------------------------San pham lien quan------>
            <section class="product-related container">
                <div class="product-related-title">
                    <p>SẢN PHẨM LIÊN QUAN</p>
                </div>
                <div class="product-related-content">
                    <div class="product-related-item">
                        <img src="img/may-loc-nuoc-ro-nong-nguoi-lanh-sanaky-vh202hy-11-loi-210223-102110-600x600.jpg"/>
                        <h1>Máy lọc nước Sanaky VH2021Y6</h1>
                        <p>5.990.000 <sup>đ</sup></p>
                    </div>
                    <div class="product-related-item">
                        <img src="img/may-loc-nuoc-ro-hoa-phat-hws1b-1022-10-loi-230623-025945-600x600.jpg"/>
                        <h1>Máy lọc nước Hòa Phát VH2021Y7</h1>
                        <p>9.990.000 <sup>đ</sup></p>
                    </div>
                    <div class="product-related-item">
                        <img src="img/may-loc-nuoc-ro-kangaroo-kg10a4-vtu-10-loi-0-600x600-1.jpg"/>
                        <h1>Máy lọc nước Kangaroo VH2021Y8</h1>
                        <p>10.990.000 <sup>đ</sup></p>
                    </div>
                    <div class="product-related-item">
                        <img src="img/may-loc-nuoc-ro-karofi-kaq-x16-10-loi-130223-054043-600x600.jpg"/>
                        <h1>Máy lọc nước Karofi VH2021Y9</h1>
                        <p>8.990.000 <sup>đ</sup></p>
                    </div>
                </div>

            </section>
            <%@include file="footer.jsp" %>
        </div>
    </section>
</div>
</body>
<script src="/js/mainjs.js"></script>
</html>
