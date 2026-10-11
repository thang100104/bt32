package com.codegym.controller;

import com.codegym.dao.UserDAO;
import com.codegym.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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

        try {
            switch (action) {
                case "test-use-tran":
                    testUseTran(request, response);
                    break;
                case "test-add-user-tran":
                    testAddUserTransaction(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    showDeleteForm(request, response);
                    break;
                default:
                    listUsers(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "";

        try {
            switch (action) {
                case "edit":
                    updateUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/users");
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = userDAO.selectAllUsersUsingStoredProcedure();
        request.setAttribute("listUser", users);
        request.getRequestDispatcher("/user/list.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user", userDAO.selectUser(id));
        request.getRequestDispatcher("/user/edit.jsp").forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user", userDAO.selectUser(id));
        request.getRequestDispatcher("/user/delete.jsp").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        User user = new User(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("name"),
                request.getParameter("email"),
                request.getParameter("country")
        );

        userDAO.updateUserUsingStoredProcedure(user);
        response.sendRedirect(request.getContextPath() + "/users");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUserUsingStoredProcedure(id);
        response.sendRedirect(request.getContextPath() + "/users");
    }

    private void testUseTran(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        userDAO.insertUpdateUseTransaction();

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<h2>Đã chạy test Transaction Employee.</h2>");
        response.getWriter().println("<a href='" + request.getContextPath() + "/'>Quay lại</a>");
    }

    private void testAddUserTransaction(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        User testUser = new User(
                "User Transaction Test",
                "transaction-test@codegym.vn",
                "Viet Nam"
        );

        // ID 999 không tồn tại trong bảng permission.
        // Foreign key sẽ làm câu INSERT permission lỗi để kiểm chứng rollback.
        int[] permissionIds = {1, 999};

        try {
            userDAO.addUserTransaction(testUser, permissionIds);
            response.getWriter().println("<h2>Transaction đã commit.</h2>");
        } catch (SQLException e) {
            response.getWriter().println("<h2>Đã cố tình tạo lỗi SQL và Transaction đã rollback.</h2>");
            response.getWriter().println("<p>User thử nghiệm không được phép tồn tại trong bảng users.</p>");
        }

        response.getWriter().println("<p>Kiểm tra MySQL: SELECT * FROM users WHERE email='transaction-test@codegym.vn';</p>");
        response.getWriter().println("<a href='" + request.getContextPath() + "/'>Quay lại</a>");
    }
}