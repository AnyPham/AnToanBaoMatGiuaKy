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

@WebServlet(name = "LocNuocKhongDien", value = "/locnuockhongdien")
public class LocNuocKhongDienController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getInstance().getLocNuocTheoDanhMuc("Lọc nước không điện");
        req.setAttribute("data", products);
        req.getRequestDispatcher("loc_nuoc_khong_dien_page.jsp").forward(req, resp);
    }
}
