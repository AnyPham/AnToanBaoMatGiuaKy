<%@ page import="dao.BlogDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Xóa bài viết</title>
</head>
<body>
<form id="myForm" action="RemoveBlogAdmin" method="post" class="row">
<%

  String id = request.getParameter("id");
  int postId = 0;
  if (id != null && id.matches("\\d+")) {
    postId = Integer.parseInt(id);
  }

  BlogDAO.deletePost(postId);
%>
</form>
<a href="pageAdmin_Blog.jsp">Quay lại</a>
</body>
</html>
