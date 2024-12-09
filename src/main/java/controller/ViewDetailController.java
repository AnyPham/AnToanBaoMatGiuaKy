package controller;

import model.OrderDetail;
import service.OrderDetailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewDetailController", value = "/view-detail")
public class ViewDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object object = req.getParameter("order_id");
        int order_id = 0;
        if (object != null) {
            if (object instanceof Double) {
                order_id = (Integer) object;
            } else if (object instanceof String) {
                order_id = Integer.valueOf((String) object);
            }
        }

//        req.setAttribute("orderDetails",orderDetails);
        req.getRequestDispatcher("orderdetailpage.jsp").forward(req, resp);
    }
}
