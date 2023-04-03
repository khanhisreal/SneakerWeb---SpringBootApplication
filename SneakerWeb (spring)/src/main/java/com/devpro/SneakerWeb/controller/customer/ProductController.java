package com.devpro.SneakerWeb.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.SneakerWeb.dto.ProductSearch;
import com.devpro.SneakerWeb.model.Product;
import com.devpro.SneakerWeb.services.impl.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/homepage/product/detail/{productSeo}", method = RequestMethod.GET)
	public String showProduct(final Model model,
			                  final HttpServletRequest request,
			                  final HttpServletResponse response,
			                  @PathVariable("productSeo") String productSeo) throws IOException {
		
		//lấy sản phẩm theo seo
		ProductSearch productSearch = new ProductSearch();
		productSearch.setSeo(productSeo);
		
		Product product = productService.searchProduct(productSearch).getData().get(0);
		model.addAttribute("product",product);
		
		return "customer/product-detail";
	}
}
