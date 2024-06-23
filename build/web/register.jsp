<%-- 
    Document   : register
    Created on : May 17, 2024, 10:36:38 PM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/style/s_register.css">
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
                <h4><a href="">Tạo tài khoản</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Tạo tài khoản</p>
                </div>
            </div>
            <div class="d_form">
                <div class="title_fl">
                    <h4>Tạo tài khoản</h4>
                </div>
                <div class="noti_fl">
                    <p>Nếu chưa có tài khoản vui lòng đăng ký tại đây</p>
                </div>
                <div class="d_form_register">
                    <form class="form_register" action="acc" method="post" name="form_register">
                        <input type="hidden" name="action" value="register"/>
                        <div class="d_lastname_name">
                            <div class="last_name">
                                <label for="tenKh">Tên:</label>
                                <br>
                                <input type="text" id="tenKh" name="tenKh" required/><br/>
                            </div>
                            <div class="name">
                                <label for="email">Email:</label>
                                <br>
                                <input type="email" id="email" name="email" required/><br/>
                            </div>
                        </div>
                        <div class="d_email_password">
                            <div class="email">
                                <label for="diaChi">Địa chỉ:</label>
                                <br>
                                <input type="text" id="diaChi" name="diaChi" required/><br/>
                            </div>
                            <div class="password">
                                <label for="sdt">Số điện thoại:</label>
                                <br>
                                <input type="text" id="sdt" name="sdt" required/><br/>
                            </div>
                        </div>
                        <div class="d_email_password">
                            <div class="email">
                                <label for="username">Tên đăng nhập:</label>
                                <br>
                                <input type="text" id="username" name="username" required/><br/>
                            </div>
                            <div class="password">
                                <label for="password">Mật khẩu:</label>
                                <br>
                                <input type="password" id="password" name="password" required/><br/>
                            </div>
                        </div>
                        <div class="d_register">
                            <input type="submit" name="btn_submit" value="Đăng ký">
                        </div>
                    </form>
                    <div class="l_login">
                        <a href="acc?action=login">Bạn đã có tài khoản? Đăng nhập tại đây</a>
                    </div>
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
