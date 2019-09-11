package com.briup.web.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Sys_user;
import com.briup.service.UserService;
import com.briup.util.PageUtil;

/*
 * 用户
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	private PageUtil<Sys_user> pu;
	private List<Sys_user> users;
	private int pages;
	private Sys_user usr;
	private static int curpage;

	// 查询出所有的user
	@RequestMapping("/userall")
	                                                    //当前页码
	public String all(@RequestParam(value = "curpage") int curpage, HttpSession session) {
		    this.curpage = curpage;
		try {
			// 一页显示的所有用户                      //起始下标
			pu = userService.findAllUser((curpage-1)*5, 5);
			/* System.out.println(pu+"-----"); */

			// 得到总页数
			pages = pu.getPages();

			System.out.println("总页数" + pages);

			// 得到封装的类里面的数据
			users = pu.getData();
			for (Sys_user s : users) {
				System.out.println(s);
			}
			session.setAttribute("pu", pu);
			session.setAttribute("users", users);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 返回角色管理页面 显示角色信息
		return "pages/~systemset/user_manage";
	}

	// 添加用户
	@RequestMapping("/useradd")
	public String add(Sys_user user) {

		try {
			userService.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 重定向到userall
		return "redirect:/user/userall?curpage=" + curpage;
	}

	// 编辑用户
	@RequestMapping("/useredit")
	public String edit(@RequestParam("usr_id") int usr_id, HttpSession session) {
		System.out.println(usr_id + "编辑用户");
		try {
			usr = userService.findOneUser(usr_id);
			System.out.println(usr + "--------");
			// 通过role_id查找到的role存放到session中
			session.setAttribute("usr", usr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~systemset/user_update";
	}

	@RequestMapping("/userupdate")
	public String update(HttpServletRequest request,Sys_user user) {
		System.out.println(request.getParameter("curpage"));
		int curpage =Integer.parseInt(request.getParameter("curpage"));
		try {
			userService.updateUser(user);
			// 通过role_id查找到的role存放到session中
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/userall?curpage=" + curpage;
	}

	@RequestMapping("/userdelete")
	public String delete(@RequestParam("usr_id") int usr_id) {
		System.out.println(usr_id);
		try {
			userService.deleteUser(usr_id);
			// 通过role_id查找到的role存放到session中
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/userall?curpage=" + curpage;
	}

}
