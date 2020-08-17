package com.code2.onlineDemo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Product;
import com.code2.onlineDemo.service.ProductService;

@Controller
public class DemoController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/")
	public String showHome(Model model,HttpSession session) {
	
		List<Product> products = productService.getProducts();
		
		if(session.getAttribute("cart")==null) {
			model.addAttribute("cartSize",0);
		}
		else {
			List<Cart> cart = (List<Cart>)session.getAttribute("cart");
			int quantity=0;
			for(Cart item : cart) {
				quantity += item.getQuantity();
			}
			model.addAttribute("cartSize",quantity);
		}
		
		model.addAttribute("products",products);
		
		return "index";
	}
	
	

}
