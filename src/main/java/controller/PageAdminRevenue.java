package controller;

import service.PageAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "PageAdminRevenue", value = "/pageAdminRevenuer")
public class PageAdminRevenue extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("startDateConverted")!=null && request.getSession().getAttribute("endDateConverted") != null) {
            request.getSession().removeAttribute("startDateConverted");
            request.getSession().removeAttribute("endDateConverted");
        }
        int totalMoney = PageAdminService.getInstance().totalMoney();
        request.getSession().setAttribute("totalMoney", totalMoney);
        request.getRequestDispatcher("pageAdmin_Revenue.jsp").forward(request, response);
    }
}
