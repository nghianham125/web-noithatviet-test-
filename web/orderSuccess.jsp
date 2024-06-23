<%-- 
    Document   : orderSuccess
    Created on : May 19, 2024, 8:36:10 PM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/style/s_ordersuccess.css">
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
                <h4><a href="">Đơn hàng</a></h4>
                <div>
                    <a href="home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Xác nhận đơn hàng</p>
                </div>
            </div>
            <div class="noti_success">
                <div class="n_icon">
                    <p><i class="fa-solid fa-circle-check" style="color: #63E6BE;"></i></p>
                </div>
                <div class="n_title">
                    <h2>Đặt hàng thành công</h2>
                </div>
                <div class="n_content">
                    <p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được xác nhận</p>
                </div>
                <div class="n_back">
                    <a href="home">Quay lại trang chủ</a>
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

