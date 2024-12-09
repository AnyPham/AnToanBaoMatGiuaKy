package controller;

import dao.ProductDAO;
import model.Product;

import service.ProductService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Trangchu", value = "/trangchu")
public class TrangChuController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = ProductService.getInstance().getAllLimit5();
        List<Product> locNuocRO = ProductDAO.getLocNuocTheoDanhMuc("Lọc nước RO");
        List<Product> coNongLanh = ProductDAO.getLocNuocTheoDanhMuc("Có nóng lạnh");
        List<Product> amTuDeBan = ProductDAO.getLocNuocTheoDanhMuc("Âm tủ để bàn");
        List<Product> nanoUfMf = ProductDAO.getLocNuocTheoDanhMuc("Lọc nước Nano, UF, MF");
        List<Product> khongdien = ProductDAO.getLocNuocTheoDanhMuc("Lọc nước không điện");

        req.setAttribute("data", products);
        req.setAttribute("locNuocRO", locNuocRO);
        req.setAttribute("coNongLanh", coNongLanh);
        req.setAttribute("amTuDeBan", amTuDeBan);
        req.setAttribute("nanoUfMf", nanoUfMf);
        req.setAttribute("khongdien", khongdien);
        req.getRequestDispatcher("trangchu.jsp").forward(req, resp);
        System.out.println(products);
    }


}
