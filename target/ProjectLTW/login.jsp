<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập tài khoản</title>
    <link rel="stylesheet" href="./css/login.css">
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
    <script>
        function statusChangeCallback(response) {
            console.log('statusChangeCallback');
            console.log(response);
            if (response.status === 'connected') {
                testAPI();
            } else {
                var statusElement = document.getElementById('status');
                if (statusElement) {
                    statusElement.innerHTML = 'Vui lòng đăng nhập.';
                } else {
                    console.error('Không tìm thấy phần tử trạng thái!');
                }
            }
        }

        function checkLoginState() {
            FB.login(function (response) {
                statusChangeCallback(response);
            }, {scope: 'public_profile,email'});
        }

        window.fbAsyncInit = function () {
            FB.init({
                appId: '814520760213351',
                cookie: true,
                xfbml: true,
                version: 'v17.0'
            });
        };

        function testAPI() {
            console.log('Chào mừng! Đang lấy thông tin của bạn.... ');
            FB.api('/me', {fields: 'name, email'}, function (response) {
                console.log('Đăng nhập thành công cho: ' + response.name);
                window.location.href = 'LoginServlet?action=loginFacebook&name=' + encodeURIComponent(response.name) + '&email=' + encodeURIComponent(response.email) + '&id=' + response.id;
            });
        }
    </script>
</head>
<body>
<div id="header">
    <div class="container">
        <ul>
            <li class="logo">
                <img src="./img/logo-removebg-preview.png" alt="logo">
            </li>
            <li class="label">
                <h2>Đăng nhập</h2>
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
            <form action="LoginServlet" method="post">
                <%
                    String message = (String) request.getSession().getAttribute("message");
                    if (message != null && !message.isEmpty()) {
                %>
                <p style="color: red;
    text-align: center;
    font-size: 14px;
    font-weight: bold;
    margin-top: 10px;"><%= message %>
                </p>
                <%
                        // Đặt lại giá trị message sau khi đã hiển thị
                        request.getSession().removeAttribute("message");
                    }
                %>
                <h1 style="text-align: center;">Đăng Nhập</h1>
                <div class="input-box">
                    <input type="text" placeholder="Email/ Tên đăng nhập" name="username" value="${usernameCookie}"/>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Mật khẩu" name="password" value="${passwordCookie}"/>
                </div>

                <div class="signin-btn">
                    <button type="submit" class="btn">Đăng Nhập</button>
                </div>
                <div style="padding-left: 20px; padding-top: 20px">
                    <input type="checkbox" name="remember" style="cursor: pointer" value="on">
                    <label style="font-size: 14px">Ghi nhớ tài khoản</label><br>
                </div>
            </form>
            <div class="label-forget">
                <a href="forgotPassword.jsp" class="forget">Quên mật khẩu</a>
            </div>
            <div class="label-or">
                <p for="">Hoặc</p>
            </div>
            <div class="btn-ggfb">
                <button type="button" class="btnfb" onclick="checkLoginState()">
                    <i class="fa-brands fa-facebook"></i> Facebook
                </button>
                <button class="btngg">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid

&redirect_uri=http://localhost:8080/ProjectLTW_war/loginGoogle

&response_type=code

&client_id=192822040743-2t27r1e2sp8ounatnoqjid4o2qvqij9h.apps.googleusercontent.com

&approval_prompt=force" style="color: white; text-decoration: none; font-size: 16px ">
                        <i class="fa-brands fa-google" style="color: white"></i> Google
                    </a>
                </button>
            </div>
            <div class="des">
                <p>Bạn mới biết đến Healthywater? </p>
                <a href="register.jsp">Đăng kí</a>
            </div>
            <%
                String message2 = (String) request.getSession().getAttribute("message2");
                if (message2 != null && !message2.isEmpty()) {
            %>
            <p style="color: red"><%= message2 %>
            </p>
            <%
                    // Đặt lại giá trị message sau khi đã hiển thị
                    request.getSession().removeAttribute("message2");
                }
            %>
        </div>
    </div>
</div>
<div id="fb-root"></div>
<div id="status"></div> <!-- Thêm phần tử này để hiển thị trạng thái -->
<%@include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $('.message a').click(function () {
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });
</script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js"></script>
</body>
</html>
