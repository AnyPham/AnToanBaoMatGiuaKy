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

@WebServlet(name = "LocNuocNanoUFMF", value = "/locnuocnanoufmf")
public class LocNuocNanoUFMFController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getInstance().getLocNuocTheoDanhMuc("Lọc nước Nano, UF, MF");
        req.setAttribute("data", products);
        req.getRequestDispatcher("loc_nuoc_nano_uf_mf_page.jsp").forward(req, resp);
    }
}
