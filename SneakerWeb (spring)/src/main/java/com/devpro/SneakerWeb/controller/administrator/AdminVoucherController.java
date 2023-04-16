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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.SneakerWeb.controller.BaseController;
import com.devpro.SneakerWeb.model.Product;
import com.devpro.SneakerWeb.model.Voucher;
import com.devpro.SneakerWeb.services.impl.VoucherService;

@Controller
public class AdminVoucherController extends BaseController{

	@Autowired
	private VoucherService voucherService;
	
	@RequestMapping(value = "/admin/add-voucher", method = RequestMethod.GET)
	public String addVoucherGET(final Model model,
			                    final HttpServletRequest request,
			                    final HttpServletResponse response) throws IOException{
		
		// khởi tạo 1 voucher entity mới và đẩy xuống view để nhận input
		Voucher voucher = new Voucher();
		model.addAttribute("voucher", voucher);
		
		return "/administrator/add-voucher";
	}
	
	
	@RequestMapping(value = "/admin/add-voucher", method = RequestMethod.POST)
	public String addVoucherPOST(final Model model,
			                     final HttpServletRequest request,
			                     final HttpServletResponse response,
			                     final @ModelAttribute("voucher") Voucher voucher) throws IOException {
	    
		// lưu voucher vào database từ voucher entity đẩy xuống view
		if(voucher.getId() == null || voucher.getId() <= 0) {
			voucherService.addVoucher(voucher);
		} else {
			voucherService.editVoucher(voucher);
		}
	
	    return "redirect:/admin/voucher"; 
	}
	 
	@RequestMapping(value = "/admin/add-voucher/{id}", method = RequestMethod.GET)
	public String editVoucherGET(final Model model,
			                     final HttpServletRequest request,
			                     final HttpServletResponse response,
			                     final @PathVariable("id") Integer id) throws IOException {
	    
		// lấy voucher theo id
		Voucher voucher = voucherService.getById(id);
		
		// Đẩy voucher xuống view để sửa lại
		model.addAttribute("voucher", voucher);
		
	    return "/administrator/add-voucher"; 
	}
	
	@RequestMapping(value = {"/admin/voucher/delete"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model,
			                    final HttpServletRequest request,
			                    final HttpServletResponse response,
			                    final @RequestBody Product data) throws IOException {
	
		Voucher voucherInDb = voucherService.getById(data.getId());
		voucherInDb.setStatus(false);
		voucherService.saveOrUpdate(voucherInDb);
		
		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage", "Delete voucher successfully!");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/admin/voucher", method = RequestMethod.GET)
	public String VoucherGET(final Model model,
			                 final HttpServletRequest request,
			                 final HttpServletResponse response) throws IOException {
		
		List<Voucher> vouchers = voucherService.getEntitiesByNativeSQL("SELECT * FROM sneakerweb.voucher WHERE status = 1");
		model.addAttribute("vouchers", vouchers);
		
		return "/administrator/voucher";
	}
}
