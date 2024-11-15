package com.enigma.testplacement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class WelcomeServlet extends HttpServlet {

    public static class Student {
        public String studentId;
        public String studentName;
        public String department;
        public int marks;

        public Student(String studentId, String studentName, String department, int marks) {
            this.studentId = studentId;
            this.studentName = studentName;
            this.department = department;
            this.marks = marks;
        }

        public boolean isPassed() {
            return marks >= 40;
        }

        public static double calculatePassPercentage(List<Student> students) {
            long passedCount = students.stream().filter(Student::isPassed).count();
            return (double) passedCount / students.size() * 100;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Student> students = new ArrayList<>();
        students.add(new Student("S1", "Alice", "Dep 1", 35));
        students.add(new Student("S2", "Bob", "Dep 1", 70));
        students.add(new Student("S3", "Charlie", "Dep 1", 60));
        students.add(new Student("S4", "David", "Dep 1", 90));
        students.add(new Student("S5", "Eve", "Dep 2", 30));
        students.add(new Student("S6", "Frank", "Dep 3", 32));
        students.add(new Student("S7", "Grace", "Dep 3", 70));
        students.add(new Student("S8", "Hank", "Dep 3", 20));

        Map<String, List<Student>> departmentMap = new HashMap<>();
        for (Student student : students) {
            departmentMap.computeIfAbsent(student.department, k -> new ArrayList<>()).add(student);
        }

        Map<String, Double> passPercentages = new HashMap<>();
        for (String department : departmentMap.keySet()) {
            List<Student> deptStudents = departmentMap.get(department);
            passPercentages.put(department, Student.calculatePassPercentage(deptStudents));
        }

        request.setAttribute("students", students);
        request.setAttribute("departmentMap", departmentMap);
        request.setAttribute("passPercentages", passPercentages);
        request.getRequestDispatcher("/welcome.jsp").forward(request, response);

    }
}
