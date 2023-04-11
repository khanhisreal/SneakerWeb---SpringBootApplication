package com.devpro.SneakerWeb.services.impl;

import org.springframework.stereotype.Service;

import com.devpro.SneakerWeb.model.Voucher;
import com.devpro.SneakerWeb.services.BaseService;

@Service
public class VoucherService extends BaseService<Voucher>{

	@Override
	protected Class<Voucher> clazz() {
		// TODO Auto-generated method stub
		return Voucher.class;
	}

}
