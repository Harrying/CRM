package com.briup.bean;

import java.io.Serializable;
import java.util.Set;

public class Cst_customer implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cust_id;
	private String cust_no;//客户编号
	private String cust_name;//客户名
	private String cust_region;//地区
	private int cust_manager_id;//客户经理编号
	private String cust_manager_name;//客户经理
	private int cust_level;//客户等级码
	private String cust_level_label;//客户等级
	private int cust_satisfy;//客户满意度
	private int cust_credit;//客户信用度
	private String cust_addr;//地址
	private String cust_zip;//邮编
	private String cust_tel;//电话
	private String cust_fax;//传真
	private String cust_website;//网址
	private String cust_licence_no;//营业执照注册号
	private String cust_chieftain;//法人
	private float cust_bankroll;//注册资金
	private float cust_turnover;//年营业额
	private String cust_bank;//开户银行
	private String cust_bank_account;//银行账户
	private String cust_local_tax_no;//地税登记号
	private String cust_national_tax_no;//国税登记号
	private char cust_status;//客户状态
	private Set<Cst_linkman> kinks;//联系人
	private Set<Cst_activity> atvs;//交往记录
	private Set<Orders> orders;//客户订单
	public Cst_customer(){}
	public int getCust_id() {
		return cust_id;
	}
	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_no() {
		return cust_no;
	}
	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_region() {
		return cust_region;
	}
	public void setCust_region(String cust_region) {
		this.cust_region = cust_region;
	}
	public int getCust_manager_id() {
		return cust_manager_id;
	}
	public void setCust_manager_id(int cust_manager_id) {
		this.cust_manager_id = cust_manager_id;
	}
	public String getCust_manager_name() {
		return cust_manager_name;
	}
	public void setCust_manager_name(String cust_manager_name) {
		this.cust_manager_name = cust_manager_name;
	}
	public int getCust_level() {
		return cust_level;
	}
	public void setCust_level(int cust_level) {
		this.cust_level = cust_level;
	}
	public String getCust_level_label() {
		return cust_level_label;
	}
	public void setCust_level_label(String cust_level_label) {
		this.cust_level_label = cust_level_label;
	}
	public int getCust_satisfy() {
		return cust_satisfy;
	}
	public void setCust_satisfy(int cust_satisfy) {
		this.cust_satisfy = cust_satisfy;
	}
	public int getCust_credit() {
		return cust_credit;
	}
	public void setCust_credit(int cust_credit) {
		this.cust_credit = cust_credit;
	}
	public String getCust_addr() {
		return cust_addr;
	}
	public void setCust_addr(String cust_addr) {
		this.cust_addr = cust_addr;
	}
	public String getCust_zip() {
		return cust_zip;
	}
	public void setCust_zip(String cust_zip) {
		this.cust_zip = cust_zip;
	}
	public String getCust_tel() {
		return cust_tel;
	}
	public void setCust_tel(String cust_tel) {
		this.cust_tel = cust_tel;
	}
	public String getCust_fax() {
		return cust_fax;
	}
	public void setCust_fax(String cust_fax) {
		this.cust_fax = cust_fax;
	}
	public String getCust_website() {
		return cust_website;
	}
	public void setCust_website(String cust_website) {
		this.cust_website = cust_website;
	}
	public String getCust_licence_no() {
		return cust_licence_no;
	}
	public void setCust_licence_no(String cust_licence_no) {
		this.cust_licence_no = cust_licence_no;
	}
	public String getCust_chieftain() {
		return cust_chieftain;
	}
	public void setCust_chieftain(String cust_chieftain) {
		this.cust_chieftain = cust_chieftain;
	}
	public float getCust_bankroll() {
		return cust_bankroll;
	}
	public void setCust_bankroll(float cust_bankroll) {
		this.cust_bankroll = cust_bankroll;
	}
	public float getCust_turnover() {
		return cust_turnover;
	}
	public void setCust_turnover(float cust_turnover) {
		this.cust_turnover = cust_turnover;
	}
	public String getCust_bank() {
		return cust_bank;
	}
	public void setCust_bank(String cust_bank) {
		this.cust_bank = cust_bank;
	}
	public String getCust_bank_account() {
		return cust_bank_account;
	}
	public void setCust_bank_account(String cust_bank_account) {
		this.cust_bank_account = cust_bank_account;
	}
	public String getCust_local_tax_no() {
		return cust_local_tax_no;
	}
	public void setCust_local_tax_no(String cust_local_tax_no) {
		this.cust_local_tax_no = cust_local_tax_no;
	}
	public String getCust_national_tax_no() {
		return cust_national_tax_no;
	}
	public void setCust_national_tax_no(String cust_national_tax_no) {
		this.cust_national_tax_no = cust_national_tax_no;
	}
	public char getCust_status() {
		return cust_status;
	}
	public void setCust_status(char cust_status) {
		this.cust_status = cust_status;
	}
	public Set<Cst_linkman> getKinks() {
		return kinks;
	}
	public void setKinks(Set<Cst_linkman> kinks) {
		this.kinks = kinks;
	}
	public Set<Cst_activity> getAtvs() {
		return atvs;
	}
	public void setAtvs(Set<Cst_activity> atvs) {
		this.atvs = atvs;
	}
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	
	@Override
	public String toString() {
		return "Cst_customer [cust_id=" + cust_id + ", cust_no=" + cust_no + ", cust_name=" + cust_name
				+ ", cust_region=" + cust_region + ", cust_manager_id=" + cust_manager_id + ", cust_manager_name="
				+ cust_manager_name + ", cust_level=" + cust_level + ", cust_level_label=" + cust_level_label
				+ ", cust_satisfy=" + cust_satisfy + ", cust_credit=" + cust_credit + ", cust_addr=" + cust_addr
				+ ", cust_zip=" + cust_zip + ", cust_tel=" + cust_tel + ", cust_fax=" + cust_fax + ", cust_website="
				+ cust_website + ", cust_licence_no=" + cust_licence_no + ", cust_chieftain=" + cust_chieftain
				+ ", cust_bankroll=" + cust_bankroll + ", cust_turnover=" + cust_turnover + ", cust_bank=" + cust_bank
				+ ", cust_bank_account=" + cust_bank_account + ", cust_local_tax_no=" + cust_local_tax_no
				+ ", cust_national_tax_no=" + cust_national_tax_no + ", cust_status=" + cust_status + ", kinks=" + kinks
				+ ", atvs=" + atvs + ", orders=" + orders + "]";
	}
	
}
