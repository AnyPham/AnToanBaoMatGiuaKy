package controller;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "AdminEditUser", value = "/adminEditUser")
public class AdminEditUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String tendangnhap = req.getParameter("tendangnhap").trim();
        String hovaten = req.getParameter("hovaten").trim();
        String sdt = req.getParameter("sdt").trim();
        String gmail = req.getParameter("gmail").trim();
        String pass = req.getParameter("pass").trim();
        Object temp = req.getParameter("id");
        int id = 0;
        if(temp != null){
            if(temp instanceof Integer){
                id = (int) temp;
            }else if(temp instanceof String){
                id = Integer.valueOf((String) temp);
            }
        }
        UserService.getInstance().updateUserAdminById(id, tendangnhap, hovaten, sdt, gmail, pass);
        req.getRequestDispatcher("/pageAdminUserController").forward(req, resp);
    }
}
