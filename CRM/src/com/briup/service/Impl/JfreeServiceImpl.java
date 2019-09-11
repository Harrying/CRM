package com.briup.service.Impl;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Cst_customer;
import com.briup.bean.Orders;
import com.briup.bean.Orders_line;
import com.briup.bean.Product;
import com.briup.dao.JfreeDAO;
import com.briup.service.JfreeService;

@Service("JfreeService")
public class JfreeServiceImpl implements JfreeService {

	@Autowired
	private JfreeDAO jdao;
	/*
	 * 客户贡献
	 */
	@Override
	public CategoryDataset findCstcontribute(String cust_name) throws Exception {
		// 创建出dataset对象
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		Cst_customer cst = jdao.findCustomer(cust_name);

		// sum 将来生成Y轴的订单金额
		float sum = 0;

		// 订单的获取和遍历
		Set<Orders> ods = jdao.findOrders(cust_name);
		for (Orders o : ods) {
			int odr_id = o.getOdr_id();
			Set<Orders_line> ordersLine = jdao.findOrdersLine(odr_id);
			// System.out.println(ordersLine+"////////////");
			for (Orders_line ol : ordersLine) {
				int prod_id = ol.getProd_id();
				int odd_count = ol.getOdd_count();
				Product p = jdao.findProduct(prod_id);
				// System.out.println(p+"............");
				float price = p.getProd_price();
				sum += odd_count * price;
			}
		}                   
		                 //Y轴                          x轴
		dataset.addValue(sum, "客户贡献", cust_name);
		return dataset;
	}

	/*
	 * 客户构成
	 */
	@Override
	public CategoryDataset findCstMakeup(int condit) throws Exception {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		// 找到所有的顾客
		int count = jdao.findAllCustomer();
		// 按等级进行划分
		if (condit == 0) {
			List<String> level = jdao.findCustomerLevel();
			for (String s : level) {
				int num = jdao.findCustomerLevel2(s);
				double per = (double) num / count;
				System.out.println(per);
				dataset.addValue(per, "客户等级百分比", s);
			}
		// 按信用度进行划分
		} else if (condit == 1) {
			List<Integer> credit = jdao.findCustomerCredit();
			for (Integer i : credit) {
				int num1 = jdao.findCustomerCredit2(i);
				double per2 = (double) num1 / count;
				dataset.addValue(per2, "客户信用度百分比", i);
			}
	    // 按满意度进行划分
		} else if (condit == 2) {
			List<Integer> satisify = jdao.findCustomerSatisify();
			for (Integer ii : satisify) {
				int num2 = jdao.findCustomerSatisify2(ii);
				double per3 = (double) num2 / count;
				dataset.addValue(per3, "客户信用度百分比", ii);
			}
		}
		return dataset;
	}
}
