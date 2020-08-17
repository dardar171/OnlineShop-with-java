package com.code2.onlineDemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Product;

@Repository

public class ProductDAOImp implements ProductDAO {

	@Autowired
	private SessionFactory SessionFactory;

	@Override

	public List<Product> getProducts() {

		Session session = SessionFactory.getCurrentSession();

		Query<Product> query = session.createQuery("from Product", Product.class);

		List<Product> products = query.getResultList();

		return products;
	}
	
	@Override
	public List<Product> getProducts(String categorizes) {

		Session session = SessionFactory.getCurrentSession();

		Query<Product> query = session.createQuery("from Product where categorizes=:productCate", Product.class);
			
		query.setParameter("productCate", categorizes);
		
		return query.list();
	
	}

	@Override
	public void saveProduct(Product theProduct) {

		Session session = SessionFactory.getCurrentSession();

		session.saveOrUpdate(theProduct);

	}

	@Override
	public Product getProduct(int id) {

		Session session = SessionFactory.getCurrentSession();

		Product product = session.get(Product.class, id);

		return product;
	}

	@Override
	public void deleteProduct(int id) {

		Session session = SessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from Product where id=:productId");

		query.setParameter("productId", id);
		query.executeUpdate();

	}

	@Override
	public Cart cartProduct(int id) {

		Session session = SessionFactory.getCurrentSession();

		Cart cart = session.get(Cart.class, id);

		return cart;

	}

	

}
