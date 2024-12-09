package controller;

import model.Log;
import model.Product;
import service.LogService;
import service.PageAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PageAdminLogController", value = "/pageAdminLogController")
public class PageAdminLogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Log> logs = LogService.getInstance().getAllLog();
        request.setAttribute("logs", logs);
        request.getRequestDispatcher("page_AdminLog.jsp").forward(request, response);
    }
}
