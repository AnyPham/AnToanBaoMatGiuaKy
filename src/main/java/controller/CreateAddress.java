package controller;

import com.google.gson.Gson;
import db.JDBIConnector;
import model.Address;
import org.jdbi.v3.core.Handle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateAddress", value = "/create-address")
public class CreateAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String userId = req.getParameter("userId");
        String newAddress = req.getParameter("newAddress");
        String phoneNumber = req.getParameter("phoneNumber");
        String receiver = req.getParameter("receiver");

        if (userId == null || newAddress == null || phoneNumber == null || receiver == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"message\": \"Missing required parameters\"}");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(userId);
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"message\": \"Invalid orderId\"}");
            return;
        }

        Address createdAddress = createAddress(orderId, newAddress, phoneNumber, receiver);

        if (createdAddress != null) {
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write(new Gson().toJson(createdAddress));
        } else {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private Address createAddress(int orderId, String newAddress, String phoneNumber, String receiver) {
        String sql = "INSERT INTO address (user_id, address, phone_number, receiver) " +
                "VALUES (:orderId, :newAddress, :phoneNumber, :receiver)";

        try (Handle handle = JDBIConnector.me().open()) {
            int rowsAffected = handle.createUpdate(sql)
                    .bind("orderId", orderId)
                    .bind("newAddress", newAddress)
                    .bind("phoneNumber", phoneNumber)
                    .bind("receiver", receiver)
                    .execute();

            if (rowsAffected > 0) {
                // Trả về đối tượng Address vừa tạo
                Address address = new Address(phoneNumber, receiver, newAddress, orderId);
                return address;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
