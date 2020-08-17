package com.code2.onlineDemo.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Order;
import com.code2.onlineDemo.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	@RequestMapping("/orderProduct")
	public String orderProduct(Principal principal, HttpSession session) {

		List<Cart> item = (List<Cart>) session.getAttribute("cart");
		System.out.println(principal.getName());

		Order order = new Order(principal.getName());

		orderService.addProduct(order, item);
		
		session.setAttribute("cart", null);
		
		return "order-confirmation";
	}
	
	@GetMapping("/listOrder")
	public String orderList(Model model) {
		
		List<Order>orders = orderService.getOrderList();
		
		model.addAttribute("orders",orders);
		return "order-list";
	}
	
	@GetMapping("/deliveryOrder")
	public String deliveryOrder(@RequestParam("orderId")int id) {
		
		 orderService.deliveryOrder(id);

		return "redirect:listOrder";
	}

	
}
