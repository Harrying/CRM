package com.briup.dao;

import java.io.Serializable;
import java.util.List;

import com.briup.bean.Cst_customer;
import com.briup.bean.Salchance;
import com.briup.bean.Salplan;

public interface SalDao {
	 public void saveChance(Salchance sc);
	 public void saveCustomer(Cst_customer cc);
	 
	 public int getAllRows() throws Exception;
	 public int getAllRowss() throws Exception;
	 public List<Salchance> findSalchanceByPage(int curPage,int row);
	 public List<Salplan> findAllSalplan();
	 public List<Salplan> findSalPlans(Serializable chc_id) throws Exception;
	 public Salchance queryOneSalchance(Serializable chc_id);
	 public Salplan querySalplan(Serializable pla_chc_id);
	 public void updatechance(Serializable chc_id,Salchance sc);
	 public void updatechance2(Salchance sc);
	 public void deleteSalchance(Serializable chc_id);
	 
	 public void savePlan(Salplan sp);
	 public void deleteSalplan(Serializable pla_id);
	 public void updateSalplan(Salplan sp);
	 public void updateSalplan2(Serializable pla_chc_id);
	 
	 public List<Salchance> querySalPageByCon(int curpage,int row,Salchance sc);
}
