package com.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bean.Category;
import com.bean.Product;

public class AppDao extends HibernateDaoSupport {

	public List<Category> getAllCategory(){
		List<Category> list=null;
		list = getHibernateTemplate().find("from Category");
		return list;
	}

	public void insertCategory(Category category) {
		getHibernateTemplate().save(category);
	}

	public Category getCategoryById(int catId) {
		Category c = null;
		c= getHibernateTemplate().get(Category.class, catId);
		return c;
	}

	public void insertProduct(Product p) {
		getHibernateTemplate().save(p);
	}
	
}
