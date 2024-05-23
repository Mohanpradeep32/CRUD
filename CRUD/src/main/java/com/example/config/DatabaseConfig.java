package com.example.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan("com.example")
@PropertySource("classpath:db.properties")
public class DatabaseConfig {

	@Autowired
	Environment environment;
	
	private final String URL = "url";
	private final String USER = "dbUserName";
	private final String DRIVER = "driver";
	private final String PASSWORD = "password";

	@Bean
	DataSource dataSource() {
		String[] defaultProfiles = environment.getDefaultProfiles();
		for(String s : defaultProfiles) {
			System.out.println(s);
		}
		
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setUrl(environment.getProperty(URL));
		driverManagerDataSource.setUsername("plf_training_admin");
		driverManagerDataSource.setPassword(environment.getProperty(PASSWORD));
		driverManagerDataSource.setDriverClassName(environment.getProperty(DRIVER));
		System.out.println(environment.getProperty(USER));
		System.out.println(environment.getProperty(PASSWORD));
		
		return driverManagerDataSource;
	}
}

