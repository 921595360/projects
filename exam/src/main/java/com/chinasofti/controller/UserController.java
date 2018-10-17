package com.chinasofti.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.pojo.User;
import com.chinasofti.service.UserService;
import com.chinasofti.util.CommonUtil;
import com.chinasofti.util.JsonResult;

@Controller
public class UserController {
	
	
	/**
	 * 异步请求,直接返回jsonResult对象
	 * @param userName
	 * @return
	 * 
	 * 默认状态下,response输出时转换规则会参考url地址后缀(异步请求,不建议使用xml,html等关键字作为后缀)
	 * 
	 */
	@ResponseBody//中断转发,直接response输出
	@RequestMapping(value="checkUserName")
	public Object checkUserName(String userName){
		JsonResult jsonResult = new JsonResult();
		boolean isok=userService.checkUserName(userName);
		jsonResult.setResult(isok);
		if(isok){
			jsonResult.setMsg("用户名已存在");
		}
		return jsonResult;
	}
	
	
	
	/**
	 * 调用控制器方法前执行
	 * 
	 */
	@InitBinder
	public void convert(ServletRequestDataBinder binder){
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf,true));
	}
	

	@Autowired
	private UserService userService;

	/**
	 * 限定只允许通过post请求
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "login.do", method = { RequestMethod.POST })
	public Object login(User user, HttpSession session,Date birth) {
		System.out.println(birth);
		ModelAndView mv=new ModelAndView();
		boolean isok=userService.login(user);
		if(isok){
			// 存储用户到session
			session.setAttribute("user", user);
			//重定向
			mv.setViewName("redirect:/index.do");
			return mv;
		}else{
			mv.addObject("msg","用户名或密码错误");
			mv.setViewName("login");//设置视图地址
			return mv;
		}
		
	}
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = {"login","/"}, method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	/**
	 * 注册
	 * 
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register() {
		return "register";
	}

	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String register(User user,Model model) {

		String msg = null;
		if (CommonUtil.isNullOrEmpty(user)) {
			msg = "用户名和密码不能为空";
			model.addAttribute("msg", msg);
			return "register";
		} else if (CommonUtil.isNullOrEmpty(user.getUserName())) {
			msg = "用户名不能为空";
			model.addAttribute("msg", msg);
			return "register";
		} else if (CommonUtil.isNullOrEmpty(user.getUserPass())) {
			msg = "密码不能为空";
			model.addAttribute("msg", msg);
			return "register";
		}
		// 将用户保存到数据库
		userService.register(user);

		return "redirect:/login.do";
	}
	

	
	
	
}
