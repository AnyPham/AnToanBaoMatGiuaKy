package controller;

import dao.UserDAO;
import model.Product;
import model.User;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateUserInfoController", value = "/update-user")
public class UpdateUserInfoController extends HttpServlet {
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
        String gender = req.getParameter("gender").trim();
        String fullName = req.getParameter("inputFullName").trim();
        String phone = req.getParameter("inputPhone").trim();
        User user = (User) session.getAttribute("user");
        boolean checkUpdate = UserDAO.updateUserInfomationById(fullName, phone, user.getId());
        if (checkUpdate) {
            User newUser = UserDAO.getUserById(user.getId());
            System.out.println(newUser);
            session.setAttribute("user",newUser);
            resp.sendRedirect("/ProjectLTW_war/account-page");
        } else {
            String error = "error";
            req.setAttribute("error", error);
        }

    }



}
