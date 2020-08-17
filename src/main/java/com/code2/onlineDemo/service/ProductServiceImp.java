package com.code2.onlineDemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.code2.onlineDemo.dao.ProductDAO;
import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Product;

@Service
public class ProductServiceImp implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	

	@Override
	@Transactional
	public List<Product> getProducts() {
		return productDAO.getProducts();
	}

	@Override
	@Transactional
	public void saveProduct(Product theProduct) {
		
		productDAO.saveProduct(theProduct);

	}
	
	@Override
	@Transactional
	public Product getProduct(int id) {
		
		return productDAO.getProduct(id);
	}

	@Override
	@Transactional
	public void deleteProduct(int id) {

		productDAO.deleteProduct(id);
		
	}

	@Override
	@Transactional
	public Cart cartProduct(int id) {

		return productDAO.cartProduct(id);
	}

	@Transactional
	@Override
	public List<Product> getProducts(String categorizes) {
	
		return productDAO.getProducts(categorizes);
	}




}
