<%-- 
    Document   : cart.jsp
    Created on : May 18, 2024, 7:44:25 PM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/style/s_cart.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <!-- Header -->
        <%@include file="header.jsp" %>
        <!-- ======= -->
        <div class="main">
            <div class="theme">
                <h4><a href="">Giỏ hàng</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Giỏ hàng của bạn</p>
                </div>
            </div>
            <div class="cart">
                <div class="c_title">
                    <h2>Thông tin giỏ hàng của bạn</h2>
                </div>
                <div class="c_table">
                    <c:if test="${empty cart.items}">
                        <p>Giỏ hàng của bạn đang trống.</p>
                    </c:if>
                    <c:if test="${not empty cart.items}">
                        <table class="table table-sm align-middle">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${cart.items}">
                                    <tr>
                                        <td><img src="./assets/images/image_products/${item.product.hinh}" width="60px" heigh="60px"/></td>
                                        <td>${item.product.tenSP}</td>
                                        <td>${item.quantity}</td>
                                        <td>${item.product.getFormattedDonGia()}</td>
                                        <td>${item.product.getFormattedTotalPrice(item.quantity)}</td>
                                        <td>
                                            <form action="cart" method="post">
                                                <input type="hidden" name="action" value="remove">
                                                <input type="hidden" name="productId" value="${item.product.maSP}">
                                                <input type="submit" class="btn btn-danger" value="Xoá">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="total">
                            <h3>Tổng cộng: 
                                <c:set var="total" value="0" />
                                <c:forEach var="item" items="${cart.items}">
                                    <c:set var="total" value="${total + item.quantity * item.product.donGia}" />
                                </c:forEach>
                                <c:set var="formattedTotal" value="${String.format('%,.0f', total)}"/>
                                ${formattedTotal} VNĐ
                            </h3>
                        </div>
                        <div class="actions">
                            <a href="./product" class="btn btn-primary btnM">Tiếp tục mua sắm</a>
                            <a href="order" class="btn btn-success btnTT">Thanh toán</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- ====== -->
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
