package controller;

import model.ImportProduct;
import service.ImportProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "ImportProductHistoryController", value = "/importProductHistoryController")
public class ImportProductHistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ImportProduct> importProducts = ImportProductService.getInstance().getAll();
        request.setAttribute("importProducts", importProducts);
        request.getRequestDispatcher("pageAdmin_ImportProductHistory.jsp").forward(request, response);
    }

}
