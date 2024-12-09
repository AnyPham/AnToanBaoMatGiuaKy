package controller;


import model.User;
import service.ImportProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "PlusImportProductController", value = "/plusImportProductController")
public class PlusImportProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String importPriceStr = req.getParameter("importPrice");
        String importQuantityStr = req.getParameter("importQuantity");
        String idStr = req.getParameter("id");
        if (idStr == null || idStr.isEmpty() || importPriceStr == null || importPriceStr.isEmpty() || importQuantityStr == null || importQuantityStr.isEmpty()) {
            req.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            forwardToProductPage(req, resp);
            return;
        }
        try {
            int id = Integer.parseInt(idStr);
            int importPrice = Integer.parseInt(importPriceStr);
            int importQuantity = Integer.parseInt(importQuantityStr);
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            ImportProductService.getInstance().increaseProductAvailable(importQuantity, id);
            System.out.println(importQuantity);
            System.out.println(id);
            ImportProductService.getInstance().insertImportProduct(id, importQuantity, importPrice, user.getId());
            System.out.println("Nhập hàng thành công.");
        } catch (NumberFormatException e) {
            System.out.println("Giá trị nhập liệu không hợp lệ.");
        }
        forwardToProductPage(req, resp);
    }

    private void forwardToProductPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("importProductController").forward(req, resp);
    }
}


