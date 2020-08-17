package com.code2.onlineDemo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;

@Configurable
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private DataSource securityDataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
		//.anyRequest().authenticated()
		
		//.antMatchers("/product/**").hasRole("ADMIN")
		//.antMatchers("/product/detail/**").hasRole("CUSTOMER")
		.antMatchers("/order/orderProduct").hasRole("CUSTOMER")
		.antMatchers("/order/**").hasRole("ADMIN")
		.and()
			.formLogin()
			.loginPage("/showLoginForm")
			.loginProcessingUrl("/authenticateUser")
			.permitAll()
		.and()
			.logout()
			.permitAll()
		.and()
			.exceptionHandling().accessDeniedPage("/home");
			
		
	}
	
		@Bean
		public UserDetailsManager userDetailsManager() {
			
			JdbcUserDetailsManager detailsManager= new JdbcUserDetailsManager();
			detailsManager.setDataSource(securityDataSource);
			
			return detailsManager;
		}
	
}
