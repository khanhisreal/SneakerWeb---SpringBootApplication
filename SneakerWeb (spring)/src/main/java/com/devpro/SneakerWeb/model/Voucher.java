package com.devpro.SneakerWeb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Objects;

@Entity
@Table(name = "voucher")
public class Voucher extends BaseEntity{

	@Column(name = "name", length = 45, nullable = false)
	private String name;
	
	@Column(name = "description", length = 500, nullable = false)
	private String description;
	
	@Column(name = "discount", nullable = false)
	private Integer discount;

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

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
}
