package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.BlogDAO;
import model.Post;

@WebServlet(name = "PageAdminUpdatePage", value = "/PageAdminUpdatePage")
public class PageAdminUpdatePage extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
//    String id = request.getParameter("id");
//    String title = request.getParameter("title");
//    String author = request.getParameter("author");
//    String img = request.getParameter("img");
//    String content = request.getParameter("content");
    Object temp = request.getParameter("id");
    int id = 0;
    if(temp != null){
      if(temp instanceof Integer){
        id = (int) temp;
      }else if(temp instanceof String){
        id = Integer.valueOf((String) temp);
      }
    }
      BlogDAO blogDAO = new BlogDAO();
      Post post = blogDAO.getPostById(id);

      request.getSession().setAttribute("post", post);
      request.getRequestDispatcher("pageAdminUpdatePage.jsp").forward(request, response);
    }
  }

