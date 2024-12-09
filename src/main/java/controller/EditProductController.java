package controller;

import dao.ProductDAO;
import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet(name = "EditProductController", value = "/edit-product")
public class EditProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Object objectId = req.getParameter("product_id");
        int idProduct = 0;
        if (objectId != null) {
            if (objectId instanceof Integer) {
                idProduct = (Integer) objectId;
            } else if (objectId instanceof String) {
                idProduct = Integer.valueOf((String) objectId);
            }
        }
        String nameProduct = req.getParameter("nameProduct");
        Object objectAvailable = req.getParameter("availableProduct");
        int availableProduct = 0;
        if (objectAvailable != null) {
            if (objectAvailable instanceof Integer) {
                availableProduct = (Integer) objectAvailable;
            } else if (objectAvailable instanceof String) {
                availableProduct = Integer.valueOf((String) objectAvailable);
            }
        }
        Object objectPrice = req.getParameter("priceProduct");
        int priceProduct = 0;
        if (objectPrice != null) {
            if (objectPrice instanceof Integer) {
                priceProduct = (Integer) objectPrice;
            } else if (objectPrice instanceof String) {
                priceProduct = Integer.valueOf((String) objectPrice);
            }
        }
        Object objectDiscountPrice = req.getParameter("discountPriceProduct");
        int discountPriceProduct = 0;
        if (objectDiscountPrice != null) {
            if (objectDiscountPrice instanceof Integer) {
                discountPriceProduct = (Integer) objectDiscountPrice;
            } else if (objectDiscountPrice instanceof String) {
                discountPriceProduct = Integer.valueOf((String) objectDiscountPrice);
            }
        }
        Product product = ProductDAO.getById(idProduct);
        String imgProduct = "";
        Part part = req.getPart("imgProduct");
        String realPath = req.getServletContext().getRealPath("/img");
        String fileName;

// Kiểm tra xem người dùng có tải lên tệp mới không
        if (part != null && part.getSize() > 0) {
            fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            part.write(realPath + "/" + fileName);
            imgProduct = "img/" + fileName;
        } else {
            // Nếu không có tệp mới, sử dụng tên tệp mặc định
            imgProduct = product.getImg(); // Thay đổi "default.jpg" thành tên tệp mặc định của bạn
        }


        String desProduct = req.getParameter("mota");
        Object objectCategory = req.getParameter("category");
        int selectedCategory = 0;
        if (objectCategory != null) {
            if (objectCategory instanceof Integer) {
                selectedCategory = (Integer) objectCategory;
            } else if (objectCategory instanceof String) {
                selectedCategory = Integer.valueOf((String) objectCategory);
            }
        }
        Object objectBrand = req.getParameter("brand");
        int selectedBrand = 0;
        if (objectCategory != null) {
            if (objectBrand instanceof Integer) {
                selectedBrand = (Integer) objectBrand;
            } else if (objectBrand instanceof String) {
                selectedBrand = Integer.valueOf((String) objectBrand);
            }
        }
        Object objectType = req.getParameter("typeMachine");
        int selectedType = 0;
        if (objectCategory != null) {
            if (objectType instanceof Integer) {
                selectedType = (Integer) objectType;
            } else if (objectType instanceof String) {
                selectedType = Integer.valueOf((String) objectType);
            }
        }

        boolean isChangeInfoProduct = ProductService.getInstance().changeInfoProduct(idProduct, selectedCategory, nameProduct, availableProduct, priceProduct, discountPriceProduct, imgProduct, desProduct, selectedBrand, selectedType);
        if (isChangeInfoProduct) {
            req.getRequestDispatcher("page-admin-edit-product").forward(req, resp);
        }
    }
}
