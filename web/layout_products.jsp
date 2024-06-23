<%-- 
    Document   : layout_products
    Created on : May 17, 2024, 8:37:50 PM
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
    <link rel="stylesheet" href="./assets/style/s_layout_products.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <!-- Header -->
        <%@include file="header.jsp" %>
        <!-- ====== -->
        <div class="main">
            <div class="theme">
                <h4><a href="./product">Sản phẩm</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Sản phẩm</p>
                </div>
            </div>
            <div class="category_products">
                <div class="category">
                    <div class="menu_category">
                        <h5><i class="fa-solid fa-table-list"></i></i> DANH MỤC SẢN PHẨM</h5>
                        <ul>
                            <c:forEach items="${categoryList}" var="category">
                                <li><a href="?categoryId=${category.maLoai}"><i class="fa-solid fa-angles-right"></i> ${category.tenLoai}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="sale_banner">
                        <div class="title_sale_banner">
                            <h4>Khuyến mãi hot</h4>
                            <div style="width: 15%; background-color: #729a33; height: 5px;"></div>
                        </div>
                        <div class="img_sale_banner">
                            <img src="./assets/images/aside_banner.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="products">
                    <div class="list_products row">
                        <c:forEach var="product" items="${productList}">
                        <div class="frame_products col-sm-4">
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
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage - 1}&amp;categoryId=${categoryId != null ? categoryId : ''}&amp;search=${param.search}">
                                        <i class="fa-solid fa-caret-left"></i>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="page">
                                <li class="page-item ${page == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${page}&amp;categoryId=${categoryId != null ? categoryId : ''}&amp;search=${param.search}">
                                        ${page}
                                    </a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage + 1}&amp;categoryId=${categoryId != null ? categoryId : ''}&amp;search=${param.search}">
                                        <i class="fa-solid fa-caret-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
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
