package controller;

import model.Order;
import model.Product;
import service.PageAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "PageAdminStartEnd", value = "/pageAdminStartEnd")
public class PageAdminStartEnd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("start-date");
        String endDate = request.getParameter("end-date");
        int countOrder = PageAdminService.getInstance().countOrderStartEnd(startDate, endDate);
        int countProductOutStock = PageAdminService.getInstance().countProductOutStock();
        int totalMoney = PageAdminService.getInstance().totalMoneyStartEnd(startDate, endDate);
        int countOrderCancel = PageAdminService.getInstance().countOrderCancelOrderStartEnd(startDate, endDate);
        List<Order> listOderRecent = PageAdminService.getInstance().getOrderRecentStartEnd(startDate, endDate);
        List<Product> listProductBestSeller = PageAdminService.getInstance().getProductBestSellerStartEnd(startDate, endDate);
        request.getSession().setAttribute("countOrder", countOrder);
        request.getSession().setAttribute("countProductOutStock", countProductOutStock);
        request.getSession().setAttribute("totalMoney", totalMoney);
        request.getSession().setAttribute("countOrderCancel", countOrderCancel);
        request.setAttribute("listOderRecent", listOderRecent );
        request.setAttribute("listProductBestSeller", listProductBestSeller);

        request.getRequestDispatcher("pageAdmin_Index.jsp").forward(request, response);
    }
}
