package com.briup.service;

import java.util.List;

import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;
import com.briup.util.PageUtil;


public interface UserService {
	public Sys_user findlogin(String username,String password) throws Exception;
	public List<Sys_user> findAllMgr() throws Exception;
	public List<Sys_role> findAllRole() throws Exception;
	public Sys_role findOneRole(int role_id) throws Exception;	
	public void updateRole(Sys_role role) throws Exception;
	public PageUtil<Sys_user> findAllUser(int curpage, int row) throws Exception;
	public int getAllRows() throws Exception;
	public Sys_user findOneUser(int usr_id) throws Exception;
	public void updateUser(Sys_user user) throws Exception;
	public void addUser(Sys_user user) throws Exception;
	public void deleteUser(int usr_id) throws Exception;
	public void addRole(Sys_role role) throws Exception;
	public void deleteRole(int role_id)throws Exception;
}
