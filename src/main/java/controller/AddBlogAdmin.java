package controller;


import dao.BlogDAO;

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
@MultipartConfig
@WebServlet(name = "AddBlogAdmin", value = "/AddBlogAdmin")
public class AddBlogAdmin extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    resp.setContentType("text/html; charset=UTF-8");
    resp.setCharacterEncoding("UTF-8");

    String title = req.getParameter("title");
    String content = req.getParameter("content");
    String author = req.getParameter("author");
    Part part = req.getPart("imgProduct");
    String realPath = req.getServletContext().getRealPath("/img");
    String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
    if(!Files.exists(Path.of(realPath))){
      Files.createDirectory(Path.of(realPath));

    }
    part.write(realPath+"/"+fileName);
    String imgProduct = "img/"+fileName;

    if (title == null || title.isEmpty()) {
      req.getSession().setAttribute("error2", "Bạn cần nhập tiêu đề.");
      req.getRequestDispatcher("pageAdmin_addBlog1.jsp").forward(req, resp);
      return;
    }

    if (content == null || content.isEmpty()) {
      req.getSession().setAttribute("error2", "Bạn cần nhập nội dung.");
      req.getRequestDispatcher("pageAdmin_addBlog1.jsp").forward(req, resp);
      return;
    }

    if (author == null || author.isEmpty()) {
      req.getSession().setAttribute("error2", "Bạn cần nhập tác giả.");
      req.getRequestDispatcher("pageAdmin_addBlog1.jsp").forward(req, resp);
      return;
    }
    if (part == null) {
      req.getSession().setAttribute("error2", "Bạn cần nhập đường dẫn ảnh.");
      req.getRequestDispatcher("pageAdmin_addBlog1.jsp").forward(req, resp);
    } else {
      BlogDAO.addPost(title,content,author,imgProduct);
      resp.sendRedirect("pageAdmin_Blog.jsp");
    }

  }

}





