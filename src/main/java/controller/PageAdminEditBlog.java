package controller;

import dao.BlogDAO;
import dao.ProductDAO;
import model.Post;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet(name = "PageAdminEditBlog", value = "/pageAdminEditBlog")
public class PageAdminEditBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Object object = req.getParameter("id");
        int id = 0;
        if (object != null) {
            if (object instanceof Integer) {
                id = (Integer) object;
            } else if (object instanceof String) {
                id = Integer.valueOf((String) object);
            }
        }
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String content = req.getParameter("content");

        Post post = BlogDAO.getPostById(id);
        String imgProduct = "";
        Part part = req.getPart("img");
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
            imgProduct = post.getImg(); // Thay đổi "default.jpg" thành tên tệp mặc định của bạn
        }

        boolean isChangeInfoBlog = BlogDAO.changeInfoBlog(id,title,author,content,imgProduct);
        if(isChangeInfoBlog){
            req.getSession().removeAttribute("post");
            resp.sendRedirect("pageAdmin_blog.jsp");
        }
    }
}
