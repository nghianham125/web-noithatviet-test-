<%-- 
    Document   : contact
    Created on : May 14, 2024, 11:17:05 AM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/style/s_contact.css">
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
                <h4><a href="">Liên hệ</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Liên hệ</p>
                </div>
            </div>
            <div class="contact_logo">
                <div class="contact">
                    <div class="title_contact">
                        <h5>Liên hệ</h5>
                    </div>
                    <div class="content_contact">
                        <p>Bạn hãy điền nội dung tin nhắn vào form dưới đây và gửi cho chúng tôi. Chúng tôi sẽ trả lời bạn sau khi nhận được.</p>
                    </div>
                    <form action="method" class="form_contact">
                        <div class="f_name">
                            <label for="name">Tên:</label><br>
                            <input type="text" name="name">
                        </div>
                        <div class="f_email">
                            <label for="email">Email:</label><br>
                            <input type="email" name="email">
                        </div>
                        <div class="f_content">
                            <label for="content">Nội dung:</label><br>
                            <input type="text" name="content">
                        </div>
                        <div class="f_submit">
                            <input type="submit" name="submit" value="Gửi tin nhắn">
                        </div>
                    </form>
                </div>
                <div class="logo_form">
                    <div class="logo_img">
                        <img src="./assets/images/logo.jpg" alt="">
                    </div>
                    <div class="text_contact">
                        <p><i class="fa-solid fa-location-dot"></i> Địa chỉ: 140 Lê Trọng Tấn, Tây Thạnh, Tân Phú, Thành phố Hồ Chí Minh</p>
                        <p><i class="fa-solid fa-phone"></i><a href=""> 19001009</a></p>
                        <p><i class="fa-solid fa-envelope"></i><a href=""> noithatviet@gmail.com</a></p>
                    </div>
                </div>
            </div>
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.067226855184!2d106.62608107589132!3d10.80616315864278!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752be27d8b4f4d%3A0x92dcba2950430867!2sHCMC%20University%20of%20Industry%20and%20Trade!5e0!3m2!1sen!2s!4v1713675426637!5m2!1sen!2s" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
