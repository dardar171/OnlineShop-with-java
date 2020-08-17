package com.code2.onlineDemo.service;

import java.util.List;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Order;
import com.code2.onlineDemo.product.OrderItems;

public interface OrderService {

	public void addProduct(Order order,List<Cart>orderItems);


	public List<Order>getOrderList();
	
	public void deliveryOrder(int id);
}
