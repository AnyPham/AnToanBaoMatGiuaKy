package controller;

import dao.BlogDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "RemoveBlogController", value = "/remove-blog")
public class RemoveBlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object object = req.getParameter("id");
        int id = 0;
        if (object != null) {
            if (object instanceof Integer) {
                id = (Integer) object;
            } else if (object instanceof String) {
                id = Integer.valueOf((String) object);
            }
        }

        boolean isRemoveBlog = BlogDAO.removeBlog(id);
        if (isRemoveBlog){
            resp.sendRedirect("pageAdmin_Blog.jsp");
        }
    }
}
