<%-- 
    Document   : homepage
    Created on : May 14, 2024, 10:51:52 AM
    Author     : NGHIA
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./assets/style/s_homepage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>
    <body>
    <div class="container">
        <!-- Header -->
        <%@include file="header.jsp" %>
        <!-- ====== -->
        <div class="main">
            <div class="category_slidepr">
                <div class="category">
                    <h5><i class="fa-solid fa-table-list"></i></i> DANH MỤC SẢN PHẨM</h5>
                    <ul>
                        <c:forEach items="${categoryList}" var="category">
                            <li><a href="product?categoryId=${category.maLoai}"><i class="fa-solid fa-angles-right"></i> ${category.tenLoai}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="slidepr">
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" style="height: 100%">
                        <div class="carousel-inner" style="height: 100%">
                            <div class="carousel-item active" style="height: 100%">
                                <img src="./assets/images/slider_1.jpg" class="d-block w-100" style="height: 100%">
                            </div>
                            <div class="carousel-item" style="height: 100%">
                                <img src="./assets/images/slider_2.jpg" class="d-block w-100" style="height: 100%">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="commit_info">
                <div class="item_commit_info">
                    <div class="icon_commit"><i class="fa-solid fa-wallet"></i></div>
                    <div>
                        <p style="font-weight: bold;">TRẢ TIỀN & HOÀN TIỀN</p>
                        <p>Khách hàng hoàn trả hàng được hoàn trả 100% số tiền đã chi trả trước đó</p>
                    </div>
                </div>
                <div class="item_commit_info">
                    <div class="icon_commit"><i class="fa-solid fa-car"></i></div>
                    <div>
                        <p style="font-weight: bold;">MIỄN PHÍ VẬN CHUYỂN</p>
                        <p>Chúng tôi miễn phí vẫn chuyển cho toàn bộ khách hàng trong nội thành</p>
                    </div>
                </div>
                <div class="item_commit_info">
                    <div class="icon_commit"><i class="fa-solid fa-share"></i></div>
                    <div>
                        <p style="font-weight: bold;">BẢO MẬT THÔNG TIN</p>
                        <p>Công ty cam kết bảo mật tuyệt đối thông tin cá nhân của khách hàng</p>
                    </div>
                </div>
            </div>
            <div class="banner_pr">
                <div class="banner_left">
                    <img src="./assets/images/bannerSlider1.jpg" alt="">
                </div>
                <div class="banner_right">
                    <img src="./assets/images/bannerSlider2.jpg" alt="">
                </div>
            </div>
            <div class="products">
                <div class="title_products">
                    <h4>Sản phẩm</h4>
                </div>
                <div class="list_products row">
                    <c:forEach var="product" items="${productList}">
                        <div class="frame_products col-sm-3">
                            <div class="fp_img">
                                <img src="./assets/images/image_products/${product.hinh}" alt="">
                            </div>
                            <div class="fp_tensp">
                                <p>${product.tenSP}</p>
                            </div>
                            <div class="fp_gia">
                                <p>${product.getFormattedDonGia()}</p>
                            </div>
                            <div class="fp_details">
                                <a href="?id=${product.maSP}">Xem chi tiết</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="pagination">
                    <ul class="pagination">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item"><a class="page-link" href="?page=${currentPage - 1}"><i class="fa-solid fa-caret-left"></i></a></li>
                        </c:if>
                        <c:forEach begin="1" end="${totalPages}" var="page">
                            <li class="page-item ${page == currentPage ? 'active' : ''}">
                                <a class="page-link" href="?page=${page}">${page}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item"><a class="page-link" href="?page=${currentPage + 1}"><i class="fa-solid fa-caret-right"></i></a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="banner_pr2">
                <img src="./assets/images/bannerSection.jpg" alt="">
            </div>
            <div class="partner">
                <div class="title_partner">
                    <h4>Đối tác</h4>
                </div>
                <div class="list_partner">
                    <div><img src="./assets/images/brand1.jpg" alt=""></div>
                    <div><img src="./assets/images/brand2.jpg" alt=""></div>
                    <div><img src="./assets/images/brand3.jpg" alt=""></div>
                    <div><img src="./assets/images/brand4.jpg" alt=""></div>
                    <div><img src="./assets/images/brand5.jpg" alt=""></div>
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
