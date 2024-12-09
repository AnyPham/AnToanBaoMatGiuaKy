<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String name = (String) request.getParameter("name"); %>
<% String username = (String) request.getParameter("username"); %>
<% String phone = (String) request.getParameter("phone"); %>
<% String email = (String) request.getParameter("email"); %>
<% String password = (String) request.getParameter("password"); %>
<% String error = (String) request.getAttribute("error");%>
<%--<% String success = (String) request.getAttribute("success");%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng kí ngay</title>
    <link rel="stylesheet" href="./css/register.css">
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="header">
    <div class="container">
        <ul>
            <li class="logo">
                <img src="./img/logo-removebg-preview.png" alt="logo">
            </li>
            <li class="label">
                <h2>Đăng ký</h2>
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
            <form action="registerController" accept-charset="UTF-8" method="post">
                <h1>Đăng ký</h1>
                <div class="input-box">
                    <input id="name" type="text" value="<%=(name!=null && name!="")? name:""%>" placeholder="Họ và tên"
                           name="name">
                    <div id="err-name"></div>
                </div>
                <div class="input-box">
                    <input id="email" type="email" value="<%=(email!=null && email!="")? email:""%>" placeholder="Email"
                           name="email">
                    <div id="err-email"></div>
                </div>
                <div class="input-box">
                    <input id="phone" type="text" value="<%=(phone!=null && phone!="")? phone:""%>"
                           placeholder="Số điện thoại"
                           name="phone">
                    <div id="err-phone"></div>
                </div>
                <div class="input-box">
                    <input id="username" type="text" value="<%=(username!=null && username!="")? username:""%>"
                           placeholder="Tên đăng nhập" name="username">
                    <div id="err-username"></div>
                </div>
                <div class="input-box">
                    <input type="password" id="password" placeholder="Mật khẩu" name="password">
                    <div id="err-password"></div>
                </div>
                <div class="input-box">
                    <input type="password" id="re-password" placeholder="Lặp lại mật khẩu" name="repassword">
                </div>
                <span style="color: red; font-size: 14px;padding-left: 20px;"><%=(error != null && error != "") ? error : ""%></span>
                <div class="signin-btn">
                    <button type="submit" id="submit-btn" class="btn">Đăng Ký</button>
                </div>
               <div id="error"></div>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</div>
<script>
    let btnSubmit = document.getElementById("submit-btn")
    btnSubmit.addEventListener("click", function () {
        let name = document.getElementById("name").getText();
        let email = document.getElementById("email").getText();
        let phone = document.getElementById("phone").getText();
        let username = document.getElementById("username").getText();
        let password = document.getElementById("password").getText();
        let repassword = document.getElementById("re-password").getText();
        if (name === "" || email === "" || phone === "" || username === "" || password === "" || repassword === "") {
            error = document.getElementById("error")
            error.innerHTML = "Vui lòng điền đầy đủ thông tin"
        }
        if (ussername < 8){
            errUsername = document.getElementById("err-username")
            errUsername.innerHTML = "Tên đăng nhập phải có ít nhất 8 ký tự"
        }




    })

</script>
</body>
</html>