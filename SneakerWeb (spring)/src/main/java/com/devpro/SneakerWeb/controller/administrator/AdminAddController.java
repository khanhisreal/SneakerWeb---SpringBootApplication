package com.devpro.SneakerWeb.controller.administrator;

import java.io.IOException;
import java.lang.reflect.Method;
import java.net.http.HttpRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.SneakerWeb.controller.BaseController;
import com.devpro.SneakerWeb.dto.ProductDTO;
import com.devpro.SneakerWeb.dto.ProductSearch;
import com.devpro.SneakerWeb.model.Product;
import com.devpro.SneakerWeb.services.PagerData;
import com.devpro.SneakerWeb.services.impl.ProductService;

@Controller
public class AdminAddController extends BaseController{

	//inject một bean (service) vào trong một bean (controller) sử dụng @Autowired
	//sau khi inject có thể sử dụng các hàm ở trong bean service
	@Autowired ProductService productService;
	
	//receive input product
	@RequestMapping(value = {"/admin/product/management"}, method = RequestMethod.GET)
	 public String addOrUpdateView(final Model model,
			                       final HttpServletRequest request,
			                       final HttpServletResponse response)throws IOException{
		//tạo một entity mới
		Product newProduct = new Product();
		model.addAttribute("product", newProduct); //đẩy data xuống view
		
		return "administrator/add-product";
	}
	
	//update product tại id = productId
	@RequestMapping(value = {"/admin/product/management/{productId}"}, method = RequestMethod.GET)
	 public String addOrUpdateView(final Model model,
			                       final HttpServletRequest request,
			                       final HttpServletResponse response,
			                       @PathVariable("productId") Integer productId)throws IOException{
		//lấy product trong database theo productId
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		
		return "administrator/add-product";
	}
	
	@RequestMapping(value = {"/admin/product/management/saveOrUpdate"}, method = RequestMethod.POST)
	 public String adminStoreImage(final Model model,
			                       final HttpServletRequest request,
			                       final HttpServletResponse response,
			                       final @ModelAttribute("product") Product product,
			                       @RequestParam("productAvatar")  MultipartFile productAvatar,
			                       @RequestParam("productPictures") MultipartFile[] productPictures)throws IOException{
		
		if(product.getId() == null || product.getId() <= 0) {
			productService.addProduct(product, productAvatar, productPictures);
		} else {
			productService.editProduct(product, productAvatar, productPictures);
		}
		
		//trả về view (list)
		return "redirect:/admin-add/product/list";
	}
	
	@RequestMapping(value = {"/admin/product/list"}, method = RequestMethod.GET)
	public String viewProductList(final Model model,
			                      final HttpServletRequest request,
			                      final HttpServletResponse response) throws IOException{
		//lấy keyword
		String keyword = request.getParameter("keyword");
	    //lấy page thứ mấy hiện tại
		String currentPage = request.getParameter("page");
		
		ProductSearch productSearch = new ProductSearch(keyword, currentPage);
		
		// muốn giữ được các giá trị search trên màn hình
		// thì phải đẩy lại các giá trị nhập trước đó xuống view
		model.addAttribute("productSearch", productSearch);
		
		PagerData<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("products", products);
		
		return "administrator/product";
	}
	
	@RequestMapping(value = {"/admin/product/management/delete"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model,
			                    final HttpServletRequest request,
			                    final HttpServletResponse response,
			                    final @RequestBody Product data) throws IOException {
		Product productInDbProduct = productService.getById(data.getId());
		productInDbProduct.setStatus(false);
		productService.saveOrUpdate(productInDbProduct);
		
		Map<String, Object> jsonResult = new HashMap<>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
	
}
