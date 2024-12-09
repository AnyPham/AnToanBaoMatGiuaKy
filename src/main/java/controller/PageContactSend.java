package controller;

import mail.MailService;
import service.ContactService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "PageContactSend", value = "/pageContactSend")
public class PageContactSend extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Object temp = req.getParameter("id");
        int id = 0;
        if(temp != null){
            if(temp instanceof Integer){
                id = (int) temp;
            }else if(temp instanceof String){
                id = Integer.valueOf((String) temp);
            }
        }
        String contact_input = req.getParameter("contact_input");
        String email = ContactService.getInstance().getEmailById(id);
        MailService.send(email, "Healthy Water", "Phản Hồi: " + contact_input);
        req.getRequestDispatcher("pageAdminContact").forward(req, resp);
    }
}
