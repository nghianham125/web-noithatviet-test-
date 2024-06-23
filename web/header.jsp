<%-- 
    Document   : header
    Created on : May 16, 2024, 7:33:45 PM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
            <div class="contacts">
                <div class="contacts_info">
                    <p>Phone: <a href="">01676435063 | </a></p>
                    <p>Hotline: <a href="">19001009</a></p>
                </div>
                <ul class="login_register_cart">
<!--                    <li style="width: 35%"><a href="acc?action=login"><i class="fa-solid fa-user"></i> Đăng nhập</a></li>
                    <li style="width: 35%"><a href="acc?action=register"><i class="fa-solid fa-key"></i> Đăng ký</a></li>
                    <li style="width: 30%">
                        <a href="./cart"><i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a>
                    </li>-->
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <li style="width: 35%; color: white">Xin chào: ${sessionScope.user.username}</li>
                            <li style="width: 35%"><a href="acc?action=logout"><i class="fa-solid fa-sign-out"></i> Đăng xuất</a></li>
                            <li style="width: 30%">
                                <a href="./cart"><i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li style="width: 35%"><a href="acc?action=login"><i class="fa-solid fa-user"></i> Đăng nhập</a></li>
                            <li style="width: 35%"><a href="acc?action=register"><i class="fa-solid fa-key"></i> Đăng ký</a></li>
                            <li style="width: 30%">
                                <a href="./cart"><i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="logo">
                <div class="img_logo">
                    <img src="./assets/images/logo.jpg" alt="">
                </div>
                <div class="banner_top">
                    <img src="./assets/images/bannertop.jpg" alt="">
                </div>
            </div>
            <div class="navbar">
                <ul class="menu">
                    <li><a href="./home">TRANG CHỦ</a></li>
                    <li><a href="">GIỚI THIỆU</a></li>
                    <li>
                        <a href="./product">SẢN PHẨM <i class="fa-solid fa-angle-down"></i></a>
                        <!-- <ul class="menu_2">
                            <li><a href="">Sản phẩm hot</a></li>
                            <li><a href="">Sản phẩm khuyến mãi</a></li>
                            <li><a href="">Sản phẩm mới</a></li>
                            <li><a href="">Nội thất phòng khách</a></li>
                            <li><a href="">Nội thất phòng ngủ</a></li>
                            <li><a href="">Nội thất phòng ăn</a></li>
                            <li><a href="">Nội thất phòng bếp</a></li>
                            <li><a href="">Phòng làm việc</a></li>
                            <li><a href="">Hàng trang trí</a></li>
                            <li><a href="">Bộ sưu tập</a></li>
                        </ul> -->
                    </li>
                    <li><a href="news.jsp">THIẾT KẾ NỘI THẤT</a></li>
                    <li><a href="news.jsp">TIN TỨC</a></li>
                    <li><a href="contact.jsp">LIÊN HỆ</a></li>
                </ul>
                <div class="search">
                    <form action="product" method="get">
                    <input type="text" name="search" placeholder="Tìm kiếm sản phẩm" value="${param.search}"><i class="fa-solid fa-magnifying-glass" style="position: absolute"></i>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
