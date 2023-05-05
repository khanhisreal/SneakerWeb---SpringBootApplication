package com.devpro.SneakerWeb.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.SneakerWeb.controller.BaseController;
import com.devpro.SneakerWeb.dto.OrderDTO;
import com.devpro.SneakerWeb.model.SaleOrder;
import com.devpro.SneakerWeb.model.SaleOrderProducts;
import com.devpro.SneakerWeb.services.PagerData;
import com.devpro.SneakerWeb.services.impl.saleOrderProductService;
import com.devpro.SneakerWeb.services.impl.saleOrderService;

@Controller
public class AdminOrderController extends BaseController{
	
	@Autowired
	private saleOrderProductService saleOrderProductService;
	
	@RequestMapping(value = "/admin/order", method = RequestMethod.GET)
	public String orderGET(final Model model,
			            final HttpServletRequest request,
			            final HttpServletResponse response) throws IOException {
		
		// lấy tên khách hàng trong order
		String name = request.getParameter("customer_name");
		// lấy page
		String currentPage = request.getParameter("page");
		
		OrderDTO orderDTO = new OrderDTO(name, currentPage);
		model.addAttribute("oderDTO", orderDTO);
		model.addAttribute("page", orderDTO.getPage());
		
		PagerData<SaleOrderProducts> saleOrderProducts = saleOrderProductService.searchOrder(orderDTO);
		model.addAttribute("saleOrderProducts", saleOrderProducts);
		
		return "administrator/order";
	}
	
	@RequestMapping(value = "/admin/order/disapprove", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> DisapproveOrder(final Model model,
			                      final HttpServletRequest request,
			                      final HttpServletResponse response,
			                      final @RequestBody SaleOrderProducts data) throws IOException {
		
		//make change in the database
		SaleOrderProducts dataInDB = saleOrderProductService.getById(data.getId());
		dataInDB.setStatus(false);
		saleOrderProductService.saveOrUpdate(dataInDB);
		
		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage", "Disapproved order.");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/admin/order/approve", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ApproveOrder(final Model model,
			                      final HttpServletRequest request,
			                      final HttpServletResponse response,
			                      final @RequestBody SaleOrderProducts data) throws IOException {
		
		//make change in the database
		SaleOrderProducts dataInDB = saleOrderProductService.getById(data.getId());
		dataInDB.setStatus(null);
		saleOrderProductService.saveOrUpdate(dataInDB);
		
		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage", "Approved order.");
		return ResponseEntity.ok(jsonResult);
	}
}
