package controller;

import model.Address;
import service.AddressService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "GetListAddress", value = "/get-list-address")
public class GetListAddressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);  // Sử dụng cùng một phương thức cho cả GET và POST
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);  // Sử dụng cùng một phương thức cho cả GET và POST
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = null;
        try {
            Integer userId = Integer.valueOf(req.getParameter("userId"));
            List<Address> addresses = AddressService.getInstance().getAddresses(userId);

            // Build the JSON response manually
            StringBuilder json = new StringBuilder();
            json.append("[");
            for (int i = 0; i < addresses.size(); i++) {
                Address address = addresses.get(i);
                json.append("{")
                        .append("\"id\":\"").append(address.getId()).append("\",")
                        .append("\"userId\":").append(address.getUserId()).append(",")
                        .append("\"address\":\"").append(address.getAddress()).append("\",")
                        .append("\"receiver\":\"").append(address.getReceiver()).append("\",")
                        .append("\"phoneNumber\":\"").append(address.getPhoneNumber()).append("\"")
                        .append("}");
                if (i < addresses.size() - 1) {
                    json.append(",");
                }
            }
            json.append("]");

            // Set the response content type to JSON
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            // Write the JSON to the response
            out = resp.getWriter();
            out.write(json.toString());
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server Error: " + e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
