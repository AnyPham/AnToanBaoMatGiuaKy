package controller;

import dao.UserDAO;
import model.GoogleAccount;
import model.User;
import service.Google;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
@WebServlet(name = "LoginGoogle", value = "/loginGoogle")
public class LoginGoogle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        Google gg = new Google();
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);
        System.out.println(acc.getId());
        if(!(UserService.getInstance().loginUser(acc.getId(), PasswordUtils.hashPassword(acc.getId())))){

            UserService.addUser(acc.getId(),acc.getName(), acc.getEmail(), "null", PasswordUtils.hashPassword(acc.getId()));
            UserDAO.updateActiveAccount(acc.getId());
            String hashedPassword = PasswordUtils.hashPassword(acc.getId());
            boolean loginSuccess = UserDAO.loginUser(acc.getId(), hashedPassword);
            if (loginSuccess) {
                HttpSession session = request.getSession();
                User user = UserDAO.getUserInfo(acc.getId());
                handleUserLoginSuccess(response, session, user, "index.jsp");
            }
        }
        else if (UserDAO.loginUser(acc.getId(), PasswordUtils.hashPassword(acc.getId()))) {
            User user = UserDAO.getUserInfo(acc.getId());
            HttpSession session = request.getSession();
            if (user != null && user.getRoleId() == 2) {
                UserDAO userDAO = new UserDAO();
                handleUserLoginSuccess(response, session, user, "index.jsp");
            } else if (user != null && user.getRoleId() == 1) {
                request.getSession().setAttribute("user", user);
                handleUserLoginSuccess(response, session, user, "/ProjectLTW_war/pageAdminController");
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            handleLoginFailure(response, request, "Tài khoản chưa được kích hoạt ");
        }
    }
    private void handleUserLoginSuccess(HttpServletResponse response, HttpSession session, User user, String redirectPage)
            throws IOException {
        session.setAttribute("user", user);
        response.sendRedirect(redirectPage);

    }
    private void handleLoginFailure(HttpServletResponse response, HttpServletRequest request, String errorMessage) throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("message2", errorMessage);
        response.sendRedirect("login.jsp");
    }
}


