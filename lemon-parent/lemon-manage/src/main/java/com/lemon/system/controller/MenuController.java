package com.lemon.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lemon.system.entity.SysMenu;
import com.lemon.system.service.SysMenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	@Resource
	private SysMenuService menuService;
	
	@RequestMapping(value="{parentId}",method=RequestMethod.GET)
	@ResponseBody
	public String menu(@PathVariable String parentId){
		Map<String, Object> params = new HashMap<>();
		params.put("id", parentId);
		SysMenu sysMenu = menuService.getByHQL("from SysMenu sm where sm.parent.id=:id", params);
		params = new HashMap<String, Object>();
		return sysMenu.toJSON();
	}

}
