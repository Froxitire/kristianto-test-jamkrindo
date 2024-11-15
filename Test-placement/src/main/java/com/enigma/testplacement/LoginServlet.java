package com.enigma.testplacement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        String correctUserId = "admin";
        String correctPassword = "password";

        if (userId.equals(correctUserId) && password.equals(correctPassword)) {
            HttpSession session = request.getSession();
            session.setAttribute("userID", userId);
            response.sendRedirect("welcome");
        } else {
            request.setAttribute("error", "Invalid User ID or Password!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
