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
        <div class="container mt-5">
            <h2>Thêm sản phẩm mới</h2>
            <form action="mn_product" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="add">
                
                <div class="mb-3">
                    <label for="tenSP" class="form-label">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="tenSP" name="tenSP" required>
                </div>
                
                <div class="mb-3">
                    <label for="moTa" class="form-label">Mô tả</label>
                    <textarea class="form-control" id="moTa" name="moTa" rows="3" required></textarea>
                </div>
                
                <div class="mb-3">
                    <label for="donGia" class="form-label">Đơn giá</label>
                    <input type="number" class="form-control" id="donGia" name="donGia" step="0.01" required>
                </div>
                
                <div class="mb-3">
                    <label for="hinh" class="form-label">Hình ảnh</label>
                    <input type="file" class="form-control" id="hinh" name="hinh" required>
                </div>
                
                <div class="mb-3">
                    <label for="maLoai" class="form-label">Mã loại</label>
                    <select class="form-select" id="maLoai" name="maLoai" required>
                        <option value="">Chọn...</option>
                        <option value="1">Loại 1</option>
                        <option value="2">Loại 2</option>
                        <!-- Thêm các mã loại khác nếu cần -->
                    </select>
                </div>
                
                <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
            </form>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Furniture Store. All rights reserved.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

