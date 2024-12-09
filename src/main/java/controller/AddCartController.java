package controller;

import cart.Cart;
import model.Product;
import model.Voucher;
import service.ProductService;
import service.VoucherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddCartController", value = "/add-card")
public class AddCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) cart = new Cart();
        int id = Integer.parseInt(req.getParameter("id"));
        int page = Integer.parseInt(req.getParameter("page"));
        cart.add(id);
        Product product = ProductService.getInstance().getById(id);
        ArrayList<Voucher> vouchers = VoucherService.getInstance().getVoucherByCategory(product.getCategory_id());
        ArrayList<Voucher> vouchers1 = VoucherService.getInstance().getVoucherByProduct(product.getId());
        ArrayList<Voucher> vouchers2 = VoucherService.getInstance().getVoucher();
        for (Voucher v : vouchers1) {
            vouchers.add(v);

        }
        for (Voucher v : vouchers2) {
            vouchers.add(v);

        }
        session.setAttribute("vouchers", vouchers);
        session.setAttribute("cart", cart);
        switch (page) {
            case 1:
                req.getRequestDispatcher("trangchu").forward(req, resp);
                break;
            case 2:
                req.getRequestDispatcher("locnuocro").forward(req, resp);
//                resp.sendRedirect("locnuocro");
                break;
            case 3:
                req.getRequestDispatcher("locnuocnonglanh").forward(req, resp);
//                resp.sendRedirect("locnuocnonglanh");
                break;
            case 4:
                req.getRequestDispatcher("locnuocamtudeban").forward(req, resp);
//                resp.sendRedirect("locnuocamtudeban");
                break;
            case 5:
                req.getRequestDispatcher("locnuocnanoufmf").forward(req, resp);
//                resp.sendRedirect("locnuocnanoufmf");
                break;
            case 6:
                req.getRequestDispatcher("locnuockhongdien").forward(req, resp);
//                resp.sendRedirect("locnuockhongdien");
                break;
            case 7:
                req.getRequestDispatcher("cart").forward(req, resp);
//                resp.sendRedirect("cart");
                break;
        }

    }


}
