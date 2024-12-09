package controller;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "EditRoleUser", value = "/editRoleUser")
public class EditRoleUser extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object temp = req.getParameter("id");
        int id = 0;
        if(temp != null){
            if(temp instanceof Integer){
                id = (int) temp;
            }else if(temp instanceof String){
                id = Integer.valueOf((String) temp);
            }
        }
        UserService.getInstance().editRole(id);
        req.getRequestDispatcher("/pageAdminUserController").forward(req, resp);
    }
}
