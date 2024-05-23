package com.example.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.models.Employee;

public class EmployeeMapper implements RowMapper<Employee> {

	public Employee mapRow(ResultSet resultSet, int i) throws SQLException {

		Employee emp = new Employee();
		emp.setEno(resultSet.getInt("empno"));
		emp.setEname(resultSet.getString("ename"));
		emp.setJob(resultSet.getString("job"));
		emp.setSalary(resultSet.getDouble("sal"));
		emp.setDeptno(resultSet.getInt("deptno"));
		return emp;
	}
}
