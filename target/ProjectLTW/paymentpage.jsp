<%@ page import="cart.Cart" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="model.*" %>
<%@ page import="dao.OrderDetailDAO" %>
<%@ page import="dao.VoucherDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 21/01/2024
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Order order = (Order) session.getAttribute("order");

    Object tempObj = session.getAttribute("percent_decrease");
    double percent_decrease = 0;
    if (tempObj != null) {
        if (tempObj instanceof Double) {
            percent_decrease = (Double) tempObj;
        } else if (tempObj instanceof String) {
            percent_decrease = Double.valueOf((String) tempObj);
        }
    }
    List<OrderDetail> orderDetails = OrderDetailDAO.getOrderDetailByIdOrder(order.getId());
    Voucher voucher = VoucherDAO.getVoucherById(order.getVoucher_id());
    request.getSession().setAttribute("order_id", order.getId());
    String reason = request.getParameter("reason");
%>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getInstance(locale);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thanh Toán</title>
    <script src="https://kit.fontawesome.com/3e135170bd.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/payment.css">
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #changeAddressBtn {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        #changeAddressBtn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<!--header-->
<%@include file="header.jsp" %>
<div id="main">
    !--Phần tỉnh thành-->
    <!--silder-->
    <div class="slider">
        <div class="container">
            <div class="payment">
                <h1 class="payment-h1">Thanh Toán <i class="fa-solid fa-money-bill"></i></h1>
                <form action="cancel-order?order_id=<%=order.getId()%>">
                    <div class="payment-id">
                        <h2 class="payment-id-title">Đơn hàng của bạn</h2>
                        <h3 id="payment-id-main">Mã đơn hàng: #<%=order.getId()%>
                        </h3>
                        <button type="submit" href="" id="cancel-form">Huỷ đơn hàng</button>
                    </div>
                </form>
                <div class="payment-information">
                    <div class="information-1">
                        <h4>Người nhận hàng: </h4>
                        <p id="selectedName">Chưa có
                        </p>
                    </div>
                    <div class="information-2">
                        <h4>Số điện thoại nhận hàng:</h4>
                        <p id="selectedPhone">
                            Chưa có
                        </p>
                    </div>
                    <div class="information-3">
                        <h4>Giao đến: </h4>
                        <p id="selectedAddress">Chưa có (nhân viên sẽ gọi xác nhận trước khi giao)</p>
                        <button id="changeAddressBtn" type="button">Thay đổi địa chỉ</button>
                    </div>
                </div>

                <!-- Thêm phần modal để chọn địa chỉ -->
                <div id="addressModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Chọn địa chỉ giao hàng</h2>
                        <div id="addressList">
                            <!-- Địa chỉ sẽ được thêm vào đây bằng JavaScript -->
                        </div>
                        <button id="addAddressBtn">Thêm địa chỉ mới</button>
                    </div>
                </div>

                <div class="payment-title">
                    <h3 class="title-1">Sản phẩm</h3>
                    <h3 class="title-2">Tổng tiền</h3>
                </div>
                <%int total = 0;%>
                <%
                    for (OrderDetail od : orderDetails

                    ) {
                        total += od.getTotal_money();

                %>
                <div class="product">
                    <p class="product-1"><%=ProductDAO.getById(od.getProduct_id()).getTitle()%>
                        x <%=od.getQuantity()%>
                    </p>
                    <p class="product-price"><%=numberFormat.format(od.getTotal_money())%>
                        ₫</p>
                </div>
                <%}%>
                <div class="tax">
                    <p class="tax-title"><%=voucher.getVoucher_name()%>
                    </p>
                    <p class="tax-price"><%=numberFormat.format(total - order.getTotal_money())%>₫
                    </p>
                </div>
                <div class="total">
                    <p class="total-title">Tồng tiền</p>
                    <p class="total-price"><%=numberFormat.format(order.getTotal_money())%>₫</p>
                </div>
                <form id="paymentForm">
                    <h3 style="padding: 0 24px">Chọn hình thức thanh toán</h3>
                    <div class="payment-type">
                        <div class="payment-type-1">
                            <input type="radio" value="Thanh toán bằng tiền mặt" name="paymentOption"
                                   class="checkbox-2">
                            <p>Thanh toán bằng tiền mặt</p>
                        </div>
                        <div class="payment-type-1">
                            <input type="radio" value="Thanh toán bằng thẻ ngân hàng" name="paymentOption"
                                   class="checkbox-2">
                            <p>Thanh toán bằng thẻ ngân hàng</p>
                        </div>
                    </div>
                    <button type="submit" class="submit">
                        <i class="fa-solid fa-bag-shopping"></i>
                        Thanh Toán
                    </button>
                </form>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    <script src="./js/payment.js"></script>
    <script>
        (function () {
            var modal = document.getElementById("addressModal");
            var btn = document.getElementById("changeAddressBtn");
            var span = document.getElementsByClassName("close")[0];
            var selectedAddressElement = document.getElementById("selectedAddress");
            var selectedPhoneElement = document.getElementById("selectedPhone");
            var selectedNameElement = document.getElementById("selectedName");
            var addAddressBtn = document.getElementById("addAddressBtn");
            var addressList = document.getElementById("addressList");
            var paymentForm = document.getElementById("paymentForm");

            paymentForm.addEventListener("submit", function (event) {
                event.preventDefault(); // Ngăn form submit mặc định

                // Lấy giá trị của phương thức thanh toán được chọn
                var paymentOption = document.querySelector('input[name="paymentOption"]:checked');

                if (!paymentOption) {
                    alert('Vui lòng chọn phương thức thanh toán');
                    return;
                }

                var paymentOptionValue = paymentOption.value;
                console.log(paymentOptionValue);

                // Lấy giá trị của amount
                var amount = '<%=order.getTotal_money()%>';
                var orderId = '<%=order.getId()%>';
                // Nếu là thanh toán bằng thẻ ngân hàng thì gọi ajax đến servlet
                if (paymentOptionValue === "Thanh toán bằng thẻ ngân hàng") {
                    var url = '/ProjectLTW_war/vnpay';
                    fetch(url, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: 'amount=' + encodeURIComponent(amount) + '&orderId=' + encodeURIComponent(orderId)
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.code === "00") {
                                // Xử lý khi nhận được dữ liệu thành công từ servlet
                                // Chuyển hướng đến URL thanh toán mà không hiển thị tham số trên URL
                                window.location.replace(data.data);
                            } else {
                                // Xử lý khi có lỗi từ servlet
                                alert('Có lỗi xảy ra khi chuẩn bị thanh toán.');
                            }
                        })
                        .catch(error => {
                            // Xử lý khi gọi fetch bị lỗi
                            console.error('Error:', error);
                            alert('Có lỗi xảy ra khi gửi yêu cầu thanh toán.');
                        });
                } else {
                    // Xử lý khi chọn thanh toán bằng tiền mặt (hoặc các phương thức khác)
                    // Sử dụng POST để chuyển hướng
                    var form = document.createElement('form');
                    form.method = 'post';
                    form.action = '/ProjectLTW_war/payment-order';

                    var paymentOptionInput = document.createElement('input');
                    paymentOptionInput.type = 'hidden';
                    paymentOptionInput.name = 'paymentOption';
                    paymentOptionInput.value = paymentOptionValue;
                    form.appendChild(paymentOptionInput);

                    var amountInput = document.createElement('input');
                    amountInput.type = 'hidden';
                    amountInput.name = 'amount';
                    amountInput.value = amount;
                    form.appendChild(amountInput);

                    document.body.appendChild(form);
                    form.submit();
                }
            });
            document.addEventListener('DOMContentLoaded', (event) => {
                addAddressBtn.onclick = function () {
                    // Hiển thị form nhập liệu
                    var newAddressForm = document.createElement('div');
                    newAddressForm.innerHTML = `
                <h3>Thêm địa chỉ mới</h3>
                <form id="newAddressForm">
                    <input type="text" id="newAddress" placeholder="Địa chỉ giao hàng" required>
                    <input type="text" id="newReceiver" placeholder="Tên người nhận" required>
                    <input type="text" id="newPhoneNumber" placeholder="Số điện thoại" required>
                    <button type="button" id="saveAddressBtn">Lưu</button>
                </form>
            `;
                    addressList.appendChild(newAddressForm);

                    var saveAddressBtn = document.getElementById("saveAddressBtn");

                    saveAddressBtn.onclick = function () {
                        var newAddress = document.getElementById("newAddress").value;
                        var newReceiver = document.getElementById("newReceiver").value;
                        var newPhoneNumber = document.getElementById("newPhoneNumber").value;

                        // Gửi yêu cầu lưu địa chỉ mới vào server
                        var params = new URLSearchParams();
                        params.append('userId', '<%=user.getId()%>');
                        params.append('phoneNumber', newPhoneNumber);
                        params.append('receiver', newReceiver);
                        params.append('newAddress', newAddress);

                        fetch('/ProjectLTW_war/create-address', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded',
                            },
                            body: params.toString()
                        })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                console.log('Add new address successful:', data);
                                // Hiển thị thông tin địa chỉ mới trong modal
                                var newAddressElement = document.createElement('div');
                                newAddressElement.innerHTML = 'Địa chỉ: ' + data.address +
                                    ', Tên người nhận: ' + data.receiver +
                                    ', Điện thoại: ' + data.phoneNumber;
                                newAddressElement.onclick = function () {
                                    selectedAddressElement.textContent = data.address;
                                    selectedNameElement.textContent = data.receiver;
                                    selectedPhoneElement.textContent = data.phoneNumber;
                                    modal.style.display = "none";
                                };
                                addressList.appendChild(newAddressElement);

                                // Xóa form nhập liệu sau khi lưu thành công
                                newAddressForm.remove();
                            })
                            .catch(error => {
                                console.error('Error adding new address:', error);
                                // Xử lý lỗi khi gọi API
                            });
                    };
                };

                btn.onclick = function () {
                    modal.style.display = "block";
                    // Gọi API để lấy danh sách địa chỉ
                    fetch('/ProjectLTW_war/get-list-address?userId=<%=user.getId()%>')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(addresses => {
                            addressList.innerHTML = '';
                            addresses.forEach(address => {
                                var addressElement = document.createElement('div');
                                addressElement.innerHTML = 'Địa chỉ: ' + address.address +
                                    ', Tên người nhận: ' + address.receiver +
                                    ', Điện thoại: ' + address.phoneNumber;
                                addressElement.onclick = function () {
                                    selectedAddressElement.textContent = address.address;
                                    selectedNameElement.textContent = address.receiver;
                                    selectedPhoneElement.textContent = address.phoneNumber;
                                    modal.style.display = "none";
                                    // Gửi yêu cầu cập nhật địa chỉ đơn hàng
                                    var params = new URLSearchParams();
                                    params.append('orderId', '<%=order.getId()%>');
                                    params.append('phoneNumber', address.phoneNumber);
                                    params.append('receiver', address.receiver);
                                    params.append('newAddress', address.address);

                                    fetch('/ProjectLTW_war/update-order-address', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/x-www-form-urlencoded',
                                        },
                                        body: params.toString()
                                    })
                                        .then(response => {
                                            if (!response.ok) {
                                                throw new Error('Network response was not ok');
                                            }
                                            return response.json();
                                        })
                                        .then(data => {
                                            console.log('Update order address successful:', data);
                                            // Thực hiện các hành động cần thiết sau khi cập nhật thành công
                                        })
                                        .catch(error => {
                                            console.error('Error updating order address:', error);
                                            // Xử lý lỗi khi gọi API
                                        });
                                };
                                addressList.appendChild(addressElement);
                            });
                        })
                        .catch(error => {
                            console.error('Error fetching address list:', error);
                            // Xử lý lỗi khi lấy danh sách địa chỉ
                        });
                };

                span.onclick = function () {
                    modal.style.display = "none";
                };

                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                };
            });
        })
        ();
    </script>
</body>
</html>
