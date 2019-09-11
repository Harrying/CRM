package com.briup.util;

import java.util.List;
 
/**
 * 表示分页封装数据的工具类
 */
public class PageUtil<T> {
	

	private int curPage;//当前页
	
	private int pages;//总页数
	
	private int rows;//总行数
	
	public int row;//一页多少行
	
	private List<T> data;//泛型里的数据

	 
	/**
	 * 得到当前页
	 * @return
	 */
	
	public int getCurPage() {
		return curPage;
	}
	public int getRows() {
		return rows;
	}
	public int getROW() {
		return row;
	}
	public void setROW(int row) {
		this.row = row;
	}
	/**
	 * 设置当前页
	 * @param curPage
	 */
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	/**
	 * 得到总页数
	 * @return
	 */
	public int getPages() {
		return pages;
	}
	
	/**
	 * 设置总页数
	 * @return
	 */
	public void setRows(int rows) {
		this.rows = rows;
		if(this.rows%row==0){
			this.pages=this.rows/row;
		}else{
			this.pages=this.rows/row+1;
		}
	}

	/**
	 * 得到数据
	 */
	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
	
	@Override
	public String toString() {
		return "PageUtil [curPage=" + curPage + ", pages=" + pages + ", rows=" + rows + ", row=" + row + ", data="
				+ data + "]";
	}
	
}
