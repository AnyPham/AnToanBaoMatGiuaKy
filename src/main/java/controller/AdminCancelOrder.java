package controller;

import dao.ProductDAO;
import dao.UserDAO;
import model.Order;
import model.OrderDetail;
import model.User;
import service.OrderDetailService;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "AdminCancelOrder", value = "/adminCancelOrder")
public class AdminCancelOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Object ob = req.getParameter("order_id");
        int order_id = 0;
        if (ob != null) {
            if (ob instanceof Integer) {
                order_id = (Integer) ob;
            } else if (ob instanceof String) {
                order_id = Integer.valueOf((String) ob);
            }
        }
        boolean isChangeStatus = OrderService.getInstance().changeStatusToCancel(order_id);
        if (isChangeStatus) {
            List<OrderDetail> orderDetails = OrderDetailService.getInstance().getOrderDetailByIdOrder(order_id);
            for (OrderDetail detail : orderDetails) {
                int productId = detail.getProduct_id();
                int quantity = detail.getQuantity();
                ProductDAO.increaseProductAvailable(quantity, productId);
            }
        }
        List<Order> listOrderConfirm = OrderService.getInstance().getListOrderCancel();
        PrintWriter out = resp.getWriter();
        Locale locale = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getInstance(locale);
        if (isChangeStatus) {
            for (Order o : listOrderConfirm) {
                User user = UserDAO.getUserById(o.getUser_id());
                out.println(
                        "                            <tr>\n" +
                                "                                <th scope=\"row\">" + o.getId() + "\n" +
                                "                                </th>\n" +
                                "                                <td>" + user.getFullName() + "\n" +
                                "                                </td>\n" +
                                "                                <td>" + o.getOrder_date() + "\n" +
                                "                                </td>\n" +
                                "                                <td>" + o.getAddress() + "\n" +
                                "                                </td>\n" + "\n" +
                                "                                <td>" + numberFormat.format(+o.getTotal_money()) + "<sup>đ</sup></td>\n" + "                                <td>\n" +
                                "                                    <button style=\"border: none; background: none;\" title=\"Xác nhận đơn hàng\"\n" +
                                "                                            onclick=\"confirmOrder(" + o.getId() + ")\" class=\"icon-link\">\n" +
                                "                                        <i class=\"icon-wrapper\">\n" +
                                "                                            <i class=\"fas fa-check\"></i>\n" +
                                "                                        </i>\n" +
                                "                                    </button>\n" +
                                "                                </td>\n" +
                                "                            </tr>\n" +
                                "\n");
            }

        }
    }
}