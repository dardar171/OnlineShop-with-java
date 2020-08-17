package com.code2.onlineDemo.product;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="addproduct")
public class Product {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@Column(name="unitPrice")
	private double unitPrice;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="categorizes")
	private String categorizes;
	
	@Transient
	private MultipartFile file;
	
	public Product() {

	}

public Product(String name, String description, double unitPrice, int quantity, String categorizes
		) {
	
		this.name = name;
		this.description = description;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.categorizes = categorizes;
		
	}





//
//	public Product(int id, String name, String description, double unitPrice) {
//
//		this.id = id;
//		this.name = name;
//		this.description = description;
//		this.unitPrice = unitPrice;
//	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	

	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCategorizes() {
		return categorizes;
	}

	public void setCategorizes(String categorizes) {
		this.categorizes = categorizes;
	}





	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", unitPrice=" + unitPrice
				+ "]";
	}



	
	
	
}
