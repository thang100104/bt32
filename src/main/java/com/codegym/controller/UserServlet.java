package com.codegym.controller;

import com.codegym.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "test-use-tran":
                testUseTran(request, response);
                break;
            default:
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                break;
        }
    }

    private void testUseTran(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        userDAO.insertUpdateUseTransaction();
        System.out.println("Hoàn tất gọi hàm testUseTran!");

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<h2>Đã chạy test có sử dụng Transaction.</h2>");
        response.getWriter().println("<p>Hãy kiểm tra Console và chạy SELECT * FROM Employee; trong MySQL.</p>");
        response.getWriter().println("<a href='" + request.getContextPath() + "/'>Quay lại</a>");
    }
}