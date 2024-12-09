package controller;

import dao.UserDAO;
import model.User;
import model.Voucher;
import service.UserService;
import service.VoucherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UseVoucherController", value = "/use-voucher")
public class UseVoucherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int voucher_id = Integer.parseInt(req.getParameter("voucher_id"));
            if (voucher_id != 0) {
                Voucher voucher = VoucherService.getInstance().getVoucherById(voucher_id);
                if (voucher != null) {
                    double percent_decrease = voucher.getPercent_decrease();
                    req.getSession().setAttribute("percent_decrease", percent_decrease);
                    req.getSession().setAttribute("voucher", voucher);
                }
                req.getRequestDispatcher("cart").forward(req, resp);
            } else {

            }
        } catch (NumberFormatException e) {
            // Xử lý ngoại lệ ở đây
        }


    }
}
