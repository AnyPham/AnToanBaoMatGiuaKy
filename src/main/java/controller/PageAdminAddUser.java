package controller;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "PageAdminAddUser", value = "/pageAdminAddUser")
public class PageAdminAddUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String fullName = req.getParameter("name2").trim();
        String email = req.getParameter("email2").trim();
        String userName = req.getParameter("username2").trim();
        String phone = req.getParameter("phone2").trim();
        String password = req.getParameter("password2").trim();
        String roleUser = req.getParameter("roleUser");
        if (fullName == null || fullName.equals("") || email == null || email.equals("") || userName == null || userName.equals("") ||
                phone == null || phone.equals("") || password == null || password.equals("")) {
            req.getSession().setAttribute("error2", "Bạn cần nhập các đủ thông tin ");
            req.getRequestDispatcher("pageAdmin_addUser.jsp").forward(req, resp);
        } else if (UserService.isValidEmail(email) == false) {
            req.getSession().setAttribute("error2", "Email không hợp lệ");
            req.getRequestDispatcher("pageAdmin_addUser.jsp").forward(req, resp);
        } else if (UserService.isEmailExists(email) == true && UserService.isUserExists(userName) == true) {
            req.getSession().setAttribute("error2", "Email và Tên đăng nhập đã được sử dụng");
            req.getRequestDispatcher("pageAdmin_addUser.jsp").forward(req, resp);
        } else if (UserService.isEmailExists(email) == true) {
            req.getSession().setAttribute("error2", "Email đã được sử dụng");
            req.getRequestDispatcher("pageAdmin_addUser.jsp").forward(req, resp);
        } else if (UserService.isUserExists(userName) == true) {
            req.getSession().setAttribute("error2", "Tên đăng nhập đã được sử dụng");
            req.getRequestDispatcher("pageAdmin_addUser.jsp").forward(req, resp);
        }else
            if (roleUser.equals("2")){
                UserService.getInstance().insertUserAdmin(2, userName, fullName, phone, email, password);
                req.getRequestDispatcher("pageAdminUserController").forward(req, resp);
            } else if (roleUser.equals("1")){
                UserService.getInstance().insertUserAdmin(1, userName, fullName, phone, email, password);
                req.getRequestDispatcher("pageAdminUserController").forward(req, resp);
            }
    }
}
