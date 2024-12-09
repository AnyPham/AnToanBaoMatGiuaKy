package controller;

import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/set-success-payment")
public class SetSuccessPaymentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object object = req.getParameter("orderId");
        int order_id = 0;
        if (object != null) {
            if (object instanceof Integer) {
                order_id = (Integer) object;
            } else if (object instanceof String) {
                order_id = Integer.valueOf((String) object);
            }
        }
        boolean isSuccess = OrderService.getInstance().paymentOrder("Thanh toán bằng ngân hàng thành công", order_id);
    }
}
