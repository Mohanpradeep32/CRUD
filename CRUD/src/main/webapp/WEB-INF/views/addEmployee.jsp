<%@ page language="java" import="java.util.*, com.example.models.Employee" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management</title>
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
    .form-container {
        margin-top: 30px;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Employees</h1>
    
    <%
        // Retrieve the list of employees from the request attribute
        List<Employee> employees = (List<Employee>) request.getAttribute("employees");
    %>
    
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
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    <% } else { %>
        <p class="alert alert-info">No employees found</p>
    <% } %>

    <div class="form-container">
        <h2>Add New Employee</h2>
        <form action="addEmployee" method="post">
            <div class="form-group">
                <label for="eno">Emp No:</label>
                <input type="number" class="form-control" id="eno" name="eno" required>
            </div>
            <div class="form-group">
                <label for="ename">Name:</label>
                <input type="text" class="form-control" id="ename" name="ename" required>
            </div>
            <div class="form-group">
                <label for="job">Job:</label>
                <input type="text" class="form-control" id="job" name="job" required>
            </div>
            <div class="form-group">
                <label for="salary">Salary:</label>
                <input type="number" class="form-control" id="salary" name="salary" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="deptno">Department No:</label>
                <input type="number" class="form-control" id="deptno" name="deptno" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>
    </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
