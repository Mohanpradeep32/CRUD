package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.EmpDAOImpl;
import com.example.models.Employee;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.websocket.server.PathParam;

@Controller 
  
public class EmployeeController {
	@Autowired
    private EmpDAOImpl employeeDAO;

	@GetMapping("/employees")
    public String viewEmployees(HttpServletRequest request) {
        List<Employee> employees = employeeDAO.getAllEmployees();
        request.setAttribute("employees", employees);
        return "employees";
    }

    @GetMapping("/addEmployee")
    public String addEmployees(HttpServletRequest request) {
        List<Employee> employees = employeeDAO.getAllEmployees();
        request.setAttribute("employees", employees);
        return "addEmployee";
    }
    
    @GetMapping("/deleteEmployee")
    public String disEmployees(HttpServletRequest request) {
        List<Employee> employees = employeeDAO.getAllEmployees();
        request.setAttribute("employees", employees);
        return "deleteEmployee";
    }
    
    @GetMapping("/deleteEmployeee")
    public String deleteEmployees(HttpServletRequest request ) {
    	 
        int empno = Integer.parseInt(request.getParameter("empno"));
        System.out.println(empno);
        
        
        try {
            boolean deleted = employeeDAO.deleteEmployee(empno);
            if (deleted) {
                
                List<Employee> employees = employeeDAO.getAllEmployees();
                request.setAttribute("employees", employees);
                
                return "deleteEmployee";
            } else {
                 
                return "home";  
            }
        } catch(Exception e) {
            
            return "home"; 
        }
    }
 
    @GetMapping("/editEmployee")
    public String editEmployee(HttpServletRequest request, Model model) {
    	
    	int empno = Integer.parseInt(request.getParameter("empno"));
    	 System.out.println(empno);
    	
        Employee employee = employeeDAO.getEmployeeByNo(empno);
        model.addAttribute("employee", employee);
        return "editEmployee";
    }
 
    
    @GetMapping("/updateEmployee")
    public String updateEmployees(HttpServletRequest request) {
    	List<Employee> employees = employeeDAO.getAllEmployees();
        request.setAttribute("employees", employees);
    	return "updateEmployee";
    }
    

    @PostMapping("/addEmployee")
    public String addEmployee(@ModelAttribute("employee") Employee employee) {
        employeeDAO.createEmployee(employee);
        return "redirect:/employees";
    }
    
    @PostMapping("/updateEmployee")
    public String updateEmployee(@ModelAttribute("employee") Employee employee) {
        employeeDAO.updateEmployee(employee);
        return "redirect:/employees";
    }

}
