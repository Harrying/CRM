package com.briup.bean;

import java.io.Serializable;

public class Sys_role implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int role_id;
	private String role_name;
	private String role_desc;
	private int role_flag;
     
	public Sys_role() {
		
	}

	public Sys_role(int role_id){
		this.role_id = role_id;
	}
	
	public Sys_role(int role_id, String role_name, String role_desc, int role_flag) {
		super();
		this.role_id = role_id;
		this.role_name = role_name;
		this.role_desc = role_desc;
		this.role_flag = role_flag;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_desc() {
		return role_desc;
	}

	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}

	public int getRole_flag() {
		return role_flag;
	}

	public void setRole_flag(int role_flag) {
		this.role_flag = role_flag;
	}

	@Override
	public String toString() {
		return "Sys_role [role_id=" + role_id + ", role_name=" + role_name + ", role_desc=" + role_desc + ", role_flag="
				+ role_flag + "]";
	}

	

}
