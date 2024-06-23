<%-- 
    Document   : news
    Created on : May 14, 2024, 11:16:24 AM
    Author     : NGHIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/style/s_news.css">
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
                <h4><a href="">Tin Tức</a></h4>
                <div>
                    <a href="./home">Trang chủ <i class="fa-solid fa-angles-right"></i></a>
                    <p style="color: #668a2d; padding-left: 5px">Tin tức</p>
                </div>
            </div>
            <div class="category_content">
                <div class="category">
                    <div class="category_slidepr">
                        <h5><i class="fa-solid fa-table-list"></i></i> DANH MỤC BÀI VIẾT</h5>
                        <ul>
                            <li><a href="./home"><i class="fa-solid fa-angles-right"></i> Trang chủ</a></li>
                            <li><a href=""><i class="fa-solid fa-angles-right"></i> Giới thiệu</a></li>
                            <li><a href="./product"><i class="fa-solid fa-angles-right"></i> Sản phẩm</a></li>
                            <li><a href="news.jsp"><i class="fa-solid fa-angles-right"></i> Thiết kế nội thất</a></li>
                            <li><a href="news.jsp"><i class="fa-solid fa-angles-right"></i> Tin tức</a></li>
                            <li><a href="contact.jsp"><i class="fa-solid fa-angles-right"></i> Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="list_news">
                        <div class="ln_title title_sale_banner">
                            <h4>Bài viết liên quan</h4>
                            <div style="width: 15%; background-color: #729a33; height: 5px;"></div>
                        </div>
                        <ul class="ln_list">
                            <li>
                                <div class="li_left">
                                    <img src="./assets/images/image_news/news1.jpg" alt="">
                                </div>
                                <div class="li_right">
                                    <p class="lr_p1">Sofa nâng tầm đẳng cấp</p>
                                    <p class="lr_p2"><i class="fa-solid fa-calendar-days"></i> 30/04/2024</p>
                                </div>
                            </li>
                            <li>
                                <div class="li_left">
                                    <img src="./assets/images/image_news/news2.jpg" alt="">
                                </div>
                                <div class="li_right">
                                    <p class="lr_p1">Ghế cách điệu kiểu hiện đại</p>
                                    <p class="lr_p2"><i class="fa-solid fa-calendar-days"></i> 30/04/2024</p>
                                </div>
                            </li>
                            <li>
                                <div class="li_left">
                                    <img src="./assets/images/image_news/news3.jpg" alt="">
                                </div>
                                <div class="li_right">
                                    <p class="lr_p1">Kệ sách đẹp và hiện đại</p>
                                    <p class="lr_p2"><i class="fa-solid fa-calendar-days"></i> 30/04/2024</p>
                                </div>
                            </li>
                            <li>
                                <div class="li_left">
                                    <img src="./assets/images/image_news/news4.jpg" alt="">
                                </div>
                                <div class="li_right">
                                    <p class="lr_p1">Chậu cây cảnh trong nhà sẽ tốt cho  sức khoẻ</p>
                                    <p class="lr_p2"><i class="fa-solid fa-calendar-days"></i> 30/04/2024</p>
                                </div>
                            </li>
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
                <div class="content">
                    <div class="title_ct">
                        <h4>Tin tức</h4>
                    </div>
                    <div class="list_ct row" style="margin-left: 0px">
                        <div class="card col-sm-4">
                            <img src="./assets/images/image_news/news5.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Sofa nâng tầm đẳng cấp</h5>
                                <p class="card-text">Cuốn hút với những mẫu Ghế da Nội Thất Việt 2024 với mẫu mã đẹp, hiện đại, khẳng định...</p>
                                <a href="#" class="btn btn-outline-success">Xem thêm</a>
                            </div>
                        </div>
                        <div class="card col-sm-4">
                            <img src="./assets/images/image_news/news6.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Ghế cách điệu kiểu hiện đại</h5>
                                <p class="card-text">Chào bạn. Hai năm gần đây bạn thấy một dòng ghế xuất hiện ở các quán cafe, nhà hàng, Dần...</p>
                                <a href="#" class="btn btn-outline-success">Xem thêm</a>
                            </div>
                        </div>
                        <div class="card col-sm-4">
                            <img src="./assets/images/image_news/news7.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Kệ sách đẹp và hiện đại</h5>
                                <p class="card-text">Dù rằng hiện nay xu hướng phát triển của sách điện tử ngày càng mạnh, nhưng phần đa trong chúng...</p>
                                <a href="#" class="btn btn-outline-success">Xem thêm</a>
                            </div>
                        </div>
                        <div class="card col-sm-4">
                            <img src="./assets/images/image_news/news8.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Chậu cây cảnh trong nhà sẽ tốt...</h5>
                                <p class="card-text">Cây Kim ngân là loại cây cảnh không xạ với người chơi cây hiện nay, và nó luôn là những...</p>
                                <a href="#" class="btn btn-outline-success">Xem thêm</a>
                            </div>
                        </div>
                        <div class="card col-sm-4">
                            <img src="./assets/images/image_news/news9.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Bài viết mẫu</h5>
                                <p class="card-text">Đây là trang blog của cửa hàng. Bạn có thể dùng blog để quảng bá sản phẩm mới, chia sẻ...</p>
                                <a href="#" class="btn btn-outline-success">Xem thêm</a>
                            </div>
                        </div>
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
