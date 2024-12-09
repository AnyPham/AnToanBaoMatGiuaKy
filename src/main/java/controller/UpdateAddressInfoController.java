package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateAddressInfoController", value = "/update-address")
public class UpdateAddressInfoController extends HttpServlet {
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
        String address = req.getParameter("inputAddress").trim();
        User user = (User) session.getAttribute("user");
        boolean checkUpdate = UserDAO.updateUserAddressById(address, user.getId());
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
