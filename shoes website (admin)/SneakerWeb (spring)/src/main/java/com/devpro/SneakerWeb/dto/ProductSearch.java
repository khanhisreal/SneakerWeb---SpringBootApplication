package com.devpro.SneakerWeb.dto;

import com.devpro.SneakerWeb.services.BaseService;

public class ProductSearch {
	private String keyword;
	private String currentPage;
	private String seo;
	//private String orderBy;
	

	public ProductSearch() {
		super();
	}

	public ProductSearch(String keyword, String currentPage) {
		super();
		this.keyword = keyword;
		this.currentPage = currentPage;
	}

	public String getSeo() {
		return seo;
	}



	public void setSeo(String seo) {
		this.seo = seo;
	}



	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public Integer getPage() {
		try {
			return Integer.parseInt(this.currentPage);
		}catch (Exception e) {
			return BaseService.NO_PAGING;
		}
	}
}
