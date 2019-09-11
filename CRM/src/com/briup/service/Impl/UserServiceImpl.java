package com.briup.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;
import com.briup.dao.UserDao;
import com.briup.service.UserService;
import com.briup.util.PageUtil;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userdao ;

	@Override
	public Sys_user findlogin(String username, String password) throws Exception {
		if(username==null||password==null||"".equals(username.trim())||"".equals(password.trim())){
		    throw new Exception("空");
		}
		return userdao.login(username, password);
	}

	@Override
	public List<Sys_user> findAllMgr() throws Exception {
		return null;
	}

	//从数据库查找出所有的role
	@Override
	public List<Sys_role> findAllRole() throws Exception {
		return userdao.getAllRole();
	}

	@Override
	public Sys_role findOneRole(int role_id) throws Exception {
		return userdao.getOneRole(role_id);
	}

	@Override
	public void updateRole(Sys_role role) throws Exception {
		userdao.updateRole(role);
	}
	
	//从数据库查找出所有的user
	@Override                                 //当前页
	public PageUtil<Sys_user> findAllUser(int curpage, int row) throws Exception {
		    List<Sys_user> user = userdao.getAllUser(curpage, row);
		    PageUtil<Sys_user> pu=new PageUtil<Sys_user>();
		    //当前页
			pu.setCurPage(curpage/5+1);
			//一页的行数
			pu.setROW(row);
			//得到所有的行数
			int rows = getAllRows();
			pu.setRows(rows);
			//页面里的数据
			pu.setData(user);
			return pu;
	}
	
	//得到所有的行数的方法
	@Override
	public int getAllRows() throws Exception {
		System.out.println(userdao.getAllRows()+"sys_user表中的数据条数");
		return  userdao.getAllRows();
	}

	@Override
	public Sys_user findOneUser(int usr_id) throws Exception {
		return userdao.getOneUser(usr_id);
	}

	@Override
	public void updateUser(Sys_user user) throws Exception {
		userdao.updateUser(user);
	}

	@Override
	public void addUser(Sys_user user) throws Exception {
		userdao.addUser(user);
	}

	@Override
	public void deleteUser(int usr_id) throws Exception {
		userdao.deleteUser(usr_id);
	}

	//向数据库中保存角色
	@Override
	public void addRole(Sys_role role) throws Exception {
		userdao.addRole(role);
	}

	@Override
	public void deleteRole(int role_id) throws Exception {
		userdao.deleteRole(role_id);
	}


}
