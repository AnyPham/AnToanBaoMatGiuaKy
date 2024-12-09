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
@WebServlet(name = "ThongKeDonHang", value = "/thongKeDonHang")
public class ThongKeDonHang extends HttpServlet {
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
        List<Order> listOrders = PageAdminService.getInstance().getOrderRecent();
        request.setAttribute("listOrders", listOrders);
        request.getRequestDispatcher("thongkedonhang.jsp").forward(request, response);
    }
}
