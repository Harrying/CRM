package com.briup.bean;

import java.io.Serializable;


public class Storage implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer stk_id;
	private String stk_warehourse;
	private Integer stk_count;
	private String stk_memo;
	private String stk_ware;
	private Product skt_product_id;
	private String stk_name;
	public Integer getStk_id() {
		return stk_id;
	}
	public void setStk_id(Integer stk_id) {
		this.stk_id = stk_id;
	}
	public String getStk_warehourse() {
		return stk_warehourse;
	}
	public void setStk_warehourse(String stk_warehourse) {
		this.stk_warehourse = stk_warehourse;
	}
	public Integer getStk_count() {
		return stk_count;
	}
	public void setStk_count(Integer stk_count) {
		this.stk_count = stk_count;
	}
	public String getStk_memo() {
		return stk_memo;
	}
	public void setStk_memo(String stk_memo) {
		this.stk_memo = stk_memo;
	}
	public String getStk_ware() {
		return stk_ware;
	}
	public void setStk_ware(String stk_ware) {
		this.stk_ware = stk_ware;
	}
	public Product getSkt_product_id() {
		return skt_product_id;
	}
	public void setSkt_product_id(Product skt_product_id) {
		this.skt_product_id = skt_product_id;
	}
	public String getStk_name() {
		return stk_name;
	}
	public void setStk_name(String stk_name) {
		this.stk_name = stk_name;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
