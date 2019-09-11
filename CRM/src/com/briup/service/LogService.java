package com.briup.service;

import java.util.List;

import com.briup.bean.Cst_log;
import com.briup.util.PageUtil;


public interface LogService {
	public void saveLogOne(Cst_log log) throws Exception;
	
	public PageUtil<Cst_log> findAllLogPage(int curpage,int row) throws Exception;

	public int getAllRows() throws Exception;
	
	public List<Cst_log> findAllLog() throws Exception;
}
