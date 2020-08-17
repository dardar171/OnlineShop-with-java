package com.code2.onlineDemo.dao;



import java.util.List;

import com.code2.onlineDemo.product.Cart;
import com.code2.onlineDemo.product.Product;

public interface ProductDAO {
	
	public List<Product>getProducts();
	
	public void saveProduct(Product theProduct);

	public Product getProduct(int id);

	public void deleteProduct(int id);
	
	public Cart cartProduct(int id);

	public List<Product> getProducts(String categorizes);



}
