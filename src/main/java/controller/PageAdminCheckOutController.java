package controller;

import model.Order;
import org.apache.xpath.operations.Or;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PageAdminCheckOutController", value = "/page-admin-checkout")
public class PageAdminCheckOutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> listOrderWaitConfirm = OrderService.getInstance().getListOrderWaitConfirm();
        List<Order> listOrderConfirm = OrderService.getInstance().getListOrderConfirm();
        List<Order> listOrderTransport = OrderService.getInstance().getListOrderTransport();
        List<Order> listOrderTransported = OrderService.getInstance().getListOrderTransported();
        List<Order> listOrderCancel = OrderService.getInstance().getListOrderCancel();
        req.getSession().setAttribute("listOrderWaitConfirm", listOrderWaitConfirm);
        req.getSession().setAttribute("listOrderConfirm", listOrderConfirm);
        req.getSession().setAttribute("listOrderTransport", listOrderTransport);
        req.getSession().setAttribute("listOrderTransported", listOrderTransported);
        req.getSession().setAttribute("listOrderCancel", listOrderCancel);
        req.getRequestDispatcher("pageAdmin_Checkout.jsp").forward(req, resp);
    }
}
