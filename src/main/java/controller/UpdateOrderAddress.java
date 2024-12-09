package controller;

import db.JDBIConnector;
import org.jdbi.v3.core.Handle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "UpdateOrderAddress", value = "/update-order-address")
public class UpdateOrderAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        // Lấy các tham số từ request
        String orderIdStr = req.getParameter("orderId");
        String newAddress = req.getParameter("newAddress");
        String phoneNumber = req.getParameter("phoneNumber");
        String receiver = req.getParameter("receiver");

        // Kiểm tra null và trả về lỗi nếu thiếu tham số
        if (orderIdStr == null || newAddress == null || phoneNumber == null || receiver == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Missing required parameters");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Invalid orderId");
            return;
        }

        // Cập nhật địa chỉ đơn hàng
        boolean success = updateOrderAddress(orderId, newAddress, phoneNumber, receiver);

        if (success) {
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private boolean updateOrderAddress(int orderId, String newAddress, String phoneNumber, String receiver) {
        String sql = "UPDATE orders SET address = :newAddress, phone = :phoneNumber, name = :receiver " +
                "WHERE id = :orderId ";

        try (Handle handle = JDBIConnector.me().open()) {
            int rowsAffected = handle.createUpdate(sql)
                    .bind("newAddress", newAddress)
                    .bind("phoneNumber", phoneNumber)
                    .bind("receiver", receiver)
                    .bind("orderId", orderId)
                    .execute();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
