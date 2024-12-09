<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="logDao" class="dao.LogDao"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý log</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/pageAdmin_product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <jsp:include page="cssDatatable.jsp"/>
    <style>
        .icon-wrapper i {
            color: #ffffff;
        }

        td, th {
            vertical-align: middle; /* Căn giữa theo chiều dọc */
        }
    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div class="container-fluid">
    <div class="row">
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <form action="delete-log" method="post">
                <div
                        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h3 class="h2"> Quản Lí Log </h3>
                    <div id="deleteButton" class="btn-toolbar mb-2 mb-md-0" style="margin-right: 50px; display: none">
                        <button type="submit" class="btn btn-sm btn-outline-success">
                            Xóa Log
                        </button>
                    </div>
                </div>
                <table class="table" id="tableLog">
                    <thead>
                    <tr>
                        <th class="text-center"><input type="checkbox" id="selectAll" class="log-checkbox"></th>
                        <th scope="col">Level</th>
                        <th scope="col">#</th>
                        <th scope="col">Hành Động</th>
                        <th scope="col">Table</th>
                        <th scope="col">Thời gian</th>
                        <th scope="col"></th>
                        <th>Customer Id</th>
                        <th>Before Data</th>
                        <th>After Data</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${logDao.selectAll()}">
                        <tr id="log-${p.id}">
                            <td class="text-center align-middle">
                                <input type="checkbox" name="selectedLog" value="${p.id}" class="log-checkbox"
                                       data-cart-id="${p.id}">
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.level eq 'infor'}">
                                        <div class="badge text-wrap"
                                             style="width: 6rem;background-color: green">
                                            Infor
                                        </div>
                                    </c:when>
                                    <c:when test="${p.level eq 'warning'}">
                                        <div class="badge text-wrap"
                                             style="width: 6rem;background-color: yellow">
                                            Warning
                                        </div>
                                    </c:when>
                                    <c:when test="${p.level eq 'danger'}">
                                        <div class="badge text-wrap"
                                             style="width: 6rem;background-color: red">
                                            Danger
                                        </div>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td> ${p.id} </td>
                            <td> ${p.action} </td>
                            <td> ${p.table} </td>
                            <td>
                                <fmt:formatDate value="${p.time}" pattern="dd/MM/yyyy hh:MM:ss"/>
                            </td>
                            <td>
                                <a href="admin-detail-log?logId=${p.id}">
                                    <button type="button" class="btn btn-sm btn-outline-success">
                                        Chi tiết
                                    </button>
                                </a>
                            </td>
                            <td> ${p.user_id} </td>
                            <td> ${p.beforeData} </td>
                            <td> ${p.afterData} </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </main>
    </div>
</div>
<jsp:include page="jsDatatable.jsp"/>
<script>
    new DataTable('#tableLog', {
        layout: {
            topStart: {
                buttons: [
                    {
                        extend: 'copy',
                        exportOptions: {
                            columns: ':not(:eq(6))' // xuất tất cả các cột trừ cột thứ 6
                        }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: ':not(:eq(6))' // xuất tất cả các cột trừ cột thứ 6
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: ':not(:eq(6))' // xuất tất cả các cột trừ cột thứ 6
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: ':not(:eq(6))' // xuất tất cả các cột trừ cột thứ 6
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':not(:eq(6))' // xuất tất cả các cột trừ cột thứ 6
                        }
                    }
                ]
            }
        },
        columnDefs: [
            {targets: [0, 6], orderable: false},
            {"targets": [7, 8, 9], "visible": false}// Xét ordering cho cột thứ 6 (số thứ tự là 5)
        ]
    });

    // Hàm này được gọi khi checkbox "Select All" được nhấn
    function toggleSelectAll() {
        var checkboxes = document.querySelectorAll('.log-checkbox'); // Lấy tất cả các checkbox
        var selectAllCheckbox = document.getElementById('selectAll'); // Lấy checkbox "Select All"
        var deleteButton = document.getElementById('deleteButton'); // Lấy nút "Xóa Log"

        // Lặp qua tất cả các checkbox và thiết lập trạng thái checked của chúng
        checkboxes.forEach(function (checkbox) {
            checkbox.checked = selectAllCheckbox.checked;
        });

        // Hiển thị hoặc ẩn nút "Xóa Log" tùy thuộc vào trạng thái của checkbox "Select All"
        deleteButton.style.display = selectAllCheckbox.checked ? 'block' : 'none';
    }

    // Kiểm tra xem có ít nhất một checkbox được chọn không
    function checkIfAnyCheckboxChecked() {
        var checkboxes = document.querySelectorAll('.log-checkbox'); // Lấy tất cả các checkbox
        var deleteButton = document.getElementById('deleteButton'); // Lấy nút "Xóa Log"

        // Hiển thị hoặc ẩn nút "Xóa Log" tùy thuộc vào kết quả kiểm tra
        deleteButton.style.display = Array.from(checkboxes).some(function (checkbox) {
            return checkbox.checked;
        }) ? 'block' : 'none';
    }

    // Gắn sự kiện click cho tất cả các checkbox
    document.querySelectorAll('.log-checkbox').forEach(function (checkbox) {
        checkbox.addEventListener('click', checkIfAnyCheckboxChecked);
    });

    // Gắn sự kiện click cho checkbox "Select All"
    document.getElementById('selectAll').addEventListener('click', toggleSelectAll);
</script>
</body>
</html>
