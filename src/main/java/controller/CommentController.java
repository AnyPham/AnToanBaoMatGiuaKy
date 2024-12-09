package controller;

import com.google.gson.Gson;
import model.Comment;
import model.Product;
import model.User;
import org.json.JSONObject;
import service.CommentService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;


@WebServlet(name = "CommentController", value = "/commentController")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        Product product = (Product) session.getAttribute("product");

        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String dateStr = sdf.format(date);

        int id = 0;
        Object temp = req.getParameter("id");
        if(temp != null){
            if(temp instanceof Integer){
                id = (int) temp;
            }else if(temp instanceof String){
                id = Integer.valueOf((String) temp);

            }
        }
        if (id != 0){
            String content = req.getParameter("content").trim();
            String rating = req.getParameter("rating");
            if (user == null){
                resp.sendRedirect("login.jsp");
            }
            else if (content == null || content.equals("") || rating == null || rating.equals("") ){
                req.setAttribute("error", "Bạn cần nhập các đủ thông tin ");
                req.getRequestDispatcher("trangsanpham").forward(req,resp);
            }
            else{
                CommentService.insertComment(user.getId(), id, content, rating);
                UserService userService = UserService.getInstance();
                String userFullName = userService.getFullNameById(user.getId());
                JSONObject jsonResponse = new JSONObject();
                jsonResponse.put("userFullName", userFullName);
                jsonResponse.put("content", content);
                jsonResponse.put("rating", rating);
                jsonResponse.put("createDate", dateStr);
                out.write(jsonResponse.toString());
            }
        }
    }
}
