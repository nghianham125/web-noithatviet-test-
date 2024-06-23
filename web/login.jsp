<%-- 
    Document   : login
    Created on : May 17, 2024, 10:36:17 PM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/style/s_login.css">
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
                <h4><a href="">Tài khoản</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Tài khoản</p>
                </div>
            </div>
            <div class="d_form">
                <div class="title_fl">
                    <h4>Tài khoản</h4>
                </div>
                <div class="noti_fl">
                    <div class="noti1">
                        <p>Nếu bạn đã có tài khoản, đăng nhập tại đây</p>
                    </div>
                    <div class="noti2">
                        <p>Bạn quên mật khẩu? Nhập địa chỉ email để lấy lại mật khẩu qua email.</p>
                    </div>
                </div>
                <div class="d_form_login">
                    <form class="form_login" action="acc" method="post" name="form_login">
                        <input type="hidden" name="action" value="login"/>
                        <div class="d_email_password">
                            <div class="email">
                                <label for="username">Tên đăng nhập:</label>
                                <br>
                                <input type="text" id="username" name="username" required/><br/>
                            </div>
                            <div class="password">
                                <label for="email1">Email:</label>
                                <br>
                                <input type="email1" name="txt_email">
                            </div>
                        </div>
                        <div class="d_email1_rpass">
                            <div class="email1">
                                <label for="password">Mật khẩu:</label>
                                <br>
                                <input type="password" id="password" name="password" required/><br/>
                            </div>
                            <div class="rpass">
                                <input type="submit" name="btn_rpass" value="Lấy lại mật khẩu">
                            </div>
                        </div>
                        <div class="d_login">
                            <input type="submit" name="btn_submit" value="Đăng nhập">
                            <a href="acc?action=register">Chưa có tài khoản? Đăng ký tại đây</a>
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
