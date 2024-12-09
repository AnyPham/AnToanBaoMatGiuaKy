<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Quản lí - Thêm bài viết Blog</title>
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
      <div class="title">Viết bài mới</div>
      <form id="myForm" action="AddBlogAdmin" enctype="multipart/form-data" method="post" class="row">
        <%
          int newID = 0;
          String idParam = request.getParameter("id");

          if (idParam != null && !idParam.isEmpty()) {
            try {
              newID = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
              // Xử lý ngoại lệ nếu giá trị không hợp lệ
              e.printStackTrace();
            }
          }
        %>
        <div style="display:none;" class="form-group col-md-3">
          <label class="control-label">Mã</label>
          <input name="idP" class="form-control" type="number" value="id" placeholder="<%= newID%>" readonly>
        </div>
        <div class="form-group col-md-3">
          <label class="control-label">Tiêu đề</label>
          <input name="title" class="form-control" type="text" value="">
        </div>
        <div class="form-group col-md-3">
          <label class="control-label">Tác giả</label>
          <select name="author" class="form-control"  >
            <option value="" disabled selected>--- Chọn tác giả ---</option>
            <option value="Nguyễn Thanh Hoài">Nguyễn Thanh Hoài</option>
            <option value="Đoàn Quốc Huy">Đoàn Quốc Huy</option>
            <option value="Nguyễn Quốc Bình">Nguyễn Quốc Bình</option>
          </select>
        </div>
          <div class="form-group col-md-12">
            <label class="control-label">Ảnh minh họa: </label>
            <input type="file" name="imgProduct">
          </div>

          <div class="form-group col-md-12">
            <label class="control-label">Nội dung</label>
            <textarea class="form-control" name="content" id="mota"></textarea>
          </div>
        <%String error = (String) request.getSession().getAttribute("error2");
          if(error!=null){%>
        <span style="color: red; margin: auto"><%=error%></span>
        <%}%>

        <%request.getSession().removeAttribute("error2");%>
        <button id="externalButton" class="btn btn-save" type="submit">Lưu lại</button>
        <a class="btn btn-cancel" href="pageAdmin_Blog.jsp">Hủy bỏ</a>
      </form>

    </div>
  </div>
</section>
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
</script>
</body>
</html>
