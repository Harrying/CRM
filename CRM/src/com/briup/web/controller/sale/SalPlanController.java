package com.briup.web.controller.sale;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Salchance;
import com.briup.bean.Salplan;
import com.briup.service.SalchanceService;
import com.briup.util.PageUtil;

@Controller
@RequestMapping("/sal")
public class SalPlanController {

	@Autowired 
	private SalchanceService salchanceService;
	private int pages;
	private List<Salchance> chances;
	private List<Salplan> plans;

	//制定计划
	@RequestMapping("/doplan")
	public String doplan(@RequestParam(value ="chc_id") int chc_id,HttpSession session) {
		     //从数据库查找相应编号的销售机会
		try {
			Salchance onech = salchanceService.findOneSalchance(chc_id);
			session.setAttribute("onech", onech);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~sale/dev_plan";
	}
	
	
	//执行计划
    @RequestMapping("/todoplan")
	public String todoplan(@RequestParam(value="chc_id") int chc_id,HttpSession session,HttpServletRequest request){
    	  System.out.println(chc_id);
		try {
			Salchance sc = salchanceService.findOneSalchance(chc_id);
			Salplan salplan = salchanceService.findSalplan(chc_id);
			session.setAttribute("sc", sc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "pages/~sale/dev_execute";
	}
    
    //保存销售计划内容
    @RequestMapping("/saveplan")
    public String savePlan(Salplan sp){
    	System.out.println("......................");
    	System.out.println("接受到的前台的plan对象的编号是"+sp.getPla_chc_id());
    	System.out.println("接受到的前台的plan对象的计划内容"+sp.getPla_todo());
    	try {
    		salchanceService.savePlanService(sp);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return "pages/~sale/dev_execute";
    }
   
    //更新销售计划内容
    @RequestMapping("/updateplan")
    public String updatePlan(Salplan sp){
    	System.out.println("接受到的前台的plan对象的编号是"+sp.getPla_chc_id());
    	System.out.println("接受到的前台的plan对象的计划内容"+sp.getPla_todo());
    	try {
    		salchanceService.updateSalplanService(sp);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return "redirect:/sal/chanceall2?curpage=1";
    }
    
    //查看开发成功的销售计划
    @RequestMapping("/findOnePlan")
	public String findOneplan(@RequestParam(value ="chc_id") int chc_id, HttpSession session) {
		// 从数据库查找相应编号的销售机会
		try {
			Salchance onech = salchanceService.findOneSalchance(chc_id);
			/*System.out.println(onech);*/
			//查找每个销售机会对应的开发计划
		    plans = salchanceService.findSalPlans(chc_id);
			session.setAttribute("plans", plans);
			session.setAttribute("onech", onech);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 显示到页面上
		return "pages/~sale/dev_detail";
	}
    
   //更新销售计划状态
    @RequestMapping("/updateplan2")
	public String updatePlan2(@RequestParam(value="chc_id") int chc_id){
		System.out.println("接受到的前台的plan2对象的编号是"+chc_id);
		try {
			salchanceService.updateSalplanService(chc_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~sale/dev_execute";
	}
    
    
    @RequestMapping("/deleteplan")
	public String deleteplan(@RequestParam(value="chc_id") int chc_id,HttpSession session){
		try {
			salchanceService.deleteSalchance(chc_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "pages/~sale/dev_execute";
	}
    
    //更新计划结果
	@RequestMapping("/updateplanresult")
	public String updatePlanResult(Salplan sp){
		System.out.println("接受到的前台的plan对象"+sp);
		try {
			salchanceService.updateSalplanService(sp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~sale/dev_execute";
	}
	
	
	@RequestMapping("/findByCon2")
	public String findbyCon2(@RequestParam("curpage") int curpage, HttpSession session, Salchance sc) {
		try {
			PageUtil<Salchance> pu = salchanceService.findSalPageByCon((curpage - 1) * 8, 8, sc);
			// 得到总页数
			pages = pu.getPages();

			/*System.out.println("总页数" + pages);*/
			// 得到封装的类里面的数据
			chances = pu.getData();
			/*System.out.println("得到封装的类里面的数据"+chances);
			System.out.println("接收到的数据是" + chances);*/
			session.setAttribute("pu", pu);
			session.setAttribute("chances", chances);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~sale/dev";
	}
	
}
