package controller;

import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FindProductController", value = "/findProductController")
public class FindProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String title = req.getParameter("search");
        List<Product> products = ProductService.getInstance().getProductByName(title);
        System.out.println(title);
        if (products == null) {
            req.getRequestDispatcher("findproduct.jsp").forward(req, resp);
            req.setAttribute("error", "Rất tiếc không tìm thấy sản phẩm của bạn yêu cầu");
        } else {
            req.setAttribute("findproduct", products);
            System.out.println(products);
            req.getRequestDispatcher("findproduct.jsp").forward(req, resp);
        }
    }
}
