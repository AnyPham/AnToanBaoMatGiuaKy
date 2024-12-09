<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
            <%
              String message = request.getParameter("message");
              if (message != null && !message.isEmpty()) {
            %>
            <p style="color: red"> <%= message %> </p>
            <%
                // Đặt lại giá trị message sau khi đã hiển thị
                request.getSession().removeAttribute("message");
              }
            %>
      <form action="ForgotPassword" class= "slider-form" method="post">
        <h1>Quên mật khẩu</h1>
        <div class="input-box">
          <input type="text" value="" placeholder="Nhập tên tài khoản để lấy lại mật khẩu" name="username">
        </div>
        <div class="signin-btn">
          <button type="submit" class="btn">Lấy lại mật khẩu</button>
        </div>
      </form>
    </div>
  </div>
</div>

</div>
<%@include file="footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $('.message a').click(function(){
    $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
  });
</script>
</body>
</html>
