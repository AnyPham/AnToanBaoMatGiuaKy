package controller;

import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TransportedController", value = "/transportedOrder")
public class TransportedController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object ob = req.getParameter("order_id");
        int order_id = 0;
        if (ob != null) {
            if (ob instanceof Integer) {
                order_id = (Integer) ob;
            } else if (ob instanceof String) {
                order_id = Integer.valueOf((String) ob);
            }
        }
        boolean isChangeStatus = OrderService.getInstance().changeStatusToTransported(order_id);
        if (isChangeStatus) {
            resp.sendRedirect("page-admin-checkout");
        }

    }
}
