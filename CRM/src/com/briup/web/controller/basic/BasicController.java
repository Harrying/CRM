package com.briup.web.controller.basic;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.bean.Product;
import com.briup.bean.Storage;
import com.briup.service.DictService;
import com.briup.util.PageUtil;

@Controller
@RequestMapping("/basic")
public class BasicController{
	
	@Autowired
	private DictService dictService;
	private PageUtil<Product> pu;
	private PageUtil<Storage> pu1;
    private List<Product> products;
    private List<Storage> storages;
	
	@RequestMapping("/findProduct")
	public String findProduct(@RequestParam(value="curpage") int curpage,HttpSession session){
	    try {
			pu = dictService.findProductAll(curpage, 8);
			products = pu.getData();
			session.setAttribute("pu", pu);
			session.setAttribute("products", products);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "pages/~basd/product"; 
	}
	
	@RequestMapping("/findStorage")
	public String findStorage(@RequestParam(value="curpage") int curpage,HttpSession session){
	    try {
			pu1 = dictService.findStorageAll(curpage, 8);
			storages = pu1.getData();
			session.setAttribute("pu1", pu1);
			session.setAttribute("storages", storages);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "pages/~basd/storage"; 
	}
	
	@RequestMapping("/findProductByCon")
	public String findProductByCon(Product pd,@RequestParam(value="curpage") int curpage,HttpSession session){
		try {
			 pu = dictService.findProduct(pd, curpage, 8);
			 products = pu.getData();
			 session.setAttribute("pu", pu);
			 session.setAttribute("products", products);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~basd/product"; 
	}
	
	
	@RequestMapping("/findStorageByCon")
	public String findStorageByCon(Storage st,@RequestParam(value="curpage") int curpage,HttpSession session){
		try {
			 pu1 = dictService.findStorage(st, curpage, 8);
			 storages = pu1.getData();
			 session.setAttribute("pu1", pu1);
			 session.setAttribute("storages", storages);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~basd/storage";
	}
	
	
}


