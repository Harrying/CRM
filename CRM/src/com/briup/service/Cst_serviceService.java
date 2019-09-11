package com.briup.service;

import java.io.Serializable;
import java.util.List;

import com.briup.bean.Condition;
import com.briup.bean.Cst_service;
import com.briup.bean.Sys_user;
import com.briup.util.PageUtil;


public interface Cst_serviceService {

	public void save(Cst_service cst_service) throws Exception;

    /*
     * 找所有经理
     */
	public List<Sys_user>  findAllManagerName() throws Exception;
	
	/*
	 * 条件检索
	 */
	public PageUtil<Cst_service> findByHQLCondition(Cst_service con, int curPage,
			int row) throws Exception;
	public PageUtil<Cst_service> findByHQLCondition1(Cst_service con, int curPage,
			int row) throws Exception;
	public PageUtil<Cst_service> findByHQLCondition2(Cst_service con, int curPage,
			int row) throws Exception;

	/*
	 * 查询所有状态为新创建的服务
	 */
	
	public PageUtil<Cst_service> findAll(int curPage, int row) throws Exception;
	public int getAllRows() throws  Exception;

	/*
	 * 查询所有状态为已分配的服务
	 */
	
	public PageUtil<Cst_service> findByfp(int curPage, int row) throws Exception;
	
	public int getAllRows2() throws  Exception;

	/*
	 * 查询所有状态为已处理的服务
	 */
	public PageUtil<Cst_service> findBycl(int curPage, int row) throws Exception;
	public int getAllRows3() throws  Exception;
	
	/*
	 * 删除服务
	 */

	public void delete(Serializable svr_id) throws Exception;

	/*
	 * 更新分配服务
	 */
	public void updateCst_service(Cst_service cst_service)
			throws Exception;
	
	/*
	 * 通过ID查询服务
	 */
	public Cst_service queryOneByid(Serializable svr_id);
	
	/*
	 * 更新处理服务
	 */
	public void updateinfo(Cst_service cst_service) throws Exception;
	
	/*
	 * 处理结果
	 */
	public void Dealresult(Cst_service cst_service) throws Exception;
	
	/*
	 * 查询已归档服务
	 */
	/*public PageUtil<Cst_service> findBygd(int curPage, int row) throws Exception;
	
	public int getAllRows4() throws  Exception;*/
	
	

	public int getAllRowss(Cst_service cst_service) throws  Exception;
	
	public int getAllRowss1(Cst_service cst_service) throws  Exception;

}
