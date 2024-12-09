package controller;

import dao.UserDAO;
import mail.MailService;
import service.EmailSender;
import service.OTPGenerator;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "ForgotPassword", value = "/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      response.setCharacterEncoding("UTF-8");
      String username = request.getParameter("username");
      request.getSession().setAttribute("username",username);
      if (username == null || username.isEmpty()) {
        request.getRequestDispatcher("validateOTP.jsp").forward(request, response);
        return;
      }
      String email = UserDAO.getEmail(username);
      if (email != null) {
          // Tạo một đối tượng Random
          Random rand = new Random();

          // Tạo một số ngẫu nhiên từ 0 đến 999999
          int otp = rand.nextInt(1000000);

          // Đảm bảo rằng số OTP có đủ 6 chữ số bằng cách thêm các số 0 vào đầu nếu cần
          String otpString = String.format("%06d", otp);
          MailService.send(email, "Mã xác nhận", "Mã xác nhận của bạn là: " + otpString);
          request.getSession().setAttribute("otp",otpString);
        request.getRequestDispatcher("validateOTP.jsp").forward(request, response);
      } else {
        request.getRequestDispatcher("validateOTP.jsp").forward(request, response);
      }
    }

}
