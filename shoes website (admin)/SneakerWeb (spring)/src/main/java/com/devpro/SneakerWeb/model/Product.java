package com.devpro.SneakerWeb.model;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product extends BaseEntity {
	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "description", length = 500, nullable = false)
	private String description;

	@Column(name = "price", nullable = false)
	private BigDecimal price;

	@Column(name = "location", length = 200, nullable = false)
	private String location;
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	
	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "product")
	private Set<ProductImages> productImages = new LinkedHashSet<ProductImages>();
	
	public void addProductImages(ProductImages _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}
	
	public Set<ProductImages> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}

	public void deleteProductImages(ProductImages _productImages) {
		_productImages.setProduct(null);
		productImages.remove(_productImages);
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

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
	
	
}
