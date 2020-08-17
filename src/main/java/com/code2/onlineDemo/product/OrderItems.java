package com.code2.onlineDemo.product;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="orders_item")
public class OrderItems {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade= { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST , CascadeType.REFRESH})
	@JoinColumn(name="product_id")
	private Product product;
	
	@Column(name="quantity")
	private int quantity;
	
	@ManyToOne(cascade= { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST , CascadeType.REFRESH})
	@JoinColumn(name="order_id")
	private Order order;

	public OrderItems() {
		
	}

	public OrderItems(int quantity) {
		this.quantity = quantity;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	
	
	
}
