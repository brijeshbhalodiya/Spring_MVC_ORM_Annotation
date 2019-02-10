package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.Category;
import com.bean.Product;
import com.dao.AppDao;

@Controller
public class AppController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String Index() {
		ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		SessionFactory sf = (SessionFactory) context.getBean("sessionFactory");
		return "Home";
	}
	
	@RequestMapping(value="/addProduct", method=RequestMethod.GET)
	public String addProduct() {
		
		return "add-product";
	}
	
	@RequestMapping(value="/addProduct", method=RequestMethod.POST)
	public String insertProduct(HttpServletRequest request, HttpServletResponse response) {
		String pname = request.getParameter("pname");
		double price = Double.parseDouble(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int catId = Integer.parseInt(request.getParameter("catId"));
		ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		AppDao dao = (AppDao)context.getBean("AppDao");
		Category c = dao.getCategoryById(catId);
		Product p = (Product)context.getBean("product");
		p.setProduct_name(pname);
		p.setPrice(price);
		p.setQuantity(quantity);
		p.setCategory_id(c);
		dao.insertProduct(p);
		return "redirect:Products";
	}

	@RequestMapping(value="/addCategory", method=RequestMethod.GET)
	public String addCategory() {
		return "add-category";
	}
	
	@RequestMapping(value="/addCategory", method=RequestMethod.POST)
	public String insertCategory(HttpServletRequest request, HttpServletResponse response) {
		String cname = request.getParameter("cname");
		ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		Category category = (Category)context.getBean("category");
		category.setCategory_name(cname);
		AppDao dao = (AppDao)context.getBean("AppDao");
		dao.insertCategory(category);
		return "redirect:addProduct";
	}
	
	@RequestMapping(value="/Products", method=RequestMethod.GET)
	public String showProduct() {
		
		return "show";
	}
}
