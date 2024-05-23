<%@ page language="java" import="java.util.*,com.example.models.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employees</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Add your custom CSS styles here */
        /* Example: */
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Employees</h1>
        <table class="table table-bordered mt-4">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Salary</th>
                    <th>Job</th>
                    <th>Department</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                    if (employees != null && !employees.isEmpty()) {
                        for (Employee employee : employees) {
                %>
                            <tr>
                                <td><%= employee.getEno() %></td>
                                <td><%= employee.getEname() %></td>
                                <td><%= employee.getSalary() %></td>
                                <td><%= employee.getJob() %></td>
                                <td><%= employee.getDeptno() %></td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="5">No employees found</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="mt-4">
            <a href="addEmployee" class="btn btn-primary mr-2">Add Employee</a>
            <a href="deleteEmployee" class="btn btn-danger mr-2">Delete Employee</a>
            <a href="updateEmployee" class="btn btn-success">Update Employee</a>
        </div>
    </div>
    <!-- Bootstrap JS (Optional, if you need JavaScript functionality) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
