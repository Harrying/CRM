package com.briup.dao;

import java.util.List;

import com.briup.bean.Cst_log;
import com.briup.util.PageUtil;


public interface LogDAO {
	public void addLogOne(Cst_log log) throws Exception;
	
	public List<Cst_log> queryAllLogPage(int curpage,int row) throws Exception;

	public int getAllRows() throws Exception;
	
	public List<Cst_log> getAllLog() throws Exception;
}
