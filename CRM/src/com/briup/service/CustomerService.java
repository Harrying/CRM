package com.briup.service;

import java.io.Serializable;
import java.util.List;

import com.briup.bean.Condition;
import com.briup.bean.Cst_activity;
import com.briup.bean.Cst_customer;
import com.briup.bean.Cst_linkman;
import com.briup.bean.Cst_lost;
import com.briup.bean.Orders;
import com.briup.bean.Orders_line;
import com.briup.bean.Sys_user;
import com.briup.util.PageUtil;

public interface CustomerService {
	public int getAllRows() throws Exception;
	public List<Cst_customer> findallCustomer() throws Exception;
	/**
	 * 分页查询Cst_customer
	 * @param curpage
	 * @param row
	 * @return
	 */
	public List<Cst_customer> findCustomerPage(int curpage, int row) throws Exception; 
	
	public PageUtil<Cst_customer> findCustomerPageByCon(int curpage, int row,Cst_customer cc) throws Exception; 
	
	public Cst_customer findCustomerById(Serializable id)throws Exception;
	
	public void updateCustomer(Cst_customer c) throws Exception;
	
	public void saveLinkMan(Cst_linkman lkm) throws Exception;
	
	public void deleteLinkMan(Serializable id) throws Exception;
	
	//返回一个联系人的集合
	public List<Cst_linkman> findAllLinkman(Serializable id) throws Exception;
	
	public Cst_linkman findLinkmanById(Serializable id) throws Exception;

	public void updateLinkman(Cst_linkman lkm) throws Exception ;
	
	public void deleteCustomerById(Serializable id) throws Exception;
	
	public void saveCst_activity(Cst_activity av) throws Exception;
	
    public List<Cst_activity> findAllAcv(Serializable atv_cust_no) throws Exception;	

	public Cst_activity findAtvById(Serializable atv_id) throws Exception;
	
	public void updateAtv(Cst_activity at) throws Exception;
	
	public void deleteAtv(Serializable atv_id) throws Exception;
	
	public PageUtil<Cst_customer> findCstPage(int curpage,int row) throws Exception;
	
	public Orders findOrderById(Serializable id) throws Exception;
	
	public PageUtil<Cst_customer> findCstPageByCon(int curpage,int row,Condition con) throws Exception;
	
	public List<Sys_user> findSys_user() throws Exception;

	public void saveCustomer(Cst_customer cst)  throws Exception;

	public List<Orders> findOrderByCustId(int cust_id);

	public List<Orders_line> findOrderLinesById(int odr_id);
}
