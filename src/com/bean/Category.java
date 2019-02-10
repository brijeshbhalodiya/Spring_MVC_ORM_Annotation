package com.bean;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Category")
public class Category {

	private int categoryid;
	private String Category_name;
	
	
	private Set<Product> product_id;

	@Id
	@GenericGenerator(name="inc", strategy="increment")
	@GeneratedValue(generator="inc")
	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	@Column(name="Category_Name")
	public String getCategory_name() {
		return Category_name;
	}

	public void setCategory_name(String category_name) {
		Category_name = category_name;
	}

	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="category_id")
	public Set<Product> getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Set<Product> product_id) {
		this.product_id = product_id;
	}
	
	
}
