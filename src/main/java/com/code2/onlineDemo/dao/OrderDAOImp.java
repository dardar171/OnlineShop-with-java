package com.code2.onlineDemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Order;
import com.code2.onlineDemo.product.OrderItems;
import com.code2.onlineDemo.product.Product;

@Repository
public class OrderDAOImp implements OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * @Override public void addOrder(Order order,OrderItems orderItem) { Session
	 * session= sessionFactory.getCurrentSession();
	 * 
	 * OrderItems orderItems = new OrderItems(1,2,2,1);
	 * 
	 * Order orders=session.get(Order.class, order.getId()); orders.add(orderItems);
	 * 
	 * session.save(order); }
	 */


	@Override
	public void addOrder(Order order, List<Cart>orderItems) {

		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(order);

		for (Cart items : orderItems) {

			Product product = session.get(Product.class,items.getProductId());
			OrderItems orderItem = new OrderItems(items.getQuantity());
			orderItem.setProduct(product);
			orderItem.setOrder(order);
			session.saveOrUpdate(orderItem);

		}
		
	}

	@Override
	public List<Order> getOrderList() {
		
		Session session =sessionFactory.getCurrentSession();
		
		Query<Order>query=session.createQuery("from Order",Order.class);
		
		List<Order>orderList = query.getResultList();
		
		for(Order order:orderList) {
			System.out.println(order.getOrderItems());
		}
		
		return orderList;
	}

	@Override
	public void deliveryOrder(int id) {

		Session session = sessionFactory.getCurrentSession();
		
		Order order= session.get(Order.class,id);
		
		order.setStatus(true);
		
		session.saveOrUpdate(order);
		
	}

}
