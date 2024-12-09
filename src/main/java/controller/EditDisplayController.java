package controller;

import model.Comment;
import service.CommentService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "EditDisplayController", value = "/editDisplay")
public class EditDisplayController extends HttpServlet {
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
        CommentService.getInstance().setDisplay(id);
        req.getRequestDispatcher("/pageAdminCommentController").forward(req, resp);
    }
}
