package controller;

import dao.ProductDAO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeStatusProduct", value = "/change-status-product")
public class ChangeStatusProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object object = req.getParameter("product_id");
        int product_id = 0;
        if (object != null) {
            if (object instanceof Integer) {
                product_id = (Integer) object;
            } else if (object instanceof String) {
                product_id = Integer.valueOf((String) object);
            }
        }
        System.out.println(product_id);
        // Giả sử rằng phương thức editStatus trả về trạng thái mới của sản phẩm
        String newStatus = ProductDAO.editStatus(product_id);

        // Thiết lập kiểu nội dung phản hồi là JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Gửi phản hồi JSON chứa trạng thái mới
        resp.getWriter().write(new JSONObject().put("newStatus", newStatus).toString());
    }

}
