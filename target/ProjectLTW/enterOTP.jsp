<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>Kích hoạt tài khoản</title>
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
      <img src="./img/logo-removebg-preview.png" alt="">
    </div>
    <div class="slider-form">
      <form action="ActiveAccountServlet" method="post">
<%--        <%--%>
<%--          String otp = (String) request.getSession().getAttribute("otp");--%>
<%--          String username = (String) request.getSession().getAttribute("username");--%>
<%--        %>--%>
<%--        <input type="hidden" name="otp" value="<%= otp %>"/>--%>
<%--        <input type="hidden" name="username" value="<%= username %>"/>--%>
        <h1>Nhập email</h1>
        <div class="input-box">
          <input type="text" placeholder="Nhập mã OTP được gửi về email" name="enterOTP">
        </div>
        <div class="signin-btn">
          <button type="submit" class="btn">Kích hoạt</button>
        </div>
        <%
          String message = (String) request.getSession().getAttribute("message");
          if (message != null && !message.isEmpty()) {
        %>
        <p style="color: red"> <%= message %> </p>
        <%
            // Đặt lại giá trị message sau khi đã hiển thị
            request.getSession().removeAttribute("message");
          }
        %>

      </form>
    </div>
  </div>
  <%@include file="footer.jsp"%>
</div>
script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $('.message a').click(function(){
    $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
  });
</script>
</body>
</html>
