package controller;

import model.Comment;
import service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PageAdminCommentController", value = "/pageAdminCommentController")
public class PageAdminCommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Comment> comments = CommentService.getInstance().getAllComment();
        req.setAttribute("comments", comments);
        req.getRequestDispatcher("pageAdmin_Comment.jsp").forward(req, resp);
    }
}
