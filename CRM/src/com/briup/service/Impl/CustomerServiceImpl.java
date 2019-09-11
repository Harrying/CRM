package com.briup.service.Impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Condition;
import com.briup.bean.Cst_activity;
import com.briup.bean.Cst_customer;
import com.briup.bean.Cst_linkman;
import com.briup.bean.Orders;
import com.briup.bean.Orders_line;
import com.briup.bean.Sys_user;
import com.briup.dao.CustomerDAO;
import com.briup.service.CustomerService;
import com.briup.util.PageUtil;


@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService{
    @Autowired
    private CustomerDAO sdao;
	
	
	@Override
	public List<Cst_customer> findallCustomer() throws Exception {
		return sdao.allCustomer();
	}

	@Override
	public List<Cst_customer> findCustomerPage(int curpage, int row) throws Exception {
		return null;
	}

	//根据id查找顾客的信息
	@Override
	public Cst_customer findCustomerById(Serializable id) throws Exception {
		return sdao.queryCustomerById(id);
	}

	//更新顾客的信息
	@Override
	public void updateCustomer(Cst_customer c) throws Exception {
		sdao.updateCustomer(c);
	}

	@Override
	public void saveLinkMan(Cst_linkman lkm) throws Exception {
		sdao.addLinkMan(lkm);
	}

	@Override
	public void deleteLinkMan(Serializable id) throws Exception {
		sdao.deleteLinkMan(id);
	}

	
	
	@Override
	public Cst_linkman findLinkmanById(Serializable id) throws Exception {
		System.out.println(sdao.queryLinkmanById(1)+"接收到的联系人是");
		return sdao.queryLinkmanById(id);
	}

	@Override
	public void updateLinkman(Cst_linkman lkm) throws Exception {
		sdao.updateLinkman(lkm);
	}

	//根据id删除顾客
	@Override
	public void deleteCustomerById(Serializable id) throws Exception {
		sdao.delCustomerById(id);
	}

	@Override
	public void saveCst_activity(Cst_activity av) throws Exception {
		sdao.addCst_activity(av);
	}

	@Override
	public Cst_activity findAtvById(Serializable atv_id) throws Exception {
		return sdao.queryAtvById(atv_id);
	}

	@Override
	public void updateAtv(Cst_activity at) throws Exception {
		sdao.updateAtv(at);
	}

	@Override
	public void deleteAtv(Serializable atv_id) throws Exception {
		sdao.deleteAtv(atv_id);
	}

	@Override
	public PageUtil<Cst_customer> findCstPage(int curpage, int row) throws Exception {
		List<Cst_customer> customers = sdao.customerPage((curpage-1)*row, row);
 		PageUtil<Cst_customer> pu = new PageUtil<>();
 		pu.setCurPage(curpage);
 		pu.setData(customers);
 		pu.setROW(row);
 		pu.setRows(getAllRows());
		return pu;
	}

	@Override
	public Orders findOrderById(Serializable id) throws Exception {
		return null;
	}

	@Override
	public PageUtil<Cst_customer> findCstPageByCon(int curpage, int row, Condition con) throws Exception {
		return null;
	}

	

	@Override
	public List<Sys_user> findSys_user() throws Exception {
		return null;
	}

	@Override
	public void saveCustomer(Cst_customer cst) throws Exception {
		sdao.addCustomer(cst);
	}

	
	@Override
	public List<Orders> findOrderByCustId(int cust_id) {
		return null;
	}

	@Override
	public List<Orders_line> findOrderLinesById(int odr_id) {
		return null;
	}

	@Override
	public int getAllRows() throws Exception {
		
		return sdao.getAllRows();
	}

	//根据条件分页查询顾客信息
	@Override
	public PageUtil<Cst_customer> findCustomerPageByCon(int curpage, int row, Cst_customer cc) throws Exception {
		 List<Cst_customer> customers = sdao.findCustomerPageByCon((curpage-1)*row, row, cc);
		 PageUtil<Cst_customer> pu =new PageUtil<>();
		 pu.setCurPage(curpage);
		 pu.setData(customers);
		 pu.setROW(row);
		 pu.setRows(getAllRows());
		 return pu;
	}

	//返回一个联系人的集合
	@Override
	public List<Cst_linkman> findAllLinkman(Serializable id) throws Exception {
		return sdao.allLinkman(id);
	}

	@Override
	public List<Cst_activity> findAllAcv(Serializable atv_cust_no) throws Exception {
		return sdao.queryAllAcv(atv_cust_no);
	}

}
