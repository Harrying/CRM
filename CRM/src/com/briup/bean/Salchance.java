package com.briup.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

public class Salchance implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int chc_id;
	private String chc_source;
	private String chc_cust_name;
	private String chc_title;
	private int chc_rate;
	private String chc_linkman;
	private String chc_tel;
	private String chc_addr;
	private String chc_desc;
	private String chc_create_by;
	private Date chc_create_date;
	private String chc_due_to;
	private Date chc_due_date;
	private String chc_status;
	private Set<Salplan> plans;

	public Salchance() {

	}

	public int getChc_id() {
		return chc_id;
	}

	public void setChc_id(int chc_id) {
		this.chc_id = chc_id;
	}

	public String getChc_source() {
		return chc_source;
	}

	public void setChc_source(String chc_source) {
		this.chc_source = chc_source;
	}

	public String getChc_cust_name() {
		return chc_cust_name;
	}

	public void setChc_cust_name(String chc_cust_name) {
		this.chc_cust_name = chc_cust_name;
	}

	public String getChc_title() {
		return chc_title;
	}

	public void setChc_title(String chc_title) {
		this.chc_title = chc_title;
	}

	public int getChc_rate() {
		return chc_rate;
	}

	public void setChc_rate(int chc_rate) {
		this.chc_rate = chc_rate;
	}

	public String getChc_linkman() {
		return chc_linkman;
	}

	public void setChc_linkman(String chc_linkman) {
		this.chc_linkman = chc_linkman;
	}

	public String getChc_tel() {
		return chc_tel;
	}

	public void setChc_tel(String chc_tel) {
		this.chc_tel = chc_tel;
	}

	public String getChc_addr() {
		return chc_addr;
	}

	public void setChc_addr(String chc_addr) {
		this.chc_addr = chc_addr;
	}

	public String getChc_desc() {
		return chc_desc;
	}

	public void setChc_desc(String chc_desc) {
		this.chc_desc = chc_desc;
	}

	public String getChc_create_by() {
		return chc_create_by;
	}

	public void setChc_create_by(String chc_create_by) {
		this.chc_create_by = chc_create_by;
	}

	public Date getChc_create_date() {
		return chc_create_date;
	}

	public void setChc_create_date(Date chc_create_date) {
		this.chc_create_date = chc_create_date;
	}

	public String getChc_due_to() {
		return chc_due_to;
	}

	public void setChc_due_to(String chc_due_to) {
		this.chc_due_to = chc_due_to;
	}

	public Date getChc_due_date() {
		return chc_due_date;
	}

	public void setChc_due_date(Date chc_due_date) {
		this.chc_due_date = chc_due_date;
	}

	public String getChc_status() {
		return chc_status;
	}

	public void setChc_status(String chc_status) {
		this.chc_status = chc_status;
	}

	public Set<Salplan> getPlans() {
		return plans;
	}

	public void setPlans(Set<Salplan> plans) {
		this.plans = plans;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Salchance [chc_id=" + chc_id + ", chc_source=" + chc_source + ", chc_cust_name=" + chc_cust_name
				+ ", chc_title=" + chc_title + ", chc_rate=" + chc_rate + ", chc_linkman=" + chc_linkman + ", chc_tel="
				+ chc_tel + ", chc_addr=" + chc_addr + ", chc_desc=" + chc_desc + ", chc_create_by=" + chc_create_by
				+ ", chc_create_date=" + chc_create_date + ", chc_due_to=" + chc_due_to + ", chc_due_date="
				+ chc_due_date + ", chc_status=" + chc_status + ", plans=" + plans + "]";
	}

}
