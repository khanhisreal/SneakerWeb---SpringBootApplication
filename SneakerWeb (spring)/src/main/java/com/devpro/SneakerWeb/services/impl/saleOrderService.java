package com.devpro.SneakerWeb.services.impl;

import org.springframework.stereotype.Service;

import com.devpro.SneakerWeb.model.SaleOrder;
import com.devpro.SneakerWeb.services.BaseService;

@Service
public class saleOrderService extends BaseService<SaleOrder>{

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

}
