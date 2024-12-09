package controller;

import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ChangePasswordController", value = "/change-pass")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String inputOldPass = req.getParameter("oldPass").trim();
        String inputNewPass = req.getParameter("newPass").trim();
        String inputRePass = req.getParameter("re-enter-pass").trim();
        User user = (User) session.getAttribute("user");
        boolean isChangePass = false;
        boolean isCheckOldPass = UserService.getInstance().checkPassByUserId(user.getId(), inputOldPass);
        if (!isCheckOldPass) {
            String error = "Mật khẩu cũ của bạn không đúng";
            session.setAttribute("error", error);
            resp.sendRedirect("account-page");
        } else {
            if (!inputNewPass.equals(inputRePass)) {
                String error = "Mật khẩu bạn nhập không đúng với mật khẩu mới";
                session.setAttribute("error", error);
                resp.sendRedirect("account-page");
            } else if (isChangePass = UserService.getInstance().changePassworById(user.getId(), inputNewPass)){
                    resp.sendRedirect("account-page");
            }


        }
    }
}
