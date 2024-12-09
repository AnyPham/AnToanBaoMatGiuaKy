package controller;

import dao.BlogDAO;
import model.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogServlet", value = "/blog")
public class BlogController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null || action.equals("list")) {
      // Hiển thị danh sách bài đăng
      List<Post> posts = BlogDAO.getAllPosts();
      request.setAttribute("posts", posts);
      request.getRequestDispatcher("blog.jsp").forward(request, response);
    } else if (action.equals("detail")) {
      // Hiển thị chi tiết một bài đăng
      int postId = Integer.parseInt(request.getParameter("postId"));
      Post post = BlogDAO.getPostById(postId);
      request.setAttribute("post", post);
      request.getRequestDispatcher("blog_detail.jsp").forward(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action != null && action.equals("addPost")) {
      // Thêm một bài đăng mới
      int id = Integer.parseInt(request.getParameter("id"));
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String author = request.getParameter("author");
      String img = request.getParameter("img");

      Post post = new Post(id,title, content, author, img);
      BlogDAO.addPost(post);
      response.sendRedirect(request.getContextPath() + "/blog");
    } else if (action != null && action.equals("updatePost")) {
      // Cập nhật một bài đăng
      int id = Integer.parseInt(request.getParameter("id"));
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String author = request.getParameter("author");
      String img = request.getParameter("img");

      Post post = new Post(id, title, content, author, img);
      BlogDAO.updatePost(post);
      response.sendRedirect(request.getContextPath() + "/blog");
    } else if (action != null && action.equals("deletePost")) {
      // Xóa một bài đăng
      int postId = Integer.parseInt(request.getParameter("postId"));
      BlogDAO.deletePost(postId);
      response.sendRedirect(request.getContextPath() + "/blog");
    }
  }
}
