package controller;


import dao.UserDAO;
import model.AbsDao;
import model.User;
import service.UserService;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class Login extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("loginFacebook")) {
            loginFacebook(request, response);
        } else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            String hashedPassword = PasswordUtils.hashPassword(password);

            boolean loginSuccess = UserDAO.loginUser(username, hashedPassword);
            if (loginSuccess) {
                HttpSession session = request.getSession();
                User user = UserDAO.getUserInfo(username);

                if (user != null && user.getRoleId() == 2) {
                    //user
                    UserDAO userDAO = new UserDAO();
                    handleUserLoginSuccess(response, session, user, "index.jsp");
                } else if (user != null && user.getRoleId() == 1) {
                    //admin
                    request.getSession().setAttribute("user", user);

                    handleUserLoginSuccess(response, session, user, "/ProjectLTW_war/pageAdminController");

                } else {
                    //  không có quyền hoặc thông tin không hợp lệ
                    response.sendRedirect("login.jsp");
                }
            } else {
                // Đăng nhập thất bại
                handleLoginFailure(response, request, "Tài khoản chưa được kích hoạt ");

            }
        }
    }


    private void handleUserLoginSuccess(HttpServletResponse response, HttpSession session, User user, String redirectPage)
            throws IOException {
        session.setAttribute("user", user);
        String name = UserDAO.getUserName(user.getUserName());
        session.setAttribute("name", name);
        response.sendRedirect(redirectPage);
    }

    private void handleLoginFailure(HttpServletResponse response, HttpServletRequest request, String errorMessage) throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("message2", errorMessage);
        response.sendRedirect("login.jsp");
    }

    private void loginFacebook(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String fullname = req.getParameter("name");
        String id = req.getParameter("id");
        String email = req.getParameter("email");
        User user = UserService.getInstance().checkProviderUserId(id);
        if (user == null) {
            user = new User();
            user.setRoleId(2);
            user.setUserName(id);
            user.setPassword(PasswordUtils.hashPassword(id));
            user.setFullName(fullname);
            user.setCreatedAt(LocalDateTime.now());
            user.setEmail(email);
            user.setProvider("facebook");
            user.setProviderUserId(id);
            UserService.getInstance().insertUser(user);
        }
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        String name = UserDAO.getUserName(user.getUserName());
        session.setAttribute("name", name);
        resp.sendRedirect("/ProjectLTW_war/trangchu");
    }

}
