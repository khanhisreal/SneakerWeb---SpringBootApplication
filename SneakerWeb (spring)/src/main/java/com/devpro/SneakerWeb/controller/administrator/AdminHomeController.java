package com.devpro.SneakerWeb.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.SneakerWeb.controller.BaseController;

@Controller
public class AdminHomeController extends BaseController{

	@RequestMapping(value= {"/admin/home"}, method = RequestMethod.GET)
	public String AdminHome(final Model model,
			                final HttpServletRequest request,
			                final HttpServletResponse response) throws IOException {
		return "administrator/index";
	}
}

