package com.devpro.SneakerWeb.controller.administrator;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.SneakerWeb.controller.BaseController;
import com.devpro.SneakerWeb.dto.SubscribeDTO;
import com.devpro.SneakerWeb.model.ContactSubscribe;
import com.devpro.SneakerWeb.services.PagerData;
import com.devpro.SneakerWeb.services.impl.SubscribeService;

@Controller
public class AdminSubscribeController extends BaseController{

	@Autowired
	SubscribeService subscribeService;
	
	@RequestMapping(value = { "/admin/subscribe" }, method = RequestMethod.GET)
	public String subscribeView(
			final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response)
			throws IOException {
		
		//lấy page
		String currentPage = request.getParameter("page");
		SubscribeDTO subscribeDTO = new SubscribeDTO();
		subscribeDTO.setPage(currentPage);
		
		//đẩy thông tin xuống trang view
		model.addAttribute("subscribeDTO", subscribeDTO);
		
		//đẩy các contacts xuống view
		PagerData<ContactSubscribe> contacts = subscribeService.contactPager(subscribeDTO);
		model.addAttribute("contacts", contacts);
	
		return "administrator/subscribe";
	}
}
