package com.devpro.SneakerWeb.services.impl;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.SneakerWeb.dto.OrderDTO;
import com.devpro.SneakerWeb.model.SaleOrderProducts;
import com.devpro.SneakerWeb.services.BaseService;
import com.devpro.SneakerWeb.services.PagerData;

@Service
public class saleOrderProductService extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}

	public PagerData<SaleOrderProducts> searchOrder(OrderDTO order) {
		
		String sql = "SELECT * FROM sale_order_products";

		if(order != null) {
		    if(!StringUtils.isEmpty(order.getName())) {
		        sql += " WHERE saleorder_id IN (SELECT id FROM sale_order WHERE customer_name LIKE '%" + order.getName() + "%\')";
		    }
		}

		PagerData<SaleOrderProducts> saleOrderProducts = getEntitiesByNativeSQL(sql, order.getPage());
		return saleOrderProducts;
	}
	
}
