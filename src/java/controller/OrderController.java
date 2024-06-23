/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.User;

/**
 *
 * @author NGHIA
 */
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

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
            out.println("<title>Servlet OrderController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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
        // Chuyển hướng đến trang xác nhận hoặc trang tóm tắt đơn hàng
        request.getRequestDispatcher("order.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null || cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp?error=1");
            return;
        }

        int maKhachHang = user.getMaKh();
        Date ngayDat = new Date(System.currentTimeMillis());
        double tongTien = cart.getItems().stream().mapToDouble(item -> item.getProduct().getDonGia() * item.getQuantity()).sum();

        HoaDon hoaDon = new HoaDon(0, maKhachHang, ngayDat, tongTien);
        List<ChiTietHoaDon> chiTietList = new ArrayList<>();
        for (CartItem item : cart.getItems()) {
            ChiTietHoaDon chiTiet = new ChiTietHoaDon(0, hoaDon.getMaHoaDon(), item.getProduct().getMaSP(), item.getQuantity(), item.getProduct().getDonGia());
            chiTietList.add(chiTiet);
        }

        DAO dao = new DAO();
        try {
            if (dao.addHoaDon(hoaDon, chiTietList)) {
                session.removeAttribute("cart"); // Xóa giỏ hàng sau khi đặt hàng thành công
                response.sendRedirect("orderSuccess.jsp"); // Chuyển hướng đến trang thành công
            } else {
                response.sendRedirect("cart?error=1"); // Chuyển hướng đến trang lỗi
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart?error=1"); // Chuyển hướng đến trang lỗi
        }
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
