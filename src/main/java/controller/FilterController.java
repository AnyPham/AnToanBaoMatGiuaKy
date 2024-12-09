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

@WebServlet(name = "FilterController", value = "/filter")
public class FilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp
        );
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object objectBrand = req.getParameter("brand_id");
        int brand = 0;
        if (objectBrand != null) {
            if (objectBrand instanceof Double) {
                brand = (Integer) objectBrand;
            } else if (objectBrand instanceof String) {
                brand = Integer.valueOf((String) objectBrand);
            }
        }
        Object objectType = req.getParameter("type_id");
        int type = 0;
        if (objectType != null) {
            if (objectType instanceof Double) {
                type = (Integer) objectType;
            } else if (objectType instanceof String) {
                type = Integer.valueOf((String) objectType);
            }
        }
        Object objectPage = req.getParameter("brand_id");
        int page_id = 0;
        if (objectPage != null) {
            if (objectPage instanceof Double) {
                page_id = (Integer) objectPage;
            } else if (objectPage instanceof String) {
                page_id = Integer.valueOf((String) objectPage);
            }
        }
        List<Product> products = ProductService.filterByTypeAndBrand(brand, type);
        req.setAttribute("data",products);
        switch (page_id){
            case 1:
                req.getRequestDispatcher("loc_nuoc_RO_page.jsp").forward(req,resp);
                break;
            case 2:
                req.getRequestDispatcher("loc_nuoc_nong_lanh_page.jsp").forward(req,resp);
                break;
            case 3:
                req.getRequestDispatcher("loc_nuoc_nano_uf_mf_page.jsp").forward(req,resp);
                break;
            case 4:
                req.getRequestDispatcher("loc_nuoc_khong_dien_page.jsp").forward(req,resp);
                break;
            case 5:
                req.getRequestDispatcher("loc_nuoc_amtu_deban_page.jsp").forward(req,resp);
                break;
            case 6:
                req.getRequestDispatcher("findproduct.jsp").forward(req,resp);
                break;
        }

    }
}