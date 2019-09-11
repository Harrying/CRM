package com.briup.service.Impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Condition;
import com.briup.bean.Cst_customer;
import com.briup.bean.Cst_service;
import com.briup.bean.Sys_user;
import com.briup.dao.Cst_serviceDao;
import com.briup.service.Cst_serviceService;
import com.briup.util.PageUtil;

@Service("/Cst_serviceService")
public class Cst_serviceServiceImpl implements Cst_serviceService{
	@Autowired
     private Cst_serviceDao cdao;
	
	//创建服务
	@Override
	public void save(Cst_service cst_service) throws Exception {
		cdao.save(cst_service);
	}
	
	 //查找所有新建的服务
	@Override
	public PageUtil<Cst_service> findAll(int curPage, int row) throws Exception {
		List<Cst_service> services = cdao.findAll((curPage-1)*row, row);
		PageUtil<Cst_service> pu = new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(services);
		pu.setROW(row);
		pu.setRows(getAllRows());
		return pu;
	}
	
	@Override
	public int getAllRows() throws Exception{
		return cdao.getAllRows();
	}
	
	@Override
	public int getAllRowss(Cst_service con) throws Exception{
		return cdao.getAllRowss(con);
	}
	
	@Override
	public int getAllRowss1(Cst_service con) throws Exception{
		return cdao.getAllRowss1(con);
	}
	
	@Override
	public List<Sys_user> findAllManagerName() throws Exception {
		return cdao.findAllManagerName();
	}
	
	//更新服务
	@Override
	public void updateCst_service(Cst_service cst_service) throws Exception {
		cdao.updateCst_service(cst_service);
	}
	
	//删除服务
	@Override
	public void delete(Serializable svr_id) throws Exception {
		System.out.println(svr_id);
		cdao.delete(svr_id);
	}

	//根据条件查找
	@Override
	public PageUtil<Cst_service> findByHQLCondition(Cst_service con, int curPage, int row) throws Exception {
		List<Cst_service> services = cdao.findByHQLCondition(con, (curPage-1)*row, row);
		PageUtil<Cst_service> pu = new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(services);
		pu.setROW(row);
		pu.setRows(getAllRowss(con));
		return pu;
	}
	
	@Override
	public PageUtil<Cst_service> findByHQLCondition1(Cst_service con, int curPage, int row) throws Exception {
		List<Cst_service> services = cdao.findByHQLCondition1(con, (curPage-1)*row, row);
		PageUtil<Cst_service> pu = new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(services);
		pu.setROW(row);
		pu.setRows(getAllRowss1(con));
		return pu;
	}

	@Override
	public PageUtil<Cst_service> findByfp(int curPage, int row) throws Exception {
		List<Cst_service> services = cdao.findByfp((curPage-1)*row, row);
		PageUtil<Cst_service> pu = new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(services);
		pu.setROW(row);
		pu.setRows(getAllRows2());
		return pu;
	}
	
	@Override
	public int getAllRows2() throws Exception{
		return cdao.getAllRows2();
	}

	@Override
	public PageUtil<Cst_service> findByHQLCondition2(Cst_service con, int curPage, int row) throws Exception {
		List<Cst_service> services = cdao.findByHQLCondition2(con,(curPage-1)*row, row);
		PageUtil<Cst_service> pu = new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(services);
		pu.setROW(row);
		pu.setRows(getAllRows2());
		return pu;
	}
	
	//分页查找所有已经处理的服务
	@Override
	public PageUtil<Cst_service> findBycl(int curPage, int row) throws Exception {
		List<Cst_service> services = cdao.findBycl((curPage-1)*row, row);
		/*for(Cst_service c:services){
			System.out.println(c);
		}*/
		PageUtil<Cst_service> pu = new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(services);
		pu.setROW(row);
		pu.setRows(getAllRows3());
		return pu;
	}

	@Override
	public int getAllRows3() throws Exception{
		return cdao.getAllRows3();
	}

	@Override
	public Cst_service queryOneByid(Serializable svr_id) {
		return cdao.queryOneByid(svr_id);
	}

	@Override
	public void updateinfo(Cst_service cst_service) throws Exception {
		cdao.updateinfo(cst_service);
	}

	@Override
	public void Dealresult(Cst_service cst_service) throws Exception {
		cdao.Dealresult(cst_service);
	}

	
	
	/*//查找所有已经归档的服务
	@Override
	public PageUtil<Cst_service> findBygd(int curPage, int row) throws Exception {
		List<Cst_service> services = cdao.findBygd((curPage-1)*row, row);
		PageUtil<Cst_service> pu = new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(services);
		pu.setROW(row);
		pu.setRows(getAllRows4());
		return pu;
	}
	
	@Override
	public int getAllRows4() throws Exception{
		return cdao.getAllRows4();
	}*/

}
