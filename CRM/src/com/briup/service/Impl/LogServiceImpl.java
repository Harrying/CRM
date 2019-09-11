package com.briup.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Cst_log;
import com.briup.dao.LogDAO;
import com.briup.service.LogService;
import com.briup.util.PageUtil;


@Service("logService")
public class LogServiceImpl implements LogService{

	@Autowired 
	private LogDAO logdao;
	
	
	@Override
	public void saveLogOne(Cst_log log) throws Exception {
		logdao.addLogOne(log);
	}

	@Override
	public PageUtil<Cst_log> findAllLogPage(int curpage, int row) throws Exception {
		List<Cst_log> logs = logdao.queryAllLogPage(curpage, row);
		System.out.println(logs+"----------");
	    PageUtil<Cst_log> pu=new PageUtil<Cst_log>();
	    //当前页
		pu.setCurPage(curpage/20+1);
		//一页的行数
		pu.setROW(row);
		//得到所有的行数
		int rows = getAllRows();
		pu.setRows(rows);
		//页面里的数据
		pu.setData(logs);
		return pu;
	}
	
	@Override
	public int getAllRows() throws Exception {
		return logdao.getAllRows();
	}

	@Override
	public List<Cst_log> findAllLog() throws Exception {
		return null;
	}
}
