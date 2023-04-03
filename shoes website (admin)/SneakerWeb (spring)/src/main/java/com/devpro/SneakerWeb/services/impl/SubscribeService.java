package com.devpro.SneakerWeb.services.impl;

import org.springframework.stereotype.Service;

import com.devpro.SneakerWeb.dto.SubscribeDTO;
import com.devpro.SneakerWeb.model.ContactSubscribe;
import com.devpro.SneakerWeb.services.BaseService;
import com.devpro.SneakerWeb.services.PagerData;

@Service
public class SubscribeService extends BaseService<ContactSubscribe>{

	@Override
	protected Class<ContactSubscribe> clazz() {
		// TODO Auto-generated method stub
		return ContactSubscribe.class;
	}
	
	public PagerData<ContactSubscribe> contactPager(SubscribeDTO subscribeDTO){
		// khởi tạo câu lệnh
		String str = "SELECT * FROM subscribe WHERE 1=1";
		return getEntitiesByNativeSQL(str, subscribeDTO.getCurrentPage());
	}
	
	

}
