<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="model.Post" %>
<%@ page import="dao.BlogDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List< Post> postList = BlogDAO.getAllPosts();
  if (postList==null) postList=new ArrayList<>();
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
      <div class="title">Quản Lý Blog</div>
      <div class="row">
        <div class="col-md-12">
          <div class="row element-button">
            <div class="col-sm-2">
              <a class="btn btn-add btn-sm" href="pageAdmin_addBlog1.jsp" title="Thêm">
                <i class="fas fa-plus"></i>
                Viết bài mới</a>
            </div>

          </div>

          <table id="table-id" class="table table-hover table-bordered">
            <thead>
            <tr>
              <th scope="col">Mã</th>
              <th scope="col">Tiêu đề</th>
              <th scope="col">Nội dung</th>
              <th scope="col">Tác giả </th>
              <th scope="col">Hình ảnh</th>
              <th scope="col">Chức năng</th>
            </tr>
            </thead>
            <tbody>
            <%for (Post post: postList){%>
            <tr>
              <th scope="row"><%=post.getId()%></th>
              <td><%=post.getTitle()%></td>
              <td><%=post.getContent()%></td>
             <td><%=post.getAuthor()%></td>
              <td><img src="<%=post.getImg()%>"  style="max-width: 100px; max-height: 100px;"></td>
              <td>
                <a title="Xóa" href="remove-blog?id=<%=post.getId()%>" class="icon-link">
                  <i class="icon-wrapper">
                    <i class="fas fa-trash-alt"></i> <!-- Biểu tượng thùng rác -->
                  </i>
                </a>
                <a title="Cập nhật" href="PageAdminUpdatePage?id=<%=post.getId()%>" class="icon-link">
                  <i class="icon-wrapper">
                    <i class="fas fa-pen"></i> <!-- Biểu tượng thùng rác -->
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

<script src="../../../js/jquery.min.js"></script>
<script src="../../../js/jquery.dataTables.js"></script>

<script type="text/javascript" charset="utf8" src="../../../js/bootstrap.bundle.min.js"></script>
<script>$("#table-id").DataTable();
</script>

</body>
</html>
