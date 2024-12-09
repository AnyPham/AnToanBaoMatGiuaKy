package controller;

import dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeInfoOrder", value = "/change-info-order")
public class ChangeInfoOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String idStr = req.getParameter("order_id");
        int id = 0;
        if (idStr != null && !idStr.isEmpty()) {
            id = Integer.valueOf(idStr);
        }
        boolean isChangeInfoOrder = OrderDAO.changeInfoOrder(id, name, address, phone);
        if (isChangeInfoOrder) {
            req.getRequestDispatcher("ordered-page").forward(req, resp);
        } else {
            req.getSession().setAttribute("error", "Đơn hàng đang giao hoặc đã hủy");
            req.getRequestDispatcher("view-detail").forward(req,resp);
        }
    }
}
