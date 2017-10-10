package com.lemon.system.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lemon.base.util.PageBean;
import com.lemon.base.util.PageHelper;
import com.lemon.base.util.PageResult;
import com.lemon.system.entity.SysUser;
import com.lemon.system.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;

	@RequestMapping(value = { "", "/" }, method = RequestMethod.GET)
	public String register() {
		return "test/userTest";
	}

	@RequestMapping(value="list",method=RequestMethod.POST)
	@ResponseBody
	public PageResult list(PageHelper pageHelper,ModelMap map,HttpServletRequest request){
		PageResult pb = userService.getPageList(SysUser.class, pageHelper);
		return pb;
	}
}
