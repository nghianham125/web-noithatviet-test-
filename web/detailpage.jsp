<%-- 
    Document   : detailpage
    Created on : May 18, 2024, 10:22:54 AM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/style/s_detailpage.css">
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
                <h4><a href="">Thông tin chi tiết sản phẩm</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Chi tiết</p>
                </div>
            </div>
            <div class="detail_product">
                <div class="dp_left">
                    <div class="img_product">
                        <img src="./assets/images/image_products/${product.hinh}">
                    </div>
                </div>
                <div class="dp_right">
                    <div class="r_name">
                        <h2>${product.tenSP}</h2>
                    </div>
                    <div class="r_cost">
                        <p>${product.getFormattedDonGia()}</p>
                    </div>  
                    <form action="cart" method="POST">
                        <div class="r_qty">
                            <p>Số lượng: </p>
                            <input type="number" name="sl" placeholder="quantity" min="1" max="10"
                            value="1" size="5">
                        </div>
                        <div class="r_cart">
                            <input type="hidden" name="maSP" value="${product.maSP}">
                            <input type="hidden" name="tenSP" value="${product.tenSP}">
                            <input type="hidden" name="hinh" value="${product.hinh}">
                            <input type="hidden" name="donGia" value="${product.donGia}">
                            <input type="submit" name="add_to_cart" value="Cho vào giỏ">
                        </div>
                    </form>
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
