<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Enigma Management System</title>
</head>
<body>
<h2>Welcome to enigma university</h2>
<p>If you are not redirected automatically, <a href="login.jsp">click here to login</a>.</p>

<%
  HttpSession sessionUser = request.getSession(false);
  if (sessionUser != null && sessionUser.getAttribute("userID") != null) {
    response.sendRedirect("welcome");
  } else {
    response.sendRedirect("login.jsp");
  }
%>
</body>
</html>
