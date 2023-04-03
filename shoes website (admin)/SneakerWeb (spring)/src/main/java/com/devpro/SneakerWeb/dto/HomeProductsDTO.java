package com.devpro.SneakerWeb.dto;

import com.devpro.SneakerWeb.services.BaseService;

public class HomeProductsDTO {
	private String page;

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	public Integer getCurrentPage() {
		try {
			return Integer.parseInt(this.getPage());
		} catch (Exception e) {
			// TODO: handle exception
			return BaseService.NO_PAGING;
		}
	}

}
