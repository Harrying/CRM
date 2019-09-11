package com.briup.dao;

import java.util.List;

import com.briup.bean.Product;
import com.briup.bean.Storage;
import com.briup.util.PageUtil;

public interface DictDao {
	public int getAllRows();
	public int getAllRowss();
	public List<Product> findProductBy(Product p,int curPage, int row);
	public List<Product> findProductAll(int curPage, int row);
	public List<Storage> findStorageAll(int curPage, int row);
	public List<Storage> findStorageBy(Storage s, int curpage, int row);
}
