package controller;

import cart.Cart;
import dao.ProductDAO;
import model.Order;
import model.Product;
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
import java.util.Set;

@WebServlet(name = "OrderController", value = "/order-controller")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object object = req.getParameter("voucher_id");
        int voucher_id = 0;
        if (object != null) {
            if (object instanceof Integer) {
                voucher_id = (Integer) object;
            } else if (object instanceof String) {
                voucher_id = Integer.valueOf((String) object);
            }
        }
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        Set<Integer> set = cart.getData().keySet();
        Object tempObj = req.getParameter("total_decrease");
        int total_decrease = 0;
        if (tempObj != null) {
            if (tempObj instanceof Integer) {
                total_decrease = (Integer) tempObj;
            } else if (tempObj instanceof String) {
                total_decrease = Integer.valueOf((String) tempObj);
            }
        }

        if (cart.getTotal() > 0 && user != null) {
            boolean outOfStock = false;
            for (Integer key : set) {
                int product_id = cart.getData().get(key).getProduct().getId();
                int quantity = cart.getData().get(key).getQuantity();
                Product product = ProductDAO.getById(product_id);
                if (product.getAvailable() < quantity) {
                    outOfStock = true;
                    req.setAttribute("errorMessage", "Sản phẩm " + product.getTitle() + " không đủ hàng. Vui lòng kiểm tra lại giỏ hàng.");
                    req.getRequestDispatcher("giohang.jsp").forward(req, resp);
                    return;
                }
            }

            if (!outOfStock) {
                boolean checkCreatedOrder = OrderService.getInstance().insertOrder(user.getId(), user.getAddress(), user.getPhoneNumber(), "Chưa chọn phương thức thanh toán", total_decrease, voucher_id, user.getFullName());

                if (checkCreatedOrder) {
                    Order order = OrderService.getInstance().getOrder(user.getId(), "Chưa chọn phương thức thanh toán", total_decrease);
                    System.out.println(order);
                    if (order != null) {
                        session.setAttribute("order", order);
                        for (Integer key : set) {
                            int order_id = order.getId();
                            int product_id = cart.getData().get(key).getProduct().getId();
                            int price = cart.getData().get(key).getProduct().getDiscount_price();
                            int quantity = cart.getData().get(key).getQuantity();
                            int total_money = price * quantity;

                            OrderDetailService.getInstance().insertOrder(order_id, product_id, price, quantity, total_money);
                            ProductDAO.decreaseProductAvailable(quantity, product_id);
                        }
                    } else {
                        // Xử lý trường hợp không tạo được đơn hàng
                        req.setAttribute("errorMessage", "Không thể tạo đơn hàng. Vui lòng thử lại.");
                        req.getRequestDispatcher("error.jsp").forward(req, resp);
                        return;
                    }

                    req.getRequestDispatcher("paymentpage.jsp").forward(req, resp);
                }
            }
        } else {
            // Xử lý trường hợp giỏ hàng rỗng hoặc người dùng chưa đăng nhập
            req.setAttribute("errorMessage", "Giỏ hàng rỗng hoặc người dùng chưa đăng nhập.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}
