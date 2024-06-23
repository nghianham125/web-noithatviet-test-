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
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
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
            out.println("<title>Servlet HomeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
//        List<Product> productList = productDAO.getAllProducts();
//        request.setAttribute("productList", productList);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
//        dispatcher.forward(request, response);

        // Hiển thị chi tiết sản phẩm
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

        // Hiển thị danh sách sản phẩm
        int page = 1;
        int pageSize = 8;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        DAO productDAO = new DAO();
        List<Product> productList = productDAO.getProductsByPage(page, pageSize);
        int totalProducts = productDAO.getTotalProducts();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        // Hiển thị danh mục sản phẩm
        List<Category> categoryList = productDAO.getAllCategories();
        
        request.setAttribute("categoryList", categoryList); // Đặt danh sách danh mục vào request
        request.setAttribute("productList", productList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);


        RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
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
