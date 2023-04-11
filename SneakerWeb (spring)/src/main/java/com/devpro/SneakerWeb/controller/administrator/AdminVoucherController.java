package com.devpro.SneakerWeb.controller.administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.SneakerWeb.controller.BaseController;
import com.devpro.SneakerWeb.services.impl.VoucherService;

@Controller
public class AdminVoucherController extends BaseController{

	@Autowired
	private VoucherService voucherService;
	
	@RequestMapping(value = "/admin/add-voucher", method = RequestMethod.GET)
	public String addVoucherGET(final Model model,
			                    final HttpServletRequest request,
			                    final HttpServletResponse response) {
		return "/administrator/add-voucher";
	}
	
	
}
