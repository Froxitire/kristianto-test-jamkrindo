<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="css/login.css">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    .error {
      color: red;
    }
  </style>
</head>
<body>
<h2>Login to the Enigma Management System</h2>

<form id="loginForm" action="login" method="POST">
  <label for="userId">User ID:</label>
  <input type="text" id="userId" name="userId" required><br><br>

  <label for="password">Password:</label>
  <input type="password" id="password" name="password" required><br><br>

  <button type="submit">Login</button>
</form>

<p class="error" id="errorMessage"></p>

<script>
  $(document).ready(function () {
    $("#loginForm").submit(function (event) {
      $("#errorMessage").text("");

      var userId = $("#userId").val();
      var password = $("#password").val();

      if (userId === "") {
        $("#errorMessage").text("User ID is required.");
        event.preventDefault();
        return false;
      }

      if (password === "") {
        $("#errorMessage").text("Password is required.");
        event.preventDefault();
        return false;
      }
    });

    <% String errorMessage = (String) request.getAttribute("error"); %>
    <% if (errorMessage != null) { %>
    $("#errorMessage").text("<%= errorMessage %>");
    <% } %>
  });
</script>
</body>
</html>
