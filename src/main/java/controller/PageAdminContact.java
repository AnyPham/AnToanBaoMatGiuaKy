package controller;

import model.Contact;
import model.User;
import service.ContactService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "PageAdminContact", value = "/pageAdminContact")
public class PageAdminContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Contact> contacts = ContactService.getInstance().getAllContacts();
        req.setAttribute("contacts", contacts);
        req.getRequestDispatcher("pageAdmin_Contact.jsp").forward(req, resp);
    }

}
