/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;

/**
 *
 * @author NGHIA
 */
@WebServlet(name = "ManageProduct", urlPatterns = {"/mn_product"})
public class ManageProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        
        // Lấy action từ request để điều hướng xử lý
        String action = request.getParameter("action");
        
        if (action == null) {
            // Mặc định hiển thị tất cả sản phẩm
            displayAllProducts(request, response);
        } else {
            switch (action) {
                case "add":
                    if ("GET".equalsIgnoreCase(request.getMethod())) {
                        addProductForm(request, response);
                    } else if ("POST".equalsIgnoreCase(request.getMethod())) {
                        addProduct(request, response);
                    }
                    break;
                case "edit":
                    editProductForm(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    displayAllProducts(request, response);
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    // Phương thức hiển thị tất cả sản phẩm
    private void displayAllProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Gọi phương thức từ DAO để lấy danh sách sản phẩm
        DAO dao = new DAO();
        List<Product> products = dao.getProductsByPage(1, Integer.MAX_VALUE); // Lấy tất cả sản phẩm
        
        // Đưa danh sách sản phẩm vào request attribute để đổ lên giao diện
        request.setAttribute("products", products);
        
        // Forward request đến giao diện admin.jsp
        request.getRequestDispatcher("/ad_product.jsp").forward(request, response);
    }
    
    // Phương thức hiển thị form thêm sản phẩm
    private void addProductForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO: Hiển thị form thêm sản phẩm
        request.getRequestDispatcher("/ad_addproduct.jsp").forward(request, response);
    }
    
    // Phương thức hiển thị form chỉnh sửa sản phẩm
    private void editProductForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("id");
        DAO dao = new DAO();
        Product product = dao.getProductById(Integer.parseInt(productId));
        request.setAttribute("product", product);
        request.getRequestDispatcher("/ad_editproduct.jsp").forward(request, response);
    }
    
    // Phương thức xử lý xoá sản phẩm
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("id");
        DAO dao = new DAO();
//        dao.deleteProduct(Integer.parseInt(productId));
        response.sendRedirect("mn_product?action=list");
    }
    
    private void addProduct(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, Exception {
        // Lấy dữ liệu từ form
        String tenSP = request.getParameter("tenSP");
        String moTa = request.getParameter("moTa");
        double donGia = Double.parseDouble(request.getParameter("donGia"));
        Part filePart = request.getPart("hinh");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String hinh = fileName;
        String maLoai = request.getParameter("maLoai");

        // Lưu file ảnh vào thư mục
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        filePart.write(uploadPath + File.separator + fileName);

        // Tạo đối tượng sản phẩm mới
        Product product = new Product(0, tenSP, moTa, donGia, hinh, maLoai);

        // Gọi phương thức từ DAO để thêm sản phẩm
        DAO dao = new DAO();
        boolean success = dao.addProduct(product);

        if (success) {
            response.sendRedirect("mn_product?action=list");
        } else {
            request.setAttribute("error", "Có lỗi xảy ra khi thêm sản phẩm.");
            request.getRequestDispatcher("/ad_addproduct.jsp").forward(request, response);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
