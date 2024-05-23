<%@ page language="java" import="com.example.models.Employee" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employee</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body {
        padding: 20px;
    }
    h1 {
        margin-bottom: 20px;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Edit Employee</h1>

    <%
        // Retrieve the employee from the request attribute
        Employee employee = (Employee) request.getAttribute("employee");
    %>

    <form action="updateEmployee" method="post">
        <div class="form-group">
            <label for="eno">Emp No:</label>
            <input type="number" class="form-control" id="eno" name="eno" value="<%= employee.getEno() %>" readonly>
        </div>
        <div class="form-group">
            <label for="ename">Name:</label>
            <input type="text" class="form-control" id="ename" name="ename" value="<%= employee.getEname() %>" required>
        </div>
        <div class="form-group">
            <label for="job">Job:</label>
            <input type="text" class="form-control" id="job" name="job" value="<%= employee.getJob() %>" required>
        </div>
        <div class="form-group">
            <label for="salary">Salary:</label>
            <input type="number" class="form-control" id="salary" name="salary" value="<%= employee.getSalary() %>" step="0.01" required>
        </div>
        <div class="form-group">
            <label for="deptno">Department No:</label>
            <input type="number" class="form-control" id="deptno" name="deptno" value="<%= employee.getDeptno() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="employees" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
