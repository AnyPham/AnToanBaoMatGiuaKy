package controller;

import dao.ContactDAO;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet(name = "AddContactController", value = "/add-contact")
public class AddContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name").trim();
        String email = req.getParameter("email").trim();
        Pattern patternEmail = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");
        String phone_number = req.getParameter("phone_number").trim();
        String content = req.getParameter("content").trim();
        if (name == null || name.equals("") || email == null || email.equals("") || phone_number == null || phone_number.equals("") ||
                content == null || content.equals("")) {
            req.setAttribute("error", "Bạn cần nhập các đủ thông tin ");
            req.getRequestDispatcher("contact.jsp").forward(req, resp);
        }if (UserService.isValidEmail(email) == false){
            req.setAttribute("error", "Email không hợp lệ");
            req.getRequestDispatcher("contact.jsp").forward(req, resp);
        }
        else {
            ContactDAO.insertContact(name, email, phone_number, content);
            resp.sendRedirect("contact.jsp");
        }
    }
}
