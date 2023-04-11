package com.devpro.SneakerWeb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.devpro.SneakerWeb.dto.UserDTO;
import com.devpro.SneakerWeb.model.Role;
import com.devpro.SneakerWeb.model.User;
import com.devpro.SneakerWeb.repository.RoleRepository;
import com.devpro.SneakerWeb.repository.UserRepository;
import com.devpro.SneakerWeb.services.impl.UserService;

@Controller
public class LoginController extends BaseController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "signup";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> registerPOST(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response, 
			final @RequestBody UserDTO user) {
		  
		    if (userRepository.findByUsername(user.getUsername()) != null) {
		        // Trả về thông báo lỗi nếu username đã tồn tại
		        Map<String, Object> jsonResult = new HashMap<>();
		        jsonResult.put("error", "Username already exists!");
		        return ResponseEntity.badRequest().body(jsonResult);
		    }
		  
		    // Tạo đối tượng User từ đối tượng UserDTO
		    User newUser = new User();
		    newUser.setUsername(user.getUsername());
		    newUser.setPassword(userService.encrypt(user.getPassword()));
		    newUser.setEmail(user.getEmail());
		    newUser.setPhone(user.getPhone());
		    newUser.setShippingAddress(user.getShippingAddress());
		    
			// Lấy đối tượng Role cần liên kết từ cơ sở dữ liệu.
		    Role role = roleRepository.findById(2).orElseThrow(() -> new EntityNotFoundException("Role not found"));

		    // Thêm role vừa lấy được vào danh sách các role của đối tượng User mới.
		    newUser.getRoles().add(role);
		    
		    // Lưu đối tượng User mới và liên kết nó với Role tương ứng bằng cách thêm dữ liệu vào bảng users_roles.
		    userRepository.save(newUser);
		    
			// Return success response
			Map<String, Object> jsonResult = new HashMap<>();
			jsonResult.put("username", user.getUsername());
			return ResponseEntity.ok(jsonResult);
	}
}
