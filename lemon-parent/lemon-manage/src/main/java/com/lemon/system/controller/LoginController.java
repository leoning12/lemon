package com.lemon.system.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lemon.base.controller.BaseController;
import com.lemon.system.entity.SysUser;
import com.lemon.system.service.UserService;
import com.lemon.system.util.VerifyCodeUtils;

@Controller
@RequestMapping("/")
public class LoginController extends BaseController {
	@Resource
	private UserService userService;
	/**
	 * 登录界面
	 * @param map
	 * @return
	 */
	@RequestMapping(value={"","session"},method=RequestMethod.GET)
	public String session(ModelMap map){
		return "login";
	}
	/**
	 * 登录动作
	 * @param userName 用户名
	 * @param password 用户密码
	 * @param request
	 * @param response
	 * @param map
	 * @return
	 */
	@RequestMapping(value={"","session"},method=RequestMethod.POST)
	public String login(@RequestParam String userName, @RequestParam String password,HttpServletRequest request, HttpServletResponse response,ModelMap map,RedirectAttributes attr){
		List<SysUser> list = userService.getAll();
		if (list.size() < 1) {
			logger.info("无此用户信息。");
			attr.addFlashAttribute("errMsg", "无此用户信息。");
			return "redirect:/session";
		}else {
			SysUser user = list.get(0);
			if (password.equals(user.getLoginPass())) {
				return "redirect:/main";
			}else {
				logger.info(userName+":登录密码错误。");
				attr.addFlashAttribute("errMsg", "登录密码错误。");
				return "redirect:/session";
			}
		}
	}
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value={"","session"},method=RequestMethod.DELETE)
	public String logout(HttpServletRequest request){
		return "login";
	}
	
	@RequestMapping(value="main",method=RequestMethod.GET)
	public String index(HttpServletRequest request){
		return "index";
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
