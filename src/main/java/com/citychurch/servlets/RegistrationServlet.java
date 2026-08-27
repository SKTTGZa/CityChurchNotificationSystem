package com.citychurch.servlets;

import com.citychurch.models.User;
import com.citychurch.store.UserDataStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (role == null || role.trim().isEmpty()) {
            role = "MEMBER";
        } else {
            role = role.toUpperCase();
        }

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Error: Username and password cannot be empty.");
            return;
        }

        if (UserDataStore.users.containsKey(username)) {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            response.getWriter().write("Error: Username already exists.");
            return;
        }

        User newUser = new User(username, password, role);
        UserDataStore.users.put(username, newUser);

        response.sendRedirect("login.jsp");
    }
}