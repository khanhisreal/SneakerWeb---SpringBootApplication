package com.devpro.SneakerWeb.controller.administrator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.SneakerWeb.controller.BaseController;
import com.devpro.SneakerWeb.model.ContactSubscribe;
import com.devpro.SneakerWeb.model.Product;
import com.devpro.SneakerWeb.services.impl.ProductService;
import com.devpro.SneakerWeb.services.impl.SubscribeService;

@Controller
public class AdminHomeController extends BaseController{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	
	@RequestMapping(value= {"/admin/home"}, method = RequestMethod.GET)
	public String AdminHome(final Model model,
			                final HttpServletRequest request,
			                final HttpServletResponse response) throws IOException {
		
		//Products
		List<Product> products = productService.findAll();
		model.addAttribute("productsCount", products.size());
		
		//User
		List<ContactSubscribe> users = subscribeService.findAll();
		model.addAttribute("customersCount", users.size());
		
		//New Arrival
		Product lastProduct = products.get(products.size() - 1);
		int lastProductId = lastProduct.getId();
		List<Product> newArrivals = new ArrayList<>();
		for(int i = lastProductId; i > lastProductId - 6; i--) {
			newArrivals.add(productService.getById(i));
		}
		model.addAttribute("newArrivals", newArrivals);
		
		return "administrator/index";
	}
}

