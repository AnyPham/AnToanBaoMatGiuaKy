/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configVNPay;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.OrderDAO;
import model.Order;
import service.OrderService;
import service.PaymentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author CTT VNPAY
 */
@WebServlet("/vnpay")
public class ajaxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";

        // Xử lý giá trị amount
        String amountParam = req.getParameter("amount");
        System.out.println(amountParam);
        long amount = 0;
        if (amountParam != null && !amountParam.isEmpty()) {
            try {
                amount = Long.parseLong(amountParam) * 100;
            } catch (NumberFormatException e) {
                // Xử lý khi không thể chuyển đổi amountParam thành số nguyên
                JsonObject errorResponse = new JsonObject();
                errorResponse.addProperty("code", "400");
                errorResponse.addProperty("message", "Invalid amount parameter format.");
                resp.getWriter().write(errorResponse.toString());
                return;
            }
        } else {
            // Xử lý trường hợp amount không tồn tại
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("code", "400");
            errorResponse.addProperty("message", "Missing amount parameter.");
            resp.getWriter().write(errorResponse.toString());
            return;
        }

        String bankCode = "NCB";
        String vnp_TxnRef = req.getParameter("orderId");
        String vnp_IpAddr = "192.168.0.42";
        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }

        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
        insertOrder(req, resp);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(job));
    }

    public void insertOrder(HttpServletRequest req, HttpServletResponse resp) {
        Object object = req.getSession().getAttribute("order_id");
        int order_id = 0;
        if (object != null) {
            if (object instanceof Integer) {
                order_id = (Integer) object;
            } else if (object instanceof String) {
                order_id = Integer.valueOf((String) object);
            }
        }
        boolean isPayment = OrderService.getInstance().paymentOrder("Đã chọn phương thức thanh toán bằng thẻ ngân hàng", order_id);
        if (isPayment) {
            req.getSession().removeAttribute("order_id");
            req.getSession().removeAttribute("cart");
        }
    }

}
