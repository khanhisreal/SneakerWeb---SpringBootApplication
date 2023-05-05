package com.devpro.SneakerWeb.controller.administrator;

import java.io.IOException;
import java.text.DecimalFormat;
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
import com.devpro.SneakerWeb.model.SaleOrderProducts;
import com.devpro.SneakerWeb.services.impl.ProductService;
import com.devpro.SneakerWeb.services.impl.SubscribeService;
import com.devpro.SneakerWeb.services.impl.saleOrderProductService;

@Controller
public class AdminHomeController extends BaseController{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private saleOrderProductService saleOrderProductService;
	
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
		
		//Order
		List<SaleOrderProducts> saleOrderProducts = saleOrderProductService
				.getEntitiesByNativeSQL("SELECT * FROM sale_order_products WHERE status = 1 OR status IS NULL");
		model.addAttribute("saleOrderProducts", saleOrderProducts.size());
		
		//Income
		double income = countIncome(saleOrderProducts);
		model.addAttribute("income", simplifyAmount(income));
		
		return "administrator/index";
	}

	private double countIncome(List<SaleOrderProducts> saleOrderProducts) {
		// TODO Auto-generated method stub
		double result = 0;
		for(int i =0; i < saleOrderProducts.size(); i++) {
			double getPrice = saleOrderProducts.get(i).getProduct().getPrice().doubleValue();
			Integer getQuantity = saleOrderProducts.get(i).getQuantity();
			result += getPrice*getQuantity;
		} 
		
		return result;
	}
	
	 public static String simplifyAmount(double amount) {
	        String[] suffixes = new String[] {"", "k", "M", "B", "T"}; // suffixes for thousands, millions, billions, trillions
	        int suffixIndex = 0;
	        while (amount >= 1000 && suffixIndex < suffixes.length - 1) {
	            amount /= 1000;
	            suffixIndex++;
	        }
	        DecimalFormat formatter = new DecimalFormat("#,##0.#");
	        return "$" + formatter.format(amount) + suffixes[suffixIndex];
	    }
}

