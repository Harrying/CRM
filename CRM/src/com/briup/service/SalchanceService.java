package com.briup.service;

import java.io.Serializable;
import java.util.List;

import com.briup.bean.Cst_customer;
import com.briup.bean.Salchance;
import com.briup.bean.Salplan;
import com.briup.util.PageUtil;

public interface SalchanceService {
	 public void saveChanceService(Salchance sc) throws Exception;
	 public void saveCustomerService(Cst_customer cc) throws Exception;
	 
     public int getAllRows() throws Exception;
     public int getAllRowss() throws Exception;
	 public PageUtil<Salchance> findSalchanceByPageService(int curpage,int row) throws Exception;
	 public List<Salplan> findAllSalPlan() throws Exception;
	 public List<Salplan> findSalPlans(Serializable chc_id) throws Exception;
	 public PageUtil<Salplan> findSalplanByPageService(int curpage,int row) throws Exception;
	 public void updateChanceService(Serializable chc_id,Salchance sc) throws Exception;
	 public void updateChanceService2(Salchance sc) throws Exception;
	 public Salchance findOneSalchance(Serializable chc_id) throws Exception;
	 public Salplan findSalplan(Serializable chc_id) throws Exception;
	 public void deleteSalchance(Serializable chc_id) throws Exception;
	 
	 public void savePlanService(Salplan sp) throws Exception;
	 public void deleteSalplanService(Serializable pla_id) throws Exception;
	 public void updateSalplanService(Salplan sp) throws Exception;
	 public void updateSalplanService(Serializable pla_chc_id) throws Exception;
	 public PageUtil<Salchance> findSalPageByCon(int curpage,int row,Salchance sc)throws Exception;
}
