package com.briup.web.controller.user;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;
import com.briup.service.UserService;

//用户登录和登出
@Controller
public class UserLoginController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login(@Param("username") String username, @Param("password") String password, HttpSession session) {
		System.out.println(username);
		System.out.println(password);
		String path="";
		try {
			Sys_user user = userService.findlogin(username, password);
			Sys_role role = userService.findOneRole(user.getUsr_id());
			if(user.getUsr_flag()==1&&role.getRole_flag()==1){
			session.setAttribute("user", user);	
			path="main";
			}else{
				session.setAttribute("msg", "登录失败：当前用户无效！");	
				path="index";
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("msg", "登录失败：用户或密码不能为空或有误！");
			path= "index";
		}
		return path;
	}

	@RequestMapping("/loginout")
	public String loginout(HttpSession session) throws Exception {
		/*System.out.println("----------");*/
		
		Sys_user user = (Sys_user) session.getAttribute("user");
		/*String username = user.getUsr_name();*/
		if(user!=null){
		session.removeAttribute("user");
		}
		return "index";
	}
}
