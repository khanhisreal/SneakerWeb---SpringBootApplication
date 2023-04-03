package com.devpro.SneakerWeb.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.SneakerWeb.model.User;
import com.mysql.cj.protocol.Security;

public abstract class BaseController {

	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails) {
			return (User) userLogined;
		}
		return new User();
	}
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal != null && principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
}
