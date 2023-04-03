package com.devpro.SneakerWeb.services.impl;

import org.springframework.stereotype.Service;

import com.devpro.SneakerWeb.model.ProductImages;
import com.devpro.SneakerWeb.services.BaseService;

@Service
public class ProductImagesService extends BaseService<ProductImages>{

	@Override
	protected Class<ProductImages> clazz() {
		// TODO Auto-generated method stub
		return ProductImages.class;
	}

	
}
