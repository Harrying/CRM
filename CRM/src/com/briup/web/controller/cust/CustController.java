package com.briup.web.controller.cust;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Cst_activity;
import com.briup.bean.Cst_customer;
import com.briup.bean.Cst_linkman;
import com.briup.service.CustomerService;
import com.briup.util.PageUtil;

@Controller
@RequestMapping("/cust")
public class CustController {
	@Autowired
	private CustomerService customerService;
	private PageUtil<Cst_customer> pu;
	private List<Cst_customer> customers;
	private int lkm_cust_no;

	// 分页查询所有客户信息
	@RequestMapping("/findAllCustomer")
	public String findAllCustomer(@RequestParam(value = "curpage") int curpage, HttpSession session) {
		try {
			pu = customerService.findCstPage(curpage, 8);
			customers = pu.getData();
			session.setAttribute("pu", pu);
			session.setAttribute("customers", customers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/cust/list";
	}
	
	
	@RequestMapping("/findAllCustomer2")
	public String findAllCustomer2(HttpSession session) {
		try {
			List<Cst_customer> customers = customerService.findallCustomer();
			session.setAttribute("customers", customers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/service/add";
	}

	// 根据条件分页查询客户信息
	@RequestMapping("/findCstPageByCon")
	public String findCstPageByCon(@RequestParam(value = "curpage") int curpage, Cst_customer cc, HttpSession session) {
		System.out.println("接受到的顾客信息是" + cc);
		try {
			pu = customerService.findCustomerPageByCon(curpage, 8, cc);
			customers = pu.getData();
			session.setAttribute("pu", pu);
			session.setAttribute("customers", customers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/cust/list";
	}
	
	//新建客户
	@RequestMapping("/addCustomer")
	public String addCustomer(Cst_customer cst) {
		System.out.println("!!!");
		try {
			customerService.saveCustomer(cst);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cust/findAllCustomer?curpage=1";
	}
	
	// 编辑客户的信息
	@RequestMapping("/editcust")
	public String edit(@RequestParam(value ="cust_id") int cust_id, HttpSession session) {
		try {
			Cst_customer customer = customerService.findCustomerById(cust_id);
			System.out.println("后台查到的顾客信息" + customer);
			session.setAttribute("customer", customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/cust/customer_edit";
	}

	// 修改客户的信息
	@RequestMapping("/custchange")
	public String custchange(Cst_customer customer) {
		System.out.println("接收到的前台的客户信息" + customer);
		try {
			customerService.updateCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cust/findAllCustomer?curpage=1";
	}

	// 显示所有的联系人信息
	@RequestMapping("/findLinkman")
	public String findLinkman(@RequestParam(value = "cust_no") int cust_no, HttpSession session) {
		System.out.println(cust_no);
		try {
			List<Cst_linkman> linkmans = customerService.findAllLinkman(cust_no);
			for (Cst_linkman c : linkmans) {
				System.out.println("接受到的后台的联系人集合/////" + c);
			}
			session.setAttribute("linkmans", linkmans);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/cust/linkman";
	}

	// 对联系人信息进行编辑
	@RequestMapping("/editLinkman")
	public String editLinkman(@RequestParam(value = "lkm_id") int lkm_id, HttpSession session) {
		System.out.println(lkm_id);
		try {
			Cst_linkman linkman = customerService.findLinkmanById(lkm_id);
			session.setAttribute("linkman", linkman);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/cust/linkman_edit";
	}

	// 对联系人信息进行修改
	@RequestMapping("/updateLinkman")
	public String updateLinkman(Cst_linkman link, HttpSession session) {
		try {
			customerService.updateLinkman(link);
			// 将联系人存储到session中,下次删除时,获取到相应的顾客编号
			session.setAttribute("link", link);
			/*Cst_customer cus = new Cst_customer();*/
			lkm_cust_no = link.getLkm_cust_no();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/cust/findLinkman?cust_no=" + lkm_cust_no;
	}

	// 删除联系人
	@RequestMapping("/deleteLinkman")
	public String deleteLinkman(@RequestParam(value = "lkm_id") int lkm_id,
			@RequestParam(value = "cust_no") int cust_no) {
		System.out.println("接受到的联系人的编号是" + lkm_id + "//////////");
		System.out.println(cust_no);
		try {
			customerService.deleteLinkMan(lkm_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/cust/findLinkman?cust_no=" + cust_no;
	}

	// 新建联系人 保存到数据库
	@RequestMapping("/saveNewLinkman")
	public String saveNewLinkman(Cst_linkman lkm, @RequestParam(value = "cust_no") int cust_no) {
		try {
			System.out.println(cust_no);
			/*lkm.setLkm_cust_id(cust_no);*/
			lkm.setLkm_cust_no(cust_no);
			customerService.saveLinkMan(lkm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/cust/findLinkman?cust_no=" + cust_no;
	}

	// 显示所有的活动记录
	@RequestMapping("/findAllActivity")
	public String findActivity(@RequestParam(value ="cust_no") int cust_no, HttpSession session) {
		try {
			List<Cst_activity> acvs = customerService.findAllAcv(cust_no);
			for (Cst_activity c : acvs) {
				System.out.println("接受到的后台的联系人集合/////" + c);
			}
			session.setAttribute("acvs", acvs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/cust/activities";
	}

	// 编辑一个活动记录
	@RequestMapping("/findOneActivity")
	public String findOneActivity(@RequestParam(value = "atv_id") int atv_id, HttpSession session) {
		try {
			Cst_activity acv = customerService.findAtvById(atv_id);
			session.setAttribute("acv", acv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~cust/cust/activities_edit";
	}

	// 删除一个活动记录
	@RequestMapping("/deleteOneActivity")
	public String deleteOneActivity(@RequestParam(value = "atv_id") int atv_id,
			@RequestParam(value = "cust_no") int cust_no, HttpSession session) {
		System.out.println("删除一个活动记录//////"+atv_id + cust_no);
		try {
			customerService.deleteAtv(atv_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/cust/findAllActivity?cust_no=" + cust_no;
	}

	// 保存修改的活动记录信息
	@RequestMapping("/saveActivity")
	public String saveActivity(Cst_activity activity) {
		int cust_no = 0;
		try {
			customerService.updateAtv(activity);
			cust_no = activity.getAtv_cust_no();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/cust/findAllActivity?cust_no=" + cust_no;
	}

	// 删除客户信息
	@RequestMapping("/deleteCustomer")
	public String deleteCustomer(@RequestParam(value = "cust_no") int cust_no) {
		System.out.println("顾客的id是" + cust_no + "顾客的id是");
		try {
			customerService.deleteCustomerById(cust_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/cust/findAllCustomer?curpage=1";
	}

	// 新建活动记录 保存到数据库
	@RequestMapping("/saveNewActivity")
	public String saveNewActivity(Cst_activity act, @RequestParam(value ="cust_no") int cust_no) {
		System.out.println("接收到的前台的活动记录"+act);
		try {
			act.setAtv_cust_no(cust_no);
			/*act.setAtv_cust_id(cust_no);*/
			customerService.saveCst_activity(act);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cust/findAllActivity?cust_no=" + cust_no;
	}

}
