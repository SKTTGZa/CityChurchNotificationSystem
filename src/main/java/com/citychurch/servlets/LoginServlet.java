package com.citychurch.servlets;

import com.citychurch.models.User;
import com.citychurch.store.UserDataStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = UserDataStore.users.get(username);

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());

            response.sendRedirect("home.jsp");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html><html><head><title>Login Failed</title>");
            out.println("<link href='https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap' rel='stylesheet'>");
            out.println("<style>body{background-color:#211A1D;color:#fff;font-family:'Inter',sans-serif;display:flex;justify-content:center;align-items:center;height:100vh;margin:0;}");
            out.println(".card{background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.1);padding:40px;border-radius:16px;text-align:center;width:350px;}");
            out.println("h3{color:#ff4d4d;margin-top:0;}a{color:#8075FF;text-decoration:none;display:inline-block;margin-top:16px;}</style></head>");
            out.println("<body><div class='card'><h3>Invalid Credentials</h3><p>Please check your username or password.</p>");
            out.println("<a href='login.jsp'>&larr; Try Again</a></div></body></html>");
        }
    }
}