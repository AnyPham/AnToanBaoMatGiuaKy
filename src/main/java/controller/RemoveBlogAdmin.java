package controller;

import dao.BlogDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveBlogAdmin", value = "/RemoveBlogAdmin")
public class RemoveBlogAdmin extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("id");
    int postId = Integer.parseInt(id);

    BlogDAO.deletePost(postId);
    response.sendRedirect(("pageAdmin_Blog.jsp"));
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
