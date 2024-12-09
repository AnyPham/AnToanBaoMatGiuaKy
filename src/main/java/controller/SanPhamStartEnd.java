package controller;

import model.Order;
import model.Product;
import service.PageAdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SanPhamStartEnd", value = "/sanPhamStartEnd")
public class SanPhamStartEnd extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("start-date");
        String endDate = request.getParameter("end-date");
        System.out.println(startDate);
        System.out.println(endDate);
        List<Product> productBestSellers = PageAdminService.getInstance().getProductBestSellerStartEnd(startDate,endDate);
        request.setAttribute("productBestSellers", productBestSellers);
        System.out.println(productBestSellers);
        if (request.getSession().getAttribute("startDateConverted") != null && request.getSession().getAttribute("endDateConverted") != null) {
            request.getSession().removeAttribute("startDateConverted");
            request.getSession().removeAttribute("endDateConverted");
        }
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            // Chuyển đổi từ chuỗi ngày tháng (String) sang đối tượng Date
            Date startDateObj = inputFormat.parse(startDate);
            Date endDateObj = inputFormat.parse(endDate);
            // Định dạng lại ngày tháng
            String startDateConverted = outputFormat.format(startDateObj);
            String endDateConverted = outputFormat.format(endDateObj);
            // Thiết lập thuộc tính trong phiên làm việc (session)
            request.getSession().setAttribute("startDateConverted", startDateConverted);
            request.getSession().setAttribute("endDateConverted", endDateConverted);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("thongkesanpham.jsp").forward(request, response);
    }
}
