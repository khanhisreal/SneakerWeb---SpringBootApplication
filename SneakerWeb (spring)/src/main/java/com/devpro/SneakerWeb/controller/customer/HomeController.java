package com.devpro.SneakerWeb.controller.customer;

import com.devpro.SneakerWeb.dto.HomeProductsDTO;
import com.devpro.SneakerWeb.dto.SubscribeDTO;
import com.devpro.SneakerWeb.model.ContactSubscribe;
import com.devpro.SneakerWeb.model.Product;
import com.devpro.SneakerWeb.services.PagerData;
import com.devpro.SneakerWeb.services.impl.ProductService;
import com.devpro.SneakerWeb.services.impl.SubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class HomeController extends com.devpro.SneakerWeb.controller.BaseController {

    @Autowired
    private SubscribeService subscribeService;

    @Autowired
    private ProductService productService;


    @RequestMapping(value = {"/homepage"}, method = RequestMethod.GET)
    public String homepage(
            final Model model,
            final HttpServletRequest request,
            final HttpServletResponse response,
            @RequestParam(name = "productSort", required = false) String productSort)
            throws IOException {

        System.out.println(productSort);

        SubscribeDTO subscribeDTO = new SubscribeDTO();
        model.addAttribute("subscribeDTO", subscribeDTO);

        // lấy page
        String currentPage = request.getParameter("page");
        HomeProductsDTO homeProductsDTO = new HomeProductsDTO();
        homeProductsDTO.setPage(currentPage);

        // đẩy thông tin xuống trang view
        model.addAttribute("homeProductsDTO", homeProductsDTO);
        model.addAttribute("productSort", productSort);

        // đẩy các products xuống view
        PagerData<Product> products = productService.productPager(homeProductsDTO, ProductService.Sort.parse(productSort));
        model.addAttribute("products", products);

        return "customer/index";
    }

    @RequestMapping(value = {"/ajax/homepage"}, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> homepage_using_ajax(
            final Model model,
            final HttpServletRequest request,
            final HttpServletResponse response,
            final @RequestBody SubscribeDTO subscribeDTO) {

        System.out.println(subscribeDTO.getEmail());

        //lưu contact vào trong database
        ContactSubscribe cs = new ContactSubscribe();
        cs.setEmail(subscribeDTO.getEmail());
        subscribeService.saveOrUpdate(cs);

        Map<String, Object> jsonResult = new HashMap<>();
        jsonResult.put("statusCode", 200);
        jsonResult.put("statusMessage", "Cảm ơn bạn " + subscribeDTO.getEmail() + ", chúng tôi sẽ liên hệ sớm nhất");
        return ResponseEntity.ok(jsonResult);
    }


}
