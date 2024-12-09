
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);

    Object tempObj3 = session.getAttribute("totalMoney");
    int totalMoney = 0;
    if (tempObj3 != null) {
        if (tempObj3 instanceof Integer) {
            totalMoney = (Integer) tempObj3;
        } else if (tempObj3 instanceof String) {
            totalMoney = Integer.valueOf((String) tempObj3);
        }
    }

%>

<% String startDateConverted = (String) session.getAttribute("startDateConverted");%>
<% String endDateConverted = (String) session.getAttribute("endDateConverted"); %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doanh thu</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .icon-wrapper {
            margin-top: 2px;
            background-color: #4a90e2;
            display: inline-block;
            margin-right: 10px;
            padding: 5px;
            border-radius: 50%;
        }
        .icon-wrapper i {
            color: #ffffff;
        }
    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<section class="home-section">
    <div class="home-content">
        <div class="manager-product">
            <div class="" style="margin-bottom: 20px">
                <form action="./pageAdminRevenueStartEnd" method="post">
                    <label for="start-date">Ngày bắt đầu:</label>
                    <input type="date" id="start-date" name="start-date" required>
                    <br><br>
                    <label for="end-date">Ngày kết thúc:</label>
                    <input type="date" id="end-date" name="end-date" required>
                    <br><br>
                    <input type="submit" value="Thống kê">
                </form>
            </div>
            <div class="title">
                <% if (startDateConverted != null && endDateConverted != null) { %>
                Doanh Thu <%= startDateConverted %> đến <%= endDateConverted %>
                <% } else { %>
                Thống kê Doanh Thu
                <% } %>
            </div>
            <div class="box" style="margin-bottom: 10px">
                <div class="right-side">
                    <div class="box-topic">Doanh Thu</div>
                    <div class="number">
                        <h3><%=numberFormat.format(totalMoney)%> vnđ</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="./js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-2.0.8/datatables.min.js"></script>
</body>
</html>
