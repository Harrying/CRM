package com.briup.bean;

import java.io.Serializable;

public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int prod_id;
	private String prod_name;
	private String prod_type;
	private String prod_batch;
	private String prod_unit;
	private float prod_price;
	private String prod_memo;
	private Storage storage;
	public int getProd_id() {
		return prod_id;
	}
	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_type() {
		return prod_type;
	}
	public void setProd_type(String prod_type) {
		this.prod_type = prod_type;
	}
	public String getProd_batch() {
		return prod_batch;
	}
	public void setProd_batch(String prod_batch) {
		this.prod_batch = prod_batch;
	}
	public String getProd_unit() {
		return prod_unit;
	}
	public void setProd_unit(String prod_unit) {
		this.prod_unit = prod_unit;
	}
	public float getProd_price() {
		return prod_price;
	}
	public void setProd_price(float prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_memo() {
		return prod_memo;
	}
	public void setProd_memo(String prod_memo) {
		this.prod_memo = prod_memo;
	}
	public Storage getStorage() {
		return storage;
	}
	public void setStorage(Storage storage) {
		this.storage = storage;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Product [prod_id=" + prod_id + ", prod_name=" + prod_name + ", prod_type=" + prod_type + ", prod_batch="
				+ prod_batch + ", prod_unit=" + prod_unit + ", prod_price=" + prod_price + ", prod_memo=" + prod_memo
				+ ", storage=" + storage + "]";
	}	
	
}
