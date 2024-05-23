<%@ page language="java" import="java.util.*, com.example.models.Employee" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        h1 {
            margin-bottom: 20px;
        }
        table {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%
    // Retrieve the list of employees from the request attribute
    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
%>

<div class="container">
    <h1>Delete Employee</h1>

    <% if (employees != null && !employees.isEmpty()) { %>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Emp No</th>
                        <th>Name</th>
                        <th>Salary</th>
                        <th>Job</th>
                        <th>Department</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Employee employee : employees) { %>
                        <tr>
                            <td><%= employee.getEno() %></td>
                            <td><%= employee.getEname() %></td>
                            <td><%= employee.getSalary() %></td>
                            <td><%= employee.getJob() %></td>
                            <td><%= employee.getDeptno() %></td>
                            <td>
                                <form action="deleteEmployeee" >
                                    <input type="hidden" name="empno" value="<%= employee.getEno() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete employee <%= employee.getEno() %>?')">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    <% } else { %>
        <p class="alert alert-info">No employees found</p>
    <% } %>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
