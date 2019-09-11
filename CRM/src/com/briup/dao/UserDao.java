package com.briup.dao;

import java.util.List;

import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;

//userDao
public interface UserDao {
	public Sys_user login(String username,String password) throws Exception;
	public List<Sys_user> getAllMgr() throws Exception;
	public List<Sys_role> getAllRole()throws Exception;
	public Sys_role getOneRole(int role_id) throws Exception;
	public void updateRole(Sys_role role) throws Exception;
	public List<Sys_user> getAllUser(int curpage, int row) throws Exception;
	public int getAllRows() throws Exception;
	public Sys_user getOneUser(int usr_id) throws Exception;
	public void updateUser(Sys_user user) throws Exception;
	public void addUser(Sys_user user)throws Exception;
	public void deleteUser(int usr_id) throws Exception;
	public void addRole(Sys_role role) throws Exception;
	public void deleteRole(int role_id) throws Exception;
}
