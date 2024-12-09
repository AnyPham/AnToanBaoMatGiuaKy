package controller;

//import service.EmailNotification;

import mail.MailService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;
import java.util.regex.Pattern;

@WebServlet(name = "RegisterController", value = "/registerController")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String fullName = req.getParameter("name").trim();
        String email = req.getParameter("email").trim();
        String userName = req.getParameter("username").trim().toLowerCase();
        String phone = req.getParameter("phone").trim();
        String password = req.getParameter("password");
        String rePassword = req.getParameter("repassword");
        Pattern patternEmail = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");
        if (fullName == null || fullName.equals("") || email == null || email.equals("") || userName == null || userName.equals("") ||
                phone == null || phone.equals("") || password == null || password.equals("") || rePassword == null || rePassword.equals("")) {
            req.setAttribute("error", "Bạn cần nhập các đủ thông tin ");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (UserService.isValidEmail(email) == false) {
            req.setAttribute("error", "Email không hợp lệ");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (UserService.isEmailExists(email) == true && UserService.isUserExists(userName) == true) {
            req.setAttribute("error", "Email và Tên đăng nhập đã được sử dụng");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (UserService.isEmailExists(email) == true) {
            req.setAttribute("error", "Email đã được sử dụng");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (UserService.countPassword(password) == false) {
            req.setAttribute("error", "Mật khẩu phải có ít nhất 8 kí tự");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (UserService.isUserExists(userName) == true) {
            req.setAttribute("error", "Tên đăng nhập đã được sử dụng");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (UserService.isMatchPassword(password, rePassword) == false) {
            req.setAttribute("error", "Mật khẩu bạn nhập không trùng nhau");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else {
//            req.setAttribute("success", "Đăng ký thành công");
            // Tạo một đối tượng Random
            Random rand = new Random();
            // Tạo một số ngẫu nhiên từ 0 đến 999999
            int otp = rand.nextInt(1000000);
            // Đảm bảo rằng số OTP có đủ 6 chữ số bằng cách thêm các số 0 vào đầu nếu cần
            String otpString = String.format("%06d", otp);
            MailService.send(email, "Mã xác nhận", "Mã xác nhận của bạn là: " + otpString);
            String encryptedPassword = PasswordUtils.hashPassword(password);
            UserService.getInstance().addUser(userName, fullName, email, phone, encryptedPassword);
            req.getSession().setAttribute("otp", otpString);
            req.getSession().setAttribute("userName", userName);
            resp.sendRedirect("enterOTP.jsp");
//            EmailNotification.sendNotification("binhquoc23@gmail.com");
        }
    }
}
