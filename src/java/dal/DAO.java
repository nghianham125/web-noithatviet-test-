/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.KhachHang;
import model.Product;
import model.User;

/**
 *
 * @author NGHIA
 */
public class DAO extends DBContext{

    /**
     * Lấy tất cả sản phẩm từ cơ sở dữ liệu
     * @return danh sách sản phẩm
     */
    // ====================XỬ LÍ SẢN PHẨM===========================
    public List<Product> getProductsByPage(int page, int pageSize)
    {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM san_pham ORDER BY ma_sp OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            int offset = (page - 1) * pageSize;
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int maSP = rs.getInt("ma_sp");
                    String tenSP = rs.getString("ten_sp");
                    String moTa = rs.getString("mo_ta");
                    double donGia = rs.getDouble("gia");
                    String hinh = rs.getString("hinh");
                    String maLoai = rs.getString("ma_loai");

                    Product product = new Product(maSP, tenSP, moTa, donGia, hinh, maLoai);
                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public int getTotalProducts()
    {
        String query = "SELECT COUNT(*) FROM san_pham";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    
    // Phương thức để lấy danh sách các danh mục từ cơ sở dữ liệu
    public List<Category> getAllCategories()
    {
        List<Category> categories = new ArrayList<>();
        String query = "select ma_loai, ten_loai from loai_san_pham";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int maLoai = rs.getInt("ma_loai");
                String tenLoai = rs.getString("ten_loai");
                Category category = new Category(maLoai, tenLoai);
                categories.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }
    
    // Phương thức lấy danh sách sản phẩm theo danh mục
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM san_pham WHERE ma_loai = ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int maSP = rs.getInt("ma_sp");
                    String tenSP = rs.getString("ten_sp");
                    String moTa = rs.getString("mo_ta");
                    double donGia = rs.getDouble("gia");
                    String hinh = rs.getString("hinh");
                    String maLoai = rs.getString("ma_loai");

                    Product product = new Product(maSP, tenSP, moTa, donGia, hinh, maLoai);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    
    // Phương thức lấy sản phẩm theo mã sản phẩm
    public Product getProductById(int productId) {
        Product product = null;
        String query = "SELECT * FROM san_pham WHERE ma_sp = ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int maSP = rs.getInt("ma_sp");
                    String tenSP = rs.getString("ten_sp");
                    String moTa = rs.getString("mo_ta");
                    double donGia = rs.getDouble("gia");
                    String hinh = rs.getString("hinh");
                    String maLoai = rs.getString("ma_loai");

                    product = new Product(maSP, tenSP, moTa, donGia, hinh, maLoai);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
    
    //===========================XỬ LÍ KHÁCH HÀNG=================================
    
    public boolean registerUser(KhachHang khachHang, User user) throws Exception{
        String insertKhachHang = "INSERT INTO khach_hang (ten_kh, email, dia_chi, sdt) VALUES (?, ?, ?, ?)";
        String insertUser = "INSERT INTO [user] (username, [password], is_admin, ma_kh) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement psKhachHang = conn.prepareStatement(insertKhachHang, PreparedStatement.RETURN_GENERATED_KEYS)) {
                psKhachHang.setString(1, khachHang.getTenKh());
                psKhachHang.setString(2, khachHang.getEmail());
                psKhachHang.setString(3, khachHang.getDiaChi());
                psKhachHang.setString(4, khachHang.getSdt());

                int affectedRowsKhachHang = psKhachHang.executeUpdate();

                if (affectedRowsKhachHang > 0) {
                    try (ResultSet generatedKeys = psKhachHang.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int maKh = generatedKeys.getInt(1);
                            user.setMaKh(maKh);

                            try (PreparedStatement psUser = conn.prepareStatement(insertUser)) {
                                psUser.setString(1, user.getUsername());
                                psUser.setString(2, user.getPassword());
                                psUser.setBoolean(3, user.getIsAdmin());
                                psUser.setInt(4, maKh);

                                int affectedRowsUser = psUser.executeUpdate();

                                if (affectedRowsUser > 0) {
                                    conn.commit();
                                    return true;
                                }
                            }
                        }
                    }
                }

                conn.rollback();
            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public User loginUser(String username, String password) throws Exception {
        String query = "SELECT * FROM [user] WHERE username = ? AND [password] = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int idUser = rs.getInt("id_user");
                    boolean isAdmin = rs.getBoolean("is_admin");
                    int maKh = rs.getInt("ma_kh");

                    return new User(idUser, username, password, isAdmin, maKh);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    // ================= XỬ LÍ HOÁ ĐƠN VÀ CHI TIẾT HOÁ ĐƠN======================
    // Phương thức thêm hoá đơn vào cơ sở dữ liệu
    public boolean addHoaDon(HoaDon hoaDon, List<ChiTietHoaDon> chiTietList) throws Exception {
        String insertHoaDonQuery = "INSERT INTO hoa_don (ma_kh, ngay_dat, tong_tien) VALUES (?, ?, ?)";
        String insertChiTietQuery = "INSERT INTO chi_tiet_hoa_don (ma_hd, ma_sp, so_luong, gia) VALUES (?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement psHoaDon = null;
        PreparedStatement psChiTiet = null;
        ResultSet generatedKeys = null;
        
        try {
            conn = new DBContext().getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction
            
            // Thêm hoá đơn
            psHoaDon = conn.prepareStatement(insertHoaDonQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            psHoaDon.setInt(1, hoaDon.getMaKhachHang());
            psHoaDon.setDate(2, new Date(hoaDon.getNgayDat().getTime()));
            psHoaDon.setDouble(3, hoaDon.getTongTien());
            psHoaDon.executeUpdate();

            // Lấy mã hoá đơn vừa thêm vào cơ sở dữ liệu
            generatedKeys = psHoaDon.getGeneratedKeys();
            int maHoaDon;
            if (generatedKeys.next()) {
                maHoaDon = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating hoa don failed, no ID obtained.");
            }

            // Thêm chi tiết hoá đơn
            psChiTiet = conn.prepareStatement(insertChiTietQuery);
            for (ChiTietHoaDon chiTiet : chiTietList) {
                psChiTiet.setInt(1, maHoaDon);
                psChiTiet.setInt(2, chiTiet.getMaSanPham());
                psChiTiet.setInt(3, chiTiet.getSoLuong());
                psChiTiet.setDouble(4, chiTiet.getGia());
                psChiTiet.addBatch();
            }
            psChiTiet.executeBatch();

            conn.commit(); // Kết thúc transaction thành công
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            // Xảy ra lỗi, rollback transaction
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            // Đóng tất cả các resource
            if (generatedKeys != null) {
                try {
                    generatedKeys.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (psChiTiet != null) {
                try {
                    psChiTiet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (psHoaDon != null) {
                try {
                    psHoaDon.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public List<Product> searchProductsByName(String keyword) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM san_pham WHERE ten_sp LIKE ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, "%" + keyword + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int maSP = rs.getInt("ma_sp");
                    String tenSP = rs.getString("ten_sp");
                    String moTa = rs.getString("mo_ta");
                    double donGia = rs.getDouble("gia");
                    String hinh = rs.getString("hinh");
                    String maLoai = rs.getString("ma_loai");

                    Product product = new Product(maSP, tenSP, moTa, donGia, hinh, maLoai);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    
    
    public boolean addProduct(Product product) throws Exception {
    String query = "INSERT INTO san_pham (ten_sp, mo_ta, gia, hinh, ma_loai) VALUES (?, ?, ?, ?, ?)";

    try (Connection conn = getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        ps.setString(1, product.getTenSP());
        ps.setString(2, product.getMoTa());
        ps.setDouble(3, product.getDonGia());
        ps.setString(4, product.getHinh());
        ps.setString(5, product.getMaLoai());

        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

    
    
    public static void main(String[] args) {
//        // Test Danh sách sản phẩm
//        DAO dao = new DAO();
//        
//        // Kiểm tra phương thức getTotalProducts
//        int totalProducts = dao.getTotalProducts();
//        System.out.println("Total Products: " + totalProducts);
//        
//        // Đặt thông số cho phân trang
//        int page = 1;
//        int pageSize = 10;
//
//        // Kiểm tra phương thức getProductsByPage
//        List<Product> products = dao.getProductsByPage(page, pageSize);
//        System.out.println("Products on page " + page + ":");
//        for (Product product : products) {
//            System.out.println(product);
//        }
//
//        // Kiểm tra nhiều trang
//        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
//        for (int i = 1; i <= totalPages; i++) {
//            products = dao.getProductsByPage(i, pageSize);
//            System.out.println("Products on page " + i + ":");
//            for (Product product : products) {
//                System.out.println(product);
//            }
//        }
    }
}
