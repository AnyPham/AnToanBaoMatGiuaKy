package controller;

import model.Product;
import service.ImportProductService;
import service.PageAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "PageAdminBeImportProduct", value = "/pageAdminBeImportProduct")
public class PageAdminBeImportProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productBeImport  = ImportProductService.getProductsWithHighSalesRatio();
        request.setAttribute("productBeImport", productBeImport);
        request.getRequestDispatcher("pageAdminBeImportProduct.jsp").forward(request, response);
    }
}
