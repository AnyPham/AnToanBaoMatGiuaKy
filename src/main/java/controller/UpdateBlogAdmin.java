package controller;

import dao.BlogDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "UpdateBlogAdmin", value = "/UpdateBlogAdmin")
public class  UpdateBlogAdmin extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("id");
    int idParam = Integer.parseInt(id);
    String postId = String.valueOf(BlogDAO.getPostId(idParam));
    String newTitle = BlogDAO.getNewTitle(idParam);
    String newContent = BlogDAO.getNewContent(idParam);
    String newAuthor = BlogDAO.getNewAuthor(idParam);
    String newImg = BlogDAO.getNewImg(idParam);

    request.setAttribute("idParam", idParam);
    request.setAttribute("postId", postId);
    request.setAttribute("newTitle", newTitle);
    request.setAttribute("newContent", newContent);
    request.setAttribute("newAuthor", newAuthor);
    request.setAttribute("newImg", newImg);

    request.getRequestDispatcher("pageAdmin_updateBlog1.jsp").forward(request, response);


  }
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String postId = request.getParameter("id");
    String newTitle = request.getParameter("title");
    String newContent = request.getParameter("content");
    String newAuthor = request.getParameter("author");
    String newImg = request.getParameter("img");

    BlogDAO blogDAO = new BlogDAO();
    boolean updateSuccess = blogDAO.updatePost(postId, newTitle, newContent, newAuthor, newImg);

    if (updateSuccess) {
      response.sendRedirect("pageAdmin_Blog.jsp");
    } else {
      response.getWriter().println("Cập nhật bài đăng thất bại!");
    }
  }
}
