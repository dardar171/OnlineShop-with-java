package com.code2.onlineDemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.code2.onlineDemo.product.CrmUser;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Autowired
	private UserDetailsManager userDetailsManager;
	
	private PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
	
	@GetMapping("/showRegistrationForm")
	public String ShowRegistrationForm(Model model) {
		
		model.addAttribute("crmUser",new CrmUser());
		
		return "registration-form";
	}
	
	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(@ModelAttribute("crmUser")CrmUser crmUser) {
		
		System.out.println("UserName :"+crmUser.getUserName());
		System.out.println("Password :"+crmUser.getPassword());
		
		String encodedPassword = passwordEncoder.encode(crmUser.getPassword());
		
		String userName= crmUser.getUserName();
		String password= "{bcrypt}"+ encodedPassword;
		
		List<GrantedAuthority> authorities=AuthorityUtils.createAuthorityList("ROLE_CUSTOMER");
		
		User user= new User(userName,password,authorities);
		
		userDetailsManager.createUser(user);
		
		return "registration-confirmation";
		
	}
	
}
