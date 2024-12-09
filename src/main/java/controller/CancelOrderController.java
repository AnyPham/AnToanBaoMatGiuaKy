package controller;

import dao.ProductDAO;
import model.Order;
import model.OrderDetail;
import service.OrderDetailService;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CancelOrderController", value = "/cancel-order")
public class CancelOrderController extends HttpServlet {
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
        boolean isCancel = OrderService.getInstance().cancelOrder("Đã hủy", order_id);
        if (isCancel) {
            List<OrderDetail> orderDetails = OrderDetailService.getInstance().getOrderDetailByIdOrder(order_id);
            for (OrderDetail detail : orderDetails) {
                int productId = detail.getProduct_id();
                int quantity = detail.getQuantity();
                ProductDAO.increaseProductAvailable(quantity, productId);
            }
            HttpSession session = req.getSession();
            session.removeAttribute("cart");
            resp.sendRedirect("ordered-page");
            return;
        } else {
            resp.sendRedirect("ordered-page");
            return;
        }
    }
}
