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
@WebServlet(name = "LocNuocAmTuDeBan", value = "/locnuocamtudeban")
public class LocNuocAmTuDeBanController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getInstance().getLocNuocTheoDanhMuc("Âm tủ để bàn");
        req.setAttribute("data", products);
        req.getRequestDispatcher("loc_nuoc_amtu_deban_page.jsp").forward(req, resp);
    }
}
