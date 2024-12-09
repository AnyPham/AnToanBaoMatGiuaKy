package controller;

import model.Comment;
import model.Gallery;
import model.Product;
import service.CommentService;
import service.GalleryService;
import service.ProductService;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/trangsanpham")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object temp = req.getParameter("id");
        int id = 0;
        if(temp != null){
            if(temp instanceof Integer){
                id = (int) temp;
            }else if(temp instanceof String){
                id = Integer.valueOf((String) temp);
            }
        }
        Product product = ProductService.getInstance().getById(id);
        List<Gallery> galleries = GalleryService.getInstance().getGalleryByProductId(id);
        List<Comment> comments = CommentService.getInstance().getCommentById(id);
        req.setAttribute("product", product);
        req.setAttribute("galleries", galleries);
        req.setAttribute("comments", comments);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }


}
