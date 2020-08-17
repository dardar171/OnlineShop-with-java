package com.code2.onlineDemo.config;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages="com.code2.onlineDemo")
@PropertySource("classpath:persistence-mysql.properties")
public class DemoConfig implements WebMvcConfigurer{

	@Autowired
	private Environment env;
	
	@Bean
	public ViewResolver viewResolver() {
		
		InternalResourceViewResolver resolver= new InternalResourceViewResolver();
		
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}
	
	
	//1..datasource
	@Bean
	public DataSource securityDataSource() {
		//connection pool
		ComboPooledDataSource dataSource=new ComboPooledDataSource();
		
		
		//driver class
		
		try {
			dataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//set jdbc connection props
		dataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		dataSource.setUser(env.getProperty("jdbc.user"));
		dataSource.setPassword(env.getProperty("jdbc.password"));
		
		//set Connection pool properties
		
		dataSource.setInitialPoolSize(Integer.parseInt(env.getProperty("connection.pool.initialPoolSize")));
		dataSource.setMinPoolSize(Integer.parseInt(env.getProperty("connection.pool.minPoolSize")));
		dataSource.setMaxPoolSize(Integer.parseInt(env.getProperty("connection.pool.maxPoolSize")));
		dataSource.setMaxIdleTime(Integer.parseInt(env.getProperty("connection.pool.maxIdleTime")));
		
		return dataSource;
	}
	
	
	//2..properties
	private Properties getHibernateProperties() {
		
		Properties props = new Properties();
		
		props.setProperty("hibernate.dialect",env.getProperty("hibernate.dialect"));
		props.setProperty("hibernate.show_sql",env.getProperty("hibernate.show_sql"));
		
		return props;
	}
	
	//3..sessionFactory
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactoryBean=new LocalSessionFactoryBean();
		
		
		sessionFactoryBean.setDataSource(securityDataSource());
		sessionFactoryBean.setHibernateProperties(getHibernateProperties());
		sessionFactoryBean.setPackagesToScan(env.getProperty("hibernate.packagesToScan"));
		
		
		return sessionFactoryBean;
	
	}
	
	//4..Hibernate transation manager
	
	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory)
	{
		HibernateTransactionManager transactionManager= new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory);
		
		return transactionManager;
		
	}
	
	@Bean 
	public MultipartResolver multipartResolver() throws IOException {
		
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		
		resolver.setMaxUploadSizePerFile(5242880);//5Mb
		
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/resources/**")
		.addResourceLocations("/resources/");
	}
	
	
}
