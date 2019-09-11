package com.briup.bean;

import java.io.Serializable;

//订单中的某一条
public class Orders_line implements Serializable {
	@Override
	public String toString() {
		return "Orders_line [odd_id=" + odd_id + ", prod_id=" + prod_id + ", odd_count=" + odd_count + ", odd_order_id="
				+ odd_order_id + "]";
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int odd_id;
	private int prod_id;// 产品
	private int odd_count;// 总数量
	private Orders odd_order_id;

	public Orders_line() {
	}

	public int getOdd_id() {
		return odd_id;
	}

	public void setOdd_id(int oddId) {
		odd_id = oddId;
	}

	public Orders getOdd_order_id() {
		return odd_order_id;
	}

	public void setOdd_order_id(Orders oddOrderId) {
		odd_order_id = oddOrderId;
	}

	public int getProd_id() {
		return prod_id;
	}

	public void setProd_id(int prodId) {
		prod_id = prodId;
	}

	public int getOdd_count() {
		return odd_count;
	}

	public void setOdd_count(int oddCount) {
		odd_count = oddCount;
	}


}
