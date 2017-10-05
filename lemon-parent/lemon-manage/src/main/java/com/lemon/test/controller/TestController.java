package com.lemon.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class TestController {
	@RequestMapping(value={"","login"},method=RequestMethod.GET)
	public String test(){
		return "login";
	}
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(@RequestParam String userName, @RequestParam String password,HttpServletRequest request, HttpServletResponse response, Model model){
			System.out.println(userName);
			System.out.println(password);
			request.getSession().setAttribute("userName", userName);
			request.getSession().setAttribute("password", password);
			return "index";
	}
	
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model){
		request.getSession().removeAttribute("userName");
		request.getSession().removeAttribute("password");
		return "login";
	}

}
