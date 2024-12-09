package controller;

import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ActiveAccountServlet", value = "/ActiveAccountServlet")
public class ActiveAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String otp = (String) request.getSession().getAttribute("otp");
        String username = (String) request.getSession().getAttribute("userName");
        String enterOTP = request.getParameter("enterOTP");
        if(otp.equals(enterOTP)) {
            UserDAO.updateActiveAccount(username);
            request.getSession().setAttribute("message", "Kích hoạt tài khoản thành công!");
            response.sendRedirect("login.jsp");

        } else {
            request.getSession().setAttribute("message", "Sai mã OTP!");
            response.sendRedirect("enterOTP.jsp");
        }
    }
}
