package com.briup.web.controller.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Cst_service;
import com.briup.bean.Sys_user;
import com.briup.service.Cst_serviceService;
import com.briup.util.PageUtil;

@Controller
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	private Cst_serviceService cstService;

	// 服务创建
	@RequestMapping("/addServiceController")
	public String addService(Cst_service cst_service) {
		try {
			cstService.save(cst_service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/add";
	}

	// 寻找所有的新建服务
	@RequestMapping("/findAll")
	public String findAllService(@RequestParam(value = "curpage") int curpage, HttpSession session) {
		try {
			PageUtil<Cst_service> pu = cstService.findAll(curpage, 6);
			List<Cst_service> services = pu.getData();
			List<Sys_user> mns = cstService.findAllManagerName();
			session.setAttribute("pu", pu);
			session.setAttribute("services", services);
			session.setAttribute("mns", mns);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/dispatch";
	}

	// 更新已分配的服务
	@RequestMapping("/updateService")
	public String updateService(Cst_service cst_service) {
		try {
			cstService.updateCst_service(cst_service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/service/findAll?curpage=1";
	}

	@RequestMapping("/deleteOneService")
	public String deleteOneService(@RequestParam(value="svr_id") int svr_id) {
		try {
			cstService.delete(svr_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		;
		return "redirect:/service/findAll?curpage=1";
	}
	
	// 根据条件查找
	@RequestMapping("/findByCon")
	public String findByCon(Cst_service cst_service, @RequestParam(value = "curpage") int curpage,
			HttpSession session) {
		try {
			PageUtil<Cst_service> pu = cstService.findByHQLCondition(cst_service, curpage, 6);
			List<Cst_service> services = pu.getData();
			System.out.println(services + "controller");
			List<Sys_user> mns = cstService.findAllManagerName();
			session.setAttribute("pu", pu);
			session.setAttribute("services", services);
			session.setAttribute("mns", mns);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/dispatch";
	}

	// 寻找所有已分配的服务
	@RequestMapping("/findAllFp")
	public String findAllFpService(@RequestParam(value = "curpage") int curpage, HttpSession session) {
		try {
			PageUtil<Cst_service> pu = cstService.findByfp(curpage, 6);
			List<Cst_service> services = pu.getData();
			session.setAttribute("pu", pu);
			session.setAttribute("services", services);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/deal";
	}

	@RequestMapping("/queryOneByid")
	public String queryOneByid(@RequestParam(value = "svr_id") int svr_id, HttpSession session) {
		try {
			Cst_service service = cstService.queryOneByid(svr_id);
			session.setAttribute("service", service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/deal_detail";
	}

	// 更新处理
	@RequestMapping("/updatedeal")
	public String updatedeal(Cst_service cst_service, HttpSession session) {
		try {
			cstService.updateinfo(cst_service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/service/findAllFp?curpage=1";
	}

	// 服务反馈(查找所有已经处理的服务)
	@RequestMapping("/findFeedback")
	public String findFeedBack(@RequestParam(value = "curpage") int curpage, HttpSession session) {
		try {
			PageUtil<Cst_service> pu = cstService.findBycl(curpage, 6);
			List<Cst_service> services = pu.getData();
			session.setAttribute("pu", pu);
			session.setAttribute("services", services);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/feedback";
	}

	// 服务反馈
	@RequestMapping("/queryOne")
	public String queryOne(@RequestParam(value = "svr_id") int svr_id, HttpSession session) {
		try {
			Cst_service cst = cstService.queryOneByid(svr_id);
			session.setAttribute("cst", cst);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/feedback_detail";
	}

	// 服务满意度评价
	@RequestMapping("/service_deal")
	public String service_deal(Cst_service cst_service) {
		try {
			cstService.Dealresult(cst_service);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/service/findFeedback?curpage=1";
	}

}
