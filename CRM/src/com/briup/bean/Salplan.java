package com.briup.bean;

import java.io.Serializable;
import java.util.Date;

public class Salplan implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pla_id;
	private int pla_chc_id;
	private Date pla_date;
	private String pla_todo;
	private String pla_result;

	public Salplan() {
	}

	public int getPla_id() {
		return pla_id;
	}

	public void setPla_id(int pla_id) {
		this.pla_id = pla_id;
	}

	public int getPla_chc_id() {
		return pla_chc_id;
	}

	public void setPla_chc_id(int pla_chc_id) {
		this.pla_chc_id = pla_chc_id;
	}

	public Date getPla_date() {
		return pla_date;
	}

	public void setPla_date(Date pla_date) {
		this.pla_date = pla_date;
	}

	public String getPla_todo() {
		return pla_todo;
	}

	public void setPla_todo(String pla_todo) {
		this.pla_todo = pla_todo;
	}

	public String getPla_result() {
		return pla_result;
	}

	public void setPla_result(String pla_result) {
		this.pla_result = pla_result;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
