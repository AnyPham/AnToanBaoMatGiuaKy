package controller;

import dao.LogDao;
import model.Log;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminDetailLogController", value = "/admin-detail-log")
public class AdminDetailLogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        String logIdParam = req.getParameter("logId");
        LogDao logDao = new LogDao();
        Log log = logDao.selectById(Integer.parseInt(logIdParam));
        HttpSession session = req.getSession();
        session.setAttribute("log", log);
        resp.sendRedirect("chiTietLog.jsp");
    }
}
