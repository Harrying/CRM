package com.briup.dao;

import java.io.Serializable;
import java.util.List;

import com.briup.bean.Condition;
import com.briup.bean.Cst_service;
import com.briup.bean.Sys_user;

public interface Cst_serviceDao {

	/*
	 * 新建服务
	 */
	public void save(Cst_service cst_service) throws Exception;

	public int getAllRows() throws Exception;
	
	public int getAllRowss(Cst_service cst_service) throws Exception;
	
	public int getAllRowss1(Cst_service cst_service) throws Exception;
	
	
	//查找所有新建的服务
	public List<Cst_service> findAll(int curPage, int row) throws Exception;
	
	public List<Sys_user> findAllManagerName() throws Exception;
	
	/*
	 * 分配
	 */
	public void updateCst_service(Cst_service cst_service) throws Exception;
	/*
	 * 
	 */
	public List<Cst_service> findByHQLCondition(Cst_service con, int curPage,
			int row) throws Exception;

	public List<Cst_service> findByHQLCondition1(Cst_service con, int curPage,
			int row) throws Exception;
	
	public List<Cst_service> findByHQLCondition2(Cst_service con, int curPage,
			int row) throws Exception;
	
	/*
	 * 查询 状态 “已分配”
	 */
	public List<Cst_service> findByfp(int curPage, int row) throws Exception;
	
	public int getAllRows2() throws Exception;
	
	/*
	 * 查询 状态“已处理”
	 */
	public List<Cst_service> findBycl(int curPage, int row) throws Exception;
	public int getAllRows3() throws Exception;

	/*
	 * 查询状态“已归档”
	 
	public List<Cst_service> findBygd(int curPage, int row) throws Exception;
	public int getAllRows4() throws Exception;*/
	
	/*
	 * 根据服务标号删除服务信息
	 */

	public void delete(Serializable svr_id) throws Exception;

	/*
	 * 根据编号查询单条服务信息
	 */
	public Cst_service queryOneByid(Serializable svr_id);
	
	/*
	 * 更新
	 */
	public void updateinfo(Cst_service cst_service) throws Exception;
	
	/*
	 * 满意度
	 */
	public void Dealresult(Cst_service cst_service) throws Exception;
	
}
