<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quên mật khẩu</title>
  <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/forget.css">

</head>
<body>
<div id="header">
  <div class="container">
    <ul>
      <li class="logo">
        <img src="./img/logo-removebg-preview.png" alt="logo">
      </li>
      <li class="label">
        <h2>Quên mật khẩu</h2>
      </li>
      <li class="help">
        <a href="contact.jsp">Bạn cần giúp đỡ?</a>
      </li>
    </ul>
  </div>
</div>
<div class="slider">
  <div class="container">
    <div class="slider-logo">
      <img src="/img/logo-removebg-preview.png" alt="">
    </div>
    <div class="slider-form">
      <form action="ChangePassForgot" method="post">
<%--        <%--%>

<%--          String username = (String) request.getSession().getAttribute("username");--%>

<%--        %>--%>
<%--        <input type="hidden" name="username" value="<%= username %>"/>--%>

        <h1>Quên mật khẩu</h1>
        <div class="input-box">
          <input type="password" placeholder="Nhập mật khẩu mới" name="newPassword">
        </div>
        <div class="input-box-2">
          <input type="password" placeholder="Nhập lại mật khẩu" name="re_newPassword">

        </div>

        <div class="signin-btn">
          <button type="submit" class="btn">Đổi mật khẩu</button>
        </div>
        <%
          String message = (String) request.getSession().getAttribute("message");
          if (message != null && !message.isEmpty()) {
        %>
        <div style="text-align: center;margin-top: 10px"><p style="color: red"> <%= message %> </p></div>
        <%
            // Đặt lại giá trị message sau khi đã hiển thị
            request.getSession().removeAttribute("message");
          }
        %>

      </form>
    </div>
  </div>
</div>
<%@include file="footer.jsp"%>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $('.message a').click(function(){
    $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
  });
</script>
</body>
</html>
