package com.code2.onlineDemo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code2.onlineDemo.dao.OrderDAO;
import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Order;

@Service
public class OrderServiceImp implements OrderService {

	@Autowired
	private OrderDAO orderDAO;


	@Override
	@Transactional
	public void addProduct(Order order, List<Cart> orderItems) {
		orderDAO.addOrder(order, orderItems);
		
	}


	@Override
	@Transactional
	public List<Order> getOrderList() {
	
		return orderDAO.getOrderList();
	}


	@Override
	@Transactional
	public void deliveryOrder(int id) {
	
		 orderDAO.deliveryOrder(id);
	}

}
