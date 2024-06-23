<%-- 
    Document   : order
    Created on : May 19, 2024, 8:34:55 PM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác nhận đơn hàng</title>
    <link rel="stylesheet" href="./assets/style/s_order.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <%@include file="header.jsp" %>
        <div class="main">
            <div class="theme">
                <h4><a href="">Xác nhận đơn hàng</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Xác nhận đơn hàng của bạn</p>
                </div>
            </div>
            <div class="confirm">
                <div class="d_confirm">
                    <c:if test="${not empty cart.items}">
                    <table class="table mt-3 table-light table-bordered align-middle" style="text-align: center; font-size: 20px">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cart.items}">
                                <tr class="table-success">
                                    <td>${item.product.tenSP}</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.product.getFormattedDonGia()}</td>
                                    <td>${item.product.getFormattedTotalPrice(item.quantity)}</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="3">Tổng giá tiền</td>
                                <c:set var="totalPrice" value="0" />
                                <c:forEach var="item" items="${cart.items}">
                                    <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.product.donGia)}" />
                                </c:forEach>
                                <td>
                                    <c:set var="formattedTotalPrice" value="${String.format('%,.0f', totalPrice)}"/>
                                    ${formattedTotalPrice} VNĐ
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <form action="order" method="post">
                        <input type="submit" class="btn btn-success btn_confirm" value="Xác nhận đặt hàng" style="margin-top: 10px">
                    </form>
                    </c:if>
                    <c:if test="${empty cart.items}">
                        <p class="mt-3">Giỏ hàng của bạn đang trống.</p>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- ====== -->
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>


