package com.code2.onlineDemo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Product;

@Service
public interface ProductService {

	  public List<Product>getProducts();
	
	public void saveProduct(Product theProduct);

	public Product getProduct(int id);

	public void deleteProduct(int id);
	
	public Cart cartProduct(int id);

	public List<Product> getProducts(String categorizes);

}
