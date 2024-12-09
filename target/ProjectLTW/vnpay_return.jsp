<%@page import="java.net.URLEncoder" %>
<%@page import="java.nio.charset.StandardCharsets" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@page import="java.util.Iterator" %>
<%@page import="java.util.Collections" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@ page import="configVNPay.Config" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>KẾT QUẢ THANH TOÁN</title>
    <link href="./js/bootstrap.min.css" rel="stylesheet"/>
    <link href="./js/jumbotron-narrow.css" rel="stylesheet">
    <script src="./js/jquery-1.11.3.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var transactionStatus = "<%= request.getParameter("vnp_TransactionStatus") %>";
            var orderId = '<%=request.getParameter("vnp_TxnRef")%>';

            if (transactionStatus === "00") {
                // Gọi đến set-success-payment nếu giao dịch thành công
                var url = '/ProjectLTW_war/set-success-payment';
                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'orderId=' + encodeURIComponent(orderId)
                }).then(response => {
                    if (response.ok) {
                        console.log('Payment status updated successfully.');
                    } else {
                        console.log('Failed to update payment status.');
                    }
                }).catch(error => {
                    console.error('Error:', error);
                });
            }
        });
    </script>
</head>
<body>
<%
    //Begin process return from VNPAY
    Map fields = new HashMap();
    for (Enumeration params = request.getParameterNames(); params.hasMoreElements(); ) {
        String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
        String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
        if ((fieldValue != null) && (fieldValue.length() > 0)) {
            fields.put(fieldName, fieldValue);
        }
    }

    String vnp_SecureHash = request.getParameter("vnp_SecureHash");
    if (fields.containsKey("vnp_SecureHashType")) {
        fields.remove("vnp_SecureHashType");
    }
    if (fields.containsKey("vnp_SecureHash")) {
        fields.remove("vnp_SecureHash");
    }
    String signValue = Config.hashAllFields(fields);

%>
<!--Begin display -->
<div class="container">
    <div class="header clearfix">
        <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
    </div>
    <div class="table-responsive">
        <div class="form-group">
            <label>Mã giao dịch thanh toán:</label>
            <label><%=request.getParameter("vnp_TxnRef")%>
            </label>
        </div>
        <div class="form-group">
            <label>Số tiền:</label>
            <label><%=request.getParameter("vnp_Amount")%>
            </label>
        </div>
        <div class="form-group">
            <label>Mô tả giao dịch:</label>
            <label><%=request.getParameter("vnp_OrderInfo")%>
            </label>
        </div>
        <div class="form-group">
            <label>Mã lỗi thanh toán:</label>
            <label><%=request.getParameter("vnp_ResponseCode")%>
            </label>
        </div>
        <div class="form-group">
            <label>Mã giao dịch tại CTT VNPAY-QR:</label>
            <label><%=request.getParameter("vnp_TransactionNo")%>
            </label>
        </div>
        <div class="form-group">
            <label>Mã ngân hàng thanh toán:</label>
            <label><%=request.getParameter("vnp_BankCode")%>
            </label>
        </div>
        <div class="form-group">
            <label>Thời gian thanh toán:</label>
            <label><%=request.getParameter("vnp_PayDate")%>
            </label>
        </div>
        <div class="form-group">
            <label>Tình trạng giao dịch:</label>
            <label>
                <%=
                signValue.equals(vnp_SecureHash)
                        ? ("00" .equals(request.getParameter("vnp_TransactionStatus"))
                        ? "Thành công"
                        : "Không thành công")
                        : "invalid signature"
                %>
            </label>
        </div>
    </div>
    <div style="text-align: center">
        <a href="http://localhost:8080/ProjectLTW_war/trangchu" style="padding: 10px 5px;
text-decoration: none;
background-color: deepskyblue;
color: white;border-radius: 5px;">Về trang chủ</a></div>
    <p>
        &nbsp;
    </p>
    <footer class="footer">
        <p>&copy; VNPAY 2024</p>
    </footer>
</div>
</body>
</html>
