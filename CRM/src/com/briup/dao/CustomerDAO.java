package com.briup.dao;

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

public interface CustomerDAO {
	public List<Cst_customer> allCustomer() throws Exception;
	public int getAllRows() throws Exception;
	public List<Cst_customer> customerPage(int curpage,int row) throws Exception;
	public List<Cst_customer> findCustomerPageByCon(int curpage, int row,Cst_customer cc) throws Exception;
	public Cst_customer queryCustomerById(Serializable id)throws Exception;
	public void updateCustomer(Cst_customer c) throws Exception;
	public void addLinkMan(Cst_linkman lkm) throws Exception;
	public void deleteLinkMan(Serializable id) throws Exception;
	public List<Cst_linkman> allLinkman(Serializable id) throws Exception; 
	public Cst_linkman queryLinkmanById(Serializable id) throws Exception;
	public void updateLinkman(Cst_linkman lkm) throws Exception;
	public void delCustomerById(Serializable id) throws Exception;
	public void addCst_activity(Cst_activity av) throws Exception;
	public List<Cst_activity> queryAllAcv(Serializable atv_cust_no) throws Exception;
	public Cst_activity queryAtvById(Serializable atv_id) throws Exception;
	public void updateAtv(Cst_activity at) throws Exception;
	public void deleteAtv(Serializable atv_id) throws Exception;
	public PageUtil<Cst_customer> queryCstPage(int curpage,int row) throws Exception;
	public Orders queryOrderById(Serializable id) throws Exception;
	public PageUtil<Cst_customer> queryCstPageByCon(int curpage,int row,Condition con) throws Exception;
	public List<Sys_user> querySys_user() throws Exception;
	public void addCustomer(Cst_customer cst) throws Exception;
	public List<Orders> findOrderByCustId(int cust_id);
	public List<Orders_line> findOrderLinesById(int odr_id);
}
