package com.example.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.models.Employee;

@Repository
public class EmpDAOImpl implements EmpDAO{
	
	JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_EMPLOYEE = "select * from i197_employees where empno = ?";
	private final String SQL_DELETE_EMPLOYEE = "delete from i197_employees  where empno = ?";
	private final String SQL_UPDATE_EMPLOYEE = "update i197_employees  set ename = ?, job = ?, sal  = ?, deptno  = ? where empno = ?";
	private final String SQL_GET_ALL = "select * from i197_employees ";
	private final String SQL_INSERT_EMPLOYEE = "insert into i197_employees (empno, ename, job, sal,deptno) values(?,?,?,?,?)";

	@Autowired
	public EmpDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}


	public Employee getEmployeeByNo(Integer eno) {
		return jdbcTemplate.queryForObject(SQL_FIND_EMPLOYEE, new Object[] { eno }, new EmployeeMapper());
	}

	public List<Employee> getAllEmployees(){
		return jdbcTemplate.query(SQL_GET_ALL, new EmployeeMapper());
	}

	public boolean deleteEmployee(int id) {
		return jdbcTemplate.update(SQL_DELETE_EMPLOYEE, id) > 0;
	}

	public boolean updateEmployee(Employee e) {
		return jdbcTemplate.update(SQL_UPDATE_EMPLOYEE, e.getEname(), e.getJob(), e.getSalary(),e.getDeptno(),
				e.getEno()) > 0;
	}

	public boolean createEmployee(Employee e) {
		return jdbcTemplate.update(SQL_INSERT_EMPLOYEE, e.getEno(), e.getEname(), e.getJob(),
				e.getSalary(),e.getDeptno()) > 0;
	}


	@Override
	public boolean deleteEmployee(Employee e) {
		// TODO Auto-generated method stub
		return false;
	}
}