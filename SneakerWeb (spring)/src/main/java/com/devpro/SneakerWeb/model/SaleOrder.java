package com.devpro.SneakerWeb.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "sale_order")
public class SaleOrder extends BaseEntity{
	
	@Column(name = "code", length = 45)
	private String code;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name = "total", precision = 13, scale = 2)
	private BigDecimal total;
	
	@Column(name = "customer_name", length = 100)
	private String customerName;
	
	@Column(name = "customer_address", length = 100)
	private String customerAddress;
	
	@Column(name = "seo", length = 200)
	private String seo;
	
	@Column(name = "customer_phone", length = 100)
	private String customer_phone;
	
	@Column(name = "customer_email", length = 100)
	private String customer_email;
	
	@OneToMany(cascade = CascadeType.ALL, 
			   mappedBy = "saleOrder", 
			   fetch = FetchType.EAGER)
	private Set<SaleOrderProducts> saleOrderProducts = new HashSet<SaleOrderProducts>();
	
	public void addSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}
	public void removeSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(null);
		saleOrderProducts.remove(_saleOrderProducts);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public Set<SaleOrderProducts> getSaleOrderProducts() {
		return saleOrderProducts;
	}
	public void setSaleOrderProducts(Set<SaleOrderProducts> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}
	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getCustomerPhone() {
		return customer_phone;
	}

	public void setCustomerPhone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCustomerEmail() {
		return customer_email;
	}

	public void setCustomerEmail(String customer_email) {
		this.customer_email = customer_email;
	}
	
}
