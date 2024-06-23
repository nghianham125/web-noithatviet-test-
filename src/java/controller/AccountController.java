/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.KhachHang;
import model.User;

/**
 *
 * @author NGHIA
 */
@WebServlet(name = "AccountController", urlPatterns = {"/acc"})
public class AccountController extends HttpServlet {

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
            out.println("<title>Servlet AccountController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
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
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        String action = request.getParameter("action");
//
//        if (action != null && action.equals("login")) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        } else {
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "login":
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;
                case "register":
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                    break;
                case "logout":
                    // Xử lý đăng xuất
                    request.getSession().invalidate();
                    response.sendRedirect("home");
                    break;
                default:
                    response.sendRedirect("home");
                    break;
            }
        } else {
            response.sendRedirect("home");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");

        if (action != null && action.equals("register")) {
            String tenKh = request.getParameter("tenKh");
            String email = request.getParameter("email");
            String diaChi = request.getParameter("diaChi");
            String sdt = request.getParameter("sdt");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            KhachHang khachHang = new KhachHang(0, tenKh, email, diaChi, sdt);
            User user = new User(0, username, password, false, 0);

            DAO dao = new DAO();
            try {
                if (dao.registerUser(khachHang, user)) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("register.jsp?error=1");
                }
            } catch (Exception ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("register.jsp?error=1");
            }
        } else if (action != null && action.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            DAO dao = new DAO();
            User user = null;
            try {
                user = dao.loginUser(username, password);
            } catch (Exception ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("login.jsp?error=1");
            }

            if (user != null) {
//                request.getSession().setAttribute("user", user);
//                response.sendRedirect("home");
                if (user.getIsAdmin()) { // Kiểm tra nếu người dùng là admin
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("mn_product");
                } else {
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("home");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
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
