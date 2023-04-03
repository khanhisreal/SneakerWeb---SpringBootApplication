package com.devpro.SneakerWeb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "subscribe")
public class ContactSubscribe extends BaseEntity{
	
	@Column(name = "email", nullable = false, length = 45)
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
