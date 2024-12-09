package controller;

import model.Product;
import service.PageAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "ThongKeSanPhamNotSold", value = "/thongKeSanPhamNotSold")
public class ThongKeSanPhamNotSold extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("startDateConverted")!=null && request.getSession().getAttribute("endDateConverted") != null) {
            request.getSession().removeAttribute("startDateConverted");
            request.getSession().removeAttribute("endDateConverted");
        }
        List<Product> productsNotSolds = PageAdminService.getInstance().getProductsNotSold();
        request.setAttribute("productsNotSolds", productsNotSolds);
        request.getRequestDispatcher("thongkesanphamnotsold.jsp").forward(request, response);
    }
}
