package com.lemon.system.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lemon.base.controller.BaseController;
import com.lemon.base.util.PageBean;
import com.lemon.base.util.PageResult;
import com.lemon.system.entity.SysMenu;
import com.lemon.system.entity.SysUser;
import com.lemon.system.service.SysMenuService;
import com.lemon.system.service.UserService;
import com.lemon.system.util.VerifyCodeUtils;

@Controller
@RequestMapping("/")
public class LoginController extends BaseController {
	@Resource
	private UserService userService;
	@Resource
	private SysMenuService menuService;
	/**
	 * 登录界面
	 * @param map
	 * @return
	 */
	@RequestMapping(value={"","session"},method=RequestMethod.GET)
	public String session(ModelMap map,HttpServletRequest request){
		if (!StringUtils.isEmpty(request.getSession().getAttribute("loginUser"))) {
			Map<String, Object> params = new HashMap<>();
			params.put("id", "0");
			SysMenu sysMenu = menuService.getByHQL("from SysMenu sm where sm.parent.id=:id", params);
			StringBuilder sb = new StringBuilder();
			buildMenu(sysMenu, sb);
			map.put("sysMenu", sb);
			return "index";
		}else {
			return "login";
		}
	}
	/**
	 * 构建系统菜单
	 * @param sysMenu 树形菜单对象
	 * @param sb 树形菜单html代码
	 */
	public void buildMenu(SysMenu sysMenu,StringBuilder sb){
		if (sysMenu.getLevel() == 0 && sysMenu.getChildren().size() > 0) {
			for (int i = 0; i < sysMenu.getChildren().size(); i++) {
				buildMenu(sysMenu.getChildren().get(i), sb);
			}
		}else if(sysMenu.getLevel() == 1) {
			sb.append("<li><a href=\"#\">")
			.append("<i class=\"fa fa-sitemap\"></i><span class=\"nav-label\">"+sysMenu.getName()+"</span>")
			.append("<span class=\"fa arrow\"></span></a>");
			if (sysMenu.getChildren().size() > 0) {
				sb.append("<ul class=\"nav nav-second-level collapse\" style=\"height:0px;\">");
				for (int i = 0; i < sysMenu.getChildren().size(); i++) {
					buildMenu(sysMenu.getChildren().get(i), sb);
				}
				sb.append("</ul>");
			}
			sb.append("</li>");
		}else if (sysMenu.getLevel() == 2) {
			if (sysMenu.getChildren().size() > 0) {
				sb.append("<li><a href=\""+sysMenu.getHref()+"\">"+sysMenu.getName()+"<span class=\"fa arrow\"></span></a>");
				sb.append("<ul class=\"nav nav-third-level\">");
				for (int i = 0; i < sysMenu.getChildren().size(); i++) {
					buildMenu(sysMenu.getChildren().get(i), sb);
				}
				sb.append("</ul>");
				sb.append("</li>");
			}else {
				sb.append("<li><a class=\"J_menuItem\" href=\""+sysMenu.getHref()+"\">"+sysMenu.getName());
				sb.append("</li>");
			}
		}else if (sysMenu.getLevel() == 3) {
			sb.append("<li><a class=\"J_menuItem\" href=\""+sysMenu.getHref()+"\">"+sysMenu.getName()+"</a></li>");
		}
	}
	/**
	 * 登录动作
	 * @param userName 用户名
	 * @param password 用户密码
	 * @param verifyCode 验证码
	 * @param request
	 * @param response
	 * @param map
	 * @return
	 */
	@RequestMapping(value={"","session"},method=RequestMethod.POST)
	public String login(@RequestParam String userName, @RequestParam String password,String verifyCode,HttpServletRequest request, HttpServletResponse response,ModelMap map,RedirectAttributes attr){
		List<SysUser> list = userService.getByProperty("loginName", userName);
		String vCode = request.getSession().getAttribute("verifyCode").toString();//获取session中的验证码
		if (list.size() < 1) {
			logger.info("无此用户信息。");
			attr.addFlashAttribute("errMsg", "无此用户信息。");
			//return "redirect:/session";
		}else if(!verifyCode.equalsIgnoreCase(vCode)){
			logger.info(userName+":验证码错误。");
			attr.addFlashAttribute("errMsg", "验证码错误。");
			//return "redirect:/session";
		}else{
			SysUser user = list.get(0);
			if (password.equals(user.getLoginPass())) {
				request.getSession().setAttribute("loginUser", user);
				//return "redirect:/main";
			}else {
				logger.info(userName+":登录密码错误。");
				attr.addFlashAttribute("errMsg", "登录密码错误。");
				//return "redirect:/session";
			}
		}
		return "redirect:/session";
	}
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value={"logout"},method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("loginUser");
		return "redirect:/session";
	}
	
	@RequestMapping(value="main",method=RequestMethod.GET)
	public String index(HttpServletRequest request){
		if (!StringUtils.isEmpty(request.getSession().getAttribute("loginUser"))) {
			return "index";
		}else {
			return "login";
		}
	}
	@RequestMapping(value="randomCodeImage",method=RequestMethod.GET)
	public void randomCodeImage(HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Pragma", "No-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
        response.setContentType("image/jpeg");  
        //生成随机字串 
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
      //将字符保存到session中用于前端的验证
        request.getSession().setAttribute("verifyCode", verifyCode);
      //生成图片 
        int w = 80, h = 33; 
        try {
            VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
            logger.info("图片验证码生成成功。");
        } catch (IOException e) {
            logger.error("生成登录验证码失败",e);
        }  
        
	}

}
