package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ValidateOTPForgotPassword", value = "/ValidateOTPForgotPassword")
public class ValidateOTPForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      response.setCharacterEncoding("UTF-8");
        String otp = (String) request.getSession().getAttribute("otp");
        String enterOTP = request.getParameter("enterOTP");
        String username = (String) request.getSession().getAttribute("username");
        System.out.println(username);
        if (otp != null && enterOTP != null && username != null) {
          request.getSession().setAttribute("username", username);

          if (otp.equals(enterOTP)) {
            response.sendRedirect("newPassword.jsp");
          } else {
            request.getSession().setAttribute("message", "Sai mã OTP");
              request.getRequestDispatcher("validateOTP.jsp").forward(request,response);
          }
        }

    }
}
