package controller;

import cart.Cart;
import cart.CartProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "IncreaseQuantityController", value = "/increase")
public class IncreaseQuantityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) cart = new Cart();
        int id = Integer.parseInt(req.getParameter("id"));
        cart.getData().get(id).increaseQuantity(1);
        session.setAttribute("cart", cart);
        req.getRequestDispatcher("giohang.jsp").forward(req, resp);

    }
}

