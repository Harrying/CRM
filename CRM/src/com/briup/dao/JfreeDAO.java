package com.briup.dao;

import java.util.List;
import java.util.Set;


import com.briup.bean.Cst_customer;
import com.briup.bean.Orders;
import com.briup.bean.Orders_line;
import com.briup.bean.Product;

public interface JfreeDAO {
public Cst_customer findCustomer(String cust_name) throws Exception;
public Set<Orders> findOrders(String cust_name) throws Exception;
public Set<Orders_line> findOrdersLine(int order_id) throws Exception;
public Product findProduct(int prod_id) throws Exception;
public int findAllCustomer() throws Exception;
//客户等级
public List<String> findCustomerLevel() throws Exception;
public int findCustomerLevel2(String level) throws Exception;
//客户信用
public List<Integer> findCustomerCredit() throws Exception;
public int findCustomerCredit2(int credit) throws Exception;
//客户满意度
public List<Integer> findCustomerSatisify() throws Exception;
public int findCustomerSatisify2(int satisify) throws Exception;
}
