/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author NGHIA
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DAO productDAO;

    public void init() {
        productDAO = new DAO();
    }

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            // Xử lý yêu cầu chi tiết sản phẩm
            int productId = Integer.parseInt(idParam);
            Product product = productDAO.getProductById(productId);
            if (product != null) {
                request.setAttribute("product", product);
                RequestDispatcher dispatcher = request.getRequestDispatcher("detailpage.jsp");
                dispatcher.forward(request, response);
                return;
            } else {
                response.sendRedirect("error.jsp");  // Redirect to an error page if the product is not found
                return;
            }
        }
        
        // Hiển thị danh mục sản phẩm
        List<Category> categoryList = productDAO.getAllCategories();
        request.setAttribute("categoryList", categoryList);

        int page = 1;
        int pageSize = 6;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String categoryIdParam = request.getParameter("categoryId");
        Integer categoryId = null;
        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
            categoryId = Integer.parseInt(categoryIdParam);
        }
        
        String searchKeyword = request.getParameter("search");
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            // Xử lý yêu cầu tìm kiếm sản phẩm
            List<Product> productList = productDAO.searchProductsByName(searchKeyword);
            int totalProducts = productList.size();
            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

            // Tính index bắt đầu và kết thúc của sản phẩm trên trang hiện tại
            int startIndex = (page - 1) * pageSize;
            int endIndex = Math.min(startIndex + pageSize, totalProducts);

            // Lấy danh sách sản phẩm trên trang hiện tại
            List<Product> currentPageProducts = productList.subList(startIndex, endIndex);

            request.setAttribute("productList", currentPageProducts);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("searchKeyword", searchKeyword);
        }

        else if (categoryId != null) {
            List<Product> productList = productDAO.getProductsByCategory(categoryId);

            int totalProducts = productList.size();
            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

            int startIndex = (page - 1) * pageSize;
            int endIndex = Math.min(startIndex + pageSize, totalProducts);

            List<Product> currentPageProducts = productList.subList(startIndex, endIndex);

            request.setAttribute("productList", currentPageProducts);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("categoryId", categoryId);
        } else {
            List<Product> productList = productDAO.getProductsByPage(page, pageSize);
            int totalProducts = productDAO.getTotalProducts();
            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

            request.setAttribute("productList", productList);
            request.setAttribute("totalPages", totalPages);
        }

        request.setAttribute("currentPage", page);

        // Chuyển tiếp yêu cầu tới trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("layout_products.jsp");
        dispatcher.forward(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
