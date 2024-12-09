package controller;

import model.Order;
import service.PageAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "ThongKeDonHangHuy", value = "/thongKeDonHangHuy")
public class ThongKeDonHangHuy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("startDateConverted")!=null && request.getSession().getAttribute("endDateConverted") != null) {
            request.getSession().removeAttribute("startDateConverted");
            request.getSession().removeAttribute("endDateConverted");
        }
        List<Order> listOrdersCancel = PageAdminService.getInstance().getOrderRecentCanceled();
        request.setAttribute("listOrdersCancel", listOrdersCancel);
        request.getRequestDispatcher("thongkedonhanghuy.jsp").forward(request, response);
    }
}
