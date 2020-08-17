package com.code2.onlineDemo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.CartItem;
import com.code2.onlineDemo.product.Product;
import com.code2.onlineDemo.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("contact")
	public String contact() {
		
		
		return "contact";
		
	}
	
	@RequestMapping("/detail")
	public String detailProduct(@RequestParam("productId")int id,Model model){
		
		Product theProduct = productService.getProduct(id);
		model.addAttribute("product",theProduct);
		
		return "detail-form";
		
	}
	
	
	@GetMapping("/detail/")
	public String CartProduct(@RequestParam("productId")int id,HttpSession session,Model model){
		Product theProduct = productService.getProduct(id);
		model.addAttribute("product",theProduct);
		
		if(session.getAttribute("cart")==null) {
			List<Cart> cart = new ArrayList<>();
			cart.add(new Cart(id,1));
			session.setAttribute("cart", cart);
		}else {
			List<Cart> cart = (List<Cart>)session.getAttribute("cart");
			
			int index = isExist(id,cart);
			
			if(index == -1) {
				cart.add(new Cart(id,1));
			}
			else {
				int quantity = cart.get(index).getQuantity();
				cart.get(index).setQuantity(quantity+1);
			}
			session.setAttribute("cart",cart);
		}
		
		return "redirect:/";
	}

	private int isExist(int id, List<Cart> cart ) {
		
		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getProductId()==id) {
				return i;
			}
		}
		return -1;
	}
	
	@GetMapping("/list")
	public String Vocher(Model model,HttpSession session) {
		
		List<Cart> carts = (List<Cart>)session.getAttribute("cart");
		
		List<CartItem> cart = new ArrayList<>();
		
		if(carts != null) {
			for(Cart item: carts) {
				Product product = productService.getProduct(item.getProductId());
				cart.add(new CartItem(product, item.getQuantity()));
			}
		}
		
		model.addAttribute("cartItems",cart);
		
		return "vocher-form";
	}
	

	
}
