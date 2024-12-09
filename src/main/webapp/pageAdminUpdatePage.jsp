<%@ page import="dao.BlogDAO" %>
<%@ page import="model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Post post = (Post) request.getSession().getAttribute("post");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật bài viết</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            <div class="title">Chỉnh sửa thông tin bài viết</div>
            <form class="row" action="pageAdminEditBlog?id=<%=post.getId()%>" enctype="multipart/form-data" >
                <div class="form-group col-md-3">
                    <label class="control-label">Tiêu đề</label>
                    <input name="title" class="form-control" type="text" value="<%=post.getTitle()%>">
                </div>
                <div class="form-group col-md-3">
                    <label class="control-label">Tác giả</label>
                    <select name="author" class="form-control">
                        <option value="" disabled selected>--- Chọn tác giả ---</option>
                        <option value="Nguyễn Thanh Hoài" <%=post.getAuthor().equals("Nguyễn Thanh Hoài") ? "selected" : "" %>>Nguyễn Thanh Hoài</option>
                        <option value="Đoàn Quốc Huy" <%=post.getAuthor().equals("Đoàn Quốc Huy") ? "selected" : "" %>>Đoàn Quốc Huy</option>
                        <option value="Nguyễn Quốc Bình" <%=post.getAuthor().equals("Nguyễn Quốc Bình") ? "selected" : "" %>>Nguyễn Quốc Bình</option>
                    </select>
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label">Ảnh minh họa: </label>
                    <img style="width: 150px;" src="<%=post.getImg()%>" alt="Product Image">
                    <input style="display: block" type="file" name="img">
                </div>

                <div class="form-group col-md-12">
                    <label style="display: block" class="control-label">Ảnh sản phẩm:</label>
                    <textarea class="form-control" name="content" id="mota"><%=post.getContent()%></textarea>
                </div>
                <button id="externalButton" class="btn btn-save" type="submit">Lưu lại</button>
                <a class="btn btn-cancel" href="pageAdmin_Blog.jsp">Hủy bỏ</a>
            </form>

        </div>
    </div>
</section>

<script src="../js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/main.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Bắt sự kiện click cho nút ở ngoài form
        document.getElementById("externalButton").addEventListener("click", function () {
            // Gọi hàm submitForm() khi nút được nhấn
            submitForm();
        });
    });

    // Hàm để gửi form
    function submitForm() {
        // Lấy đối tượng form bằng ID
        var form = document.getElementById("myForm");

        // Gửi form
        form.submit();
    }


    document.addEventListener("DOMContentLoaded", function () {
        var idParam = <%= request.getAttribute("idParam") %>;
        document.querySelector('input[name="idP"]').value = idParam;
    });
</script>
</body>
</html>
