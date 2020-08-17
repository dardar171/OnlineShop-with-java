package com.code2.onlineDemo.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.code2.onlineDemo.product.Product;
import com.code2.onlineDemo.service.ProductService;

@Controller
@RequestMapping("/product")


public class ProductController {

	
	@Autowired
	private ProductService productService;
	

	@GetMapping("/list")
	public String listProduct(Model model) {
		
		List<Product> products = productService.getProducts();
		
		model.addAttribute("products",products);
		System.out.println(products);
		return "list-form";
	}
	
	@GetMapping("/detail/clothing")
	public String clothForm(@RequestParam("productCate") String categorizes,Model model) {
		
		List<Product> products = productService.getProducts(categorizes);
		model.addAttribute("products",products);
		
		return "shoes-form";
	}
	
	@GetMapping("/detail/shoes")
	public String shoesForm(@RequestParam("productCate") String categorizes,Model model) {
		
		List<Product> products = productService.getProducts(categorizes);
		model.addAttribute("products",products);
		
		return "shoes-form";
	}
	
	@GetMapping("/detail/bags")
	public String bagsForm(@RequestParam("productCate") String categorizes,Model model) {
		
		List<Product> products = productService.getProducts(categorizes);
		model.addAttribute("products",products);
		
		return "shoes-form";
	}
	
	@GetMapping("/detail/accessories")
	public String accessoriesForm(@RequestParam("productCate") String categorizes,Model model) {
		
		List<Product> products = productService.getProducts(categorizes);
		model.addAttribute("products",products);
		
		return "shoes-form";
	}
	@GetMapping("/addProduct")
	public String addProduct(Model model) {
		
		
		model.addAttribute("product", new Product());
		
		return "add-form";
	}
	
	@PostMapping("/addProduct")
	public String processProduct(@ModelAttribute("product")Product theProduct,HttpServletRequest request) {
		
	
		productService.saveProduct(theProduct);
		
		MultipartFile file=theProduct.getFile();
		
		if(!file.isEmpty()) {
			String realPath = request.getSession().getServletContext().getRealPath("/resources/images/");
			String abstractPath="D:\\JavaEE-exercise Workspaces\\OnlineShop\\OnlineShop\\src\\main\\webapp\\resources\\images\\";
			System.out.println("REAL_PATH:"+realPath);
			File dir = new File(realPath);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
		
		
		
		
	try {
			
			file.transferTo(new File(realPath+ theProduct.getId()+".jpg"));
			file.transferTo(new File(abstractPath+theProduct.getId()+".jpg"));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		return "redirect:list";
	}
	
	
	@GetMapping("/showUpdateForm")
	public String showUpdateForm(@RequestParam("productId") int id,Model model) {
		
		Product theProduct = productService.getProduct(id);
		model.addAttribute("product",theProduct);
	
		return "add-form";
	}
	
	@GetMapping("/deleteProduct")
	public String deleteForm(@RequestParam("productId")int id) {
		
		productService.deleteProduct(id);
		
		return "redirect:list";
	}
}
