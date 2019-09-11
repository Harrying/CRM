package com.briup.web.controller.system;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Cst_log;
import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;
import com.briup.service.LogService;
import com.briup.service.UserService;
/**
 * 角色
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private UserService userService; 
	private List<Sys_role> roles;
	private Sys_role role;
	@Autowired
	private LogService logService;
	
	    //查询出所有的role
	    @RequestMapping("/roleall")
		public String all(HttpSession session){
			try {
				//调用service层查询出所有的角色信息
				roles=userService.findAllRole();
			  for(Sys_role s:roles){
				  System.out.println(s);
			  }
				//把取到的roles存放到session中,在jsp页面中遍历集合显示在页面上
				session.setAttribute("roles", roles);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//返回角色管理页面 显示角色信息
			return "pages/~systemset/role_manage";
		}
	    
	    //添加角色
	    @RequestMapping("/roleadd")
		public String add(Sys_role role,HttpSession session){
	      /*System.out.println("-----------");
	    	System.out.println(role.getRole_id());
	    	System.out.println(role.getRole_name());
	    	System.out.println(role.getRole_desc());
	    	System.out.println(role.getRole_flag());*/
	    	
			try {
				userService.addRole(role);
				//--------日志------------
				Cst_log log=new Cst_log();
				Sys_user user=(Sys_user) session.getAttribute("user");	
				log.setLog_op(user.getUsr_name());
				log.setLog_event("新增了角色,角色名称为'"+role.getRole_name()+"'");
				log.setLog_date(new Date());
				logService.saveLogOne(log);
				//------------------------
		} catch (Exception e) {
				e.printStackTrace();
			}
			
			//重定向到roleall
			return "redirect:/role/roleall";
        }
	    
	    //编辑角色
	    @RequestMapping("/roleedit")
		public String edit(@RequestParam(value="role_id") int role_id,HttpSession session){
	           /*	System.out.println(role_id);*/
			try {
				role=userService.findOneRole(role_id);
				/*System.out.println(role+"--------");*/
				session.setAttribute("role", role);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "pages/~systemset/role_update";
		}
	    
	    @RequestMapping("/roleupdate")
		public String update(Sys_role role,HttpSession session){
	    	/*System.out.println(role);*/
			try {
				userService.updateRole(role);
				//--------日志------------
				Cst_log log=new Cst_log();
				Sys_user user=(Sys_user) session.getAttribute("user");	
				log.setLog_op(user.getUsr_name());
				log.setLog_event("修改了编号为：'"+role.getRole_id()+"' 的信息");
				log.setLog_date(new Date());
				logService.saveLogOne(log);
			   //------------------------
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/role/roleall";
		}
	    
	        @RequestMapping("/roledelete")
			public String delete(@RequestParam("role_id") int role_id,HttpSession session){
		          /*	System.out.println(role_id);*/
		    	   Sys_role sr = new Sys_role(role_id);
				try {
					userService.deleteRole(role_id);
					//--------日志------------
					Cst_log log=new Cst_log();
					Sys_user user=(Sys_user) session.getAttribute("user");	
					log.setLog_op(user.getUsr_name());
					/*log.setLog_event("删除了角色'"+sr.getRole_name()+"'");*/
					log.setLog_date(new Date());
					logService.saveLogOne(log);
					//------------------------
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "redirect:/role/roleall";
			}
}
