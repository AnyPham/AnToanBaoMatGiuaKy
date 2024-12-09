package controller;

import dao.LogDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteLog", value = "/delete-log")
public class DeleteLog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        LogDao logDao = new LogDao();
        String[] logIdParam = req.getParameterValues("selectedLog");
        for (String id : logIdParam) {
            logDao.deleteById(Integer.parseInt(id));
        }
        resp.sendRedirect("pageAdmin_Log.jsp");
    }
}
