<%-- 
    Document   : admin
    Created on : May 20, 2024, 10:44:29 PM
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
    <title>Admin - Quản lí nội thất</title>
    <link rel="stylesheet" href="./assets/style/s_admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <header>
        <h1>Admin - Quản lí nội thất</h1>
        <nav>
            <ul>
                <li><a href="#">Tài khoản</a></li>
                <li><a href="mn_product">Sản phẩm</a></li>
                <li><a href="#">Danh mục</a></li>
                <li><a href="#">Hoá đơn</a></li>
                <li><a href="#">Chi tiết hoá đơn</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <h2 style="text-align: center">Quản lí sản phẩm</h2>
    
        <!-- Button to add new product -->
        <a href="mn_product?action=add" class="btn btn-primary">Add New Product</a>

        <!-- Table to display products -->
        <table class="table">
            <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Mô tả</th>
                    <th>Đơn giá</th>
                    <th>Danh mục</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <%-- Loop through products and display each product --%>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td><img style="height: 70px" src="./assets/images/image_products/${product.hinh}"/></td>
                        <td>${product.maSP}</td>
                        <td>${product.tenSP}</td>
                        <td>${product.moTa}</td>
                        <td>${product.donGia}</td>
                        <td>${product.maLoai}</td>
                        <td>
                            <!-- Button to edit product -->
                            <a href="mn_product?action=edit&id=${product.maSP}" class="btn btn-info">Edit</a>
                            <!-- Button to delete product -->
                            <a href="mn_product?action=delete&id=${product.maSP}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
    </table>
    </main>

    <footer>
        <p>&copy; 2024 Furniture Store. All rights reserved.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

