package com.briup.web.controller.sale;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Salchance;
import com.briup.service.SalchanceService;
import com.briup.util.PageUtil;

@Controller
@RequestMapping("/sal")
public class SalChanceController {
	@Autowired
	private SalchanceService salchanceService;
	private PageUtil<Salchance> pu;
	private int pages;
	private static int curpage;
	private List<Salchance> chances;

	//分页查找所有的销售机会
	@RequestMapping("/chanceall")
	public String all(@RequestParam("curpage") int curpage, HttpSession session) {
		this.curpage = curpage;
		try {
			// 一页显示的所有用户 //起始下标
			pu = salchanceService.findSalchanceByPageService((curpage - 1) * 8, 8);

			// 得到总页数
			pages = pu.getPages();

			System.out.println("总页数" + pages);

			// 得到封装的类里面的数据
			chances = pu.getData();
			System.out.println(chances);
			System.out.println("接收到的数据是" + chances);
			session.setAttribute("pu", pu);
			session.setAttribute("chances", chances);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//跳转到list.jsp页面上
		return "pages/~sale/list";
	}
	
	//分页查找所有开发计划
	@RequestMapping("/chanceall2")
	public String all2(@RequestParam("curpage") int curpage, HttpSession session) {
		this.curpage = curpage;
		try {
			// 一页显示的所有用户 //起始下标
			pu = salchanceService.findSalchanceByPageService((curpage - 1) *  8,  8);

			// 得到总页数
			pages = pu.getPages();

			System.out.println("总页数" + pages);

			// 得到封装的类里面的数据
			chances = pu.getData();
			System.out.println(chances);
			System.out.println("接收到的数据是" + chances);
			session.setAttribute("pu", pu);
			session.setAttribute("chances", chances);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~sale/dev";
	}

	//将新建的销售机会信息存储到数据库中
	@RequestMapping("/chancesave")
	public String save(Salchance sc) {
		 System.out.println(sc+"/////////"); 
		try {
			salchanceService.saveChanceService(sc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sal/chanceall?curpage=" + curpage;
	}

	//指派销售机会
	@RequestMapping("/chancedispatch")
	public String dispatch(@RequestParam(value = "chc_id") int chc_id, HttpSession session) {
		// 从数据库查找相应编号的销售机会
		try {
			Salchance onech = salchanceService.findOneSalchance(chc_id);
			System.out.println(onech);
			session.setAttribute("onech", onech);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 显示到页面上
		return "pages/~sale/dispatch";
	}
	
	//将分派了指派人的销售机会存储到数据库中
	@RequestMapping("/dispatchupdate")
	public String dispatchsave(@RequestParam(value="chc_id") int chc_id,Salchance sc) {
		sc.setChc_id(chc_id);
		System.out.println("指定了指派人的销售机会"+sc+"/////////");
		try {
			salchanceService.updateChanceService(chc_id,sc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sal/chanceall?curpage=" + curpage;
	}
	
	@RequestMapping("/deletechance")
	public String delete(@RequestParam(value = "chc_id") int chc_id) {
		try {
			salchanceService.deleteSalchance(chc_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sal/chanceall?curpage=" + curpage;
	}

	@RequestMapping("/editchance")
	public String edit(@RequestParam(value = "chc_id") int chc_id, HttpSession session) {
		try {
			Salchance onech1 = salchanceService.findOneSalchance(chc_id);
			session.setAttribute("onech1", onech1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~sale/edit";
	}

	//保存修改的销售机会并且返回到原来页面查出所有的信息
	@RequestMapping("/editupdateandsave")
	public String editsave(Salchance sc) {
		System.out.println(sc+"//////////////////");
		try {
			salchanceService.updateChanceService2(sc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sal/chanceall?curpage=" + curpage;
	}

	@RequestMapping("/findByCon")
	public String findbyCon(@RequestParam("curpage") int curpage, HttpSession session, Salchance sc) {
		try {
			PageUtil<Salchance> pu = salchanceService.findSalPageByCon((curpage - 1) * 8, 8, sc);
			// 得到总页数
			pages = pu.getPages();

			System.out.println("总页数" + pages);

			// 得到封装的类里面的数据
			chances = pu.getData();
			System.out.println("得到封装的类里面的数据"+chances);
			System.out.println("接收到的数据是" + chances);
			session.setAttribute("pu", pu);
			session.setAttribute("chances", chances);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~sale/list";
	}
}
