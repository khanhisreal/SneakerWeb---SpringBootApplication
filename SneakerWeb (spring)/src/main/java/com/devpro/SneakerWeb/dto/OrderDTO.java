package com.devpro.SneakerWeb.dto;

import com.devpro.SneakerWeb.services.BaseService;

public class OrderDTO {
	private String name;
	private String currentPage;
	
	public OrderDTO(String name, String currentPage) {
		super();
		this.name = name;
		this.currentPage = currentPage;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public OrderDTO(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getPage() {
		try {
			return Integer.parseInt(this.getCurrentPage());
		} catch(Exception e) {
			return BaseService.NO_PAGING; 
		}
	}
}
