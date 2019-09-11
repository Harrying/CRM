
package com.briup.service.Impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Cst_customer;
import com.briup.bean.Salchance;
import com.briup.bean.Salplan;
import com.briup.dao.SalDao;
import com.briup.service.SalchanceService;
import com.briup.util.PageUtil;

@Service("salchanceService")
public class SalchanceServiceImpl implements SalchanceService {
	@Autowired
	private SalDao saldao;

	@Override
	public void saveChanceService(Salchance sc) throws Exception {
		saldao.saveChance(sc);
	}

	@Override
	public void saveCustomerService(Cst_customer cc) throws Exception {

	}

	// 分页查找有销售机会
	@Override
	public PageUtil<Salchance> findSalchanceByPageService(int curpage, int row) throws Exception {
		List<Salchance> chance = saldao.findSalchanceByPage(curpage, row);
		/* System.out.println(chance); */
		PageUtil<Salchance> pu = new PageUtil<>();
		// 当前页
		pu.setCurPage(curpage / 8 + 1);
		// 一页的行数
		pu.setROW(row);
		// 得到所有的行数
		int rows = getAllRows();
		pu.setRows(rows);
		// 页面里的数据
		pu.setData(chance);
		return pu;
	}

	@Override
	public int getAllRows() throws Exception {
		return saldao.getAllRows();
	}

	@Override
	public int getAllRowss() throws Exception {
		return saldao.getAllRowss();
	}

	@Override
	public void updateChanceService(Serializable chc_id,Salchance sc) throws Exception {
		System.out.println("ididididd"+chc_id);
		saldao.updatechance(chc_id,sc);
	}

	@Override
	public Salchance findOneSalchance(Serializable chc_id) throws Exception {
		/* System.out.println("查找到了销售一个机会"+saldao.queryOneSalchance(chc_id)); */
		return saldao.queryOneSalchance(chc_id);
	}

	@Override
	public void deleteSalchance(Serializable chc_id) throws Exception {
		saldao.deleteSalchance(chc_id);
	}

	@Override
	public void savePlanService(Salplan sp) throws Exception {
        saldao.savePlan(sp);
	}

	@Override
	public void deleteSalplanService(Serializable pla_id) throws Exception {
		saldao.deleteSalplan(pla_id);

	}

	@Override
	public void updateSalplanService(Salplan sp) throws Exception {
		saldao.updateSalplan(sp);
	}

	// 根据条件查找机会
	@Override
	public PageUtil<Salchance> findSalPageByCon(int curpage, int row, Salchance sc) throws Exception {
		List<Salchance> chance = saldao.querySalPageByCon(curpage, row, sc);
		/* System.out.println("根据条件查找到的销售机会"+chance); */
		PageUtil<Salchance> pu = new PageUtil<>();
		// 当前页
		pu.setCurPage(curpage / 8 + 1);
		// 一页的行数
		pu.setROW(row);
		// 得到所有的行数
		int rows = getAllRows();
		pu.setRows(rows);
		// 页面里的数据
		pu.setData(chance);
		return pu;
	}

	// 查找所有计划的执行状态
	@Override
	public List<Salplan> findAllSalPlan() throws Exception {
		return saldao.findAllSalplan();
	}

	@Override
	public PageUtil<Salplan> findSalplanByPageService(int curpage, int row) throws Exception {

		return null;
	}

	@Override
	public Salplan findSalplan(Serializable chc_id) throws Exception {
		return saldao.querySalplan(chc_id);
	}

	@Override
	public void updateSalplanService(Serializable pla_id) throws Exception {
		saldao.updateSalplan2(pla_id);
	}

	//根据销售机会查找对应的开发计划集合
	@Override
	public List<Salplan> findSalPlans(Serializable chc_id) throws Exception {
		return saldao.findSalPlans(chc_id);
	}

	@Override
	public void updateChanceService2(Salchance sc) throws Exception {
		saldao.updatechance2(sc);
	}

}
