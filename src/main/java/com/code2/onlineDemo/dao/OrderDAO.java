package com.code2.onlineDemo.dao;

import java.util.List;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Order;

public interface OrderDAO {
	
	public void addOrder(Order order,List<Cart>orderItems);

	public List<Order>getOrderList();

	public void deliveryOrder(int id);


}
