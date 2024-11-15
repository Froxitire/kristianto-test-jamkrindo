<%@ page import="com.enigma.testplacement.WelcomeServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Welcome Page</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/welcome.css">
  <style>

  </style>
  <script>
    function showStudentDetails(studentId, studentName, department, marks) {
      // Populate modal content
      $("#modalStudentId").text(studentId);
      $("#modalStudentName").text(studentName);
      $("#modalDepartment").text(department);
      $("#modalMarks").text(marks);

      // Show modal
      $("#studentModal").css("display", "block");
    }

    $(document).ready(function(){

      $(".close").click(function(){
        $("#studentModal").css("display", "none");
      });

      $(window).click(function(event){
        if (event.target == $("#studentModal")[0]) {
          $("#studentModal").css("display", "none");
        }
      });
    });
  </script>
</head>
<body>
<h1>Welcome, ${sessionScope.userID}</h1>

<table border="1">
  <tr>
    <th>Department</th>
    <th>Student ID</th>
    <th>Marks</th>
    <th>Pass %</th>
  </tr>

  <%
    Map<String, List<WelcomeServlet.Student>> departmentMap = (Map<String, List<WelcomeServlet.Student>>) request.getAttribute("departmentMap");
    Map<String, Double> passPercentages = (Map<String, Double>) request.getAttribute("passPercentages");

    for (Map.Entry<String, List<WelcomeServlet.Student>> entry : departmentMap.entrySet()) {
      String department = entry.getKey();
      List<WelcomeServlet.Student> students = entry.getValue();
      Double passPercentage = passPercentages.get(department);
      boolean firstRow = true;

      for (WelcomeServlet.Student student : students) {
  %>
  <tr>
    <% if (firstRow) { %>
    <td rowspan="<%= students.size() %>"><%= department %></td>
    <% } %>
    <td>
      <a href="#" onclick="showStudentDetails('<%= student.studentId %>', '<%= student.studentName %>', '<%= student.department %>', '<%= student.marks %>')">
        <%= student.studentId %>
      </a>
    </td>
    <td><%= student.marks %></td>
    <% if (firstRow) { %>
    <td rowspan="<%= students.size() %>"><%= String.format("%.2f", passPercentage) %>%</td>
    <% } %>
  </tr>
  <%
        firstRow = false;
      }
    }
  %>
</table>

<div id="studentModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Student Details</h2>
    <p><strong>Student ID:</strong> <span id="modalStudentId"></span></p>
    <p><strong>Name:</strong> <span id="modalStudentName"></span></p>
    <p><strong>Department:</strong> <span id="modalDepartment"></span></p>
    <p><strong>Marks:</strong> <span id="modalMarks"></span></p>
  </div>
</div>

</body>
</html>
