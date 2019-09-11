package com.briup.web.controller.system;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Cst_log;
import com.briup.service.LogService;
import com.briup.util.PageUtil;

@Controller
@RequestMapping("/log")
public class LogController {
	
	@Autowired
	private LogService logService;
	private PageUtil<Cst_log> pu;
	private int pages;
	private List<Cst_log> logs;
	private static int curpage;
	
	@RequestMapping("/logall")
	public String all(@RequestParam(value="curpage") int curpage,HttpSession session) {
		  this.curpage = curpage;
		try {
			pu = logService.findAllLogPage((curpage-1)*20, 20);
			logs = pu.getData();
			session.setAttribute("pu", pu);
			session.setAttribute("logs", logs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~systemset/log_review";
	}
	
	
}
