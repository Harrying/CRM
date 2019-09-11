package com.briup.service;

import com.briup.bean.Product;
import com.briup.bean.Storage;
import com.briup.util.PageUtil;


public interface DictService {
	public int getAllRows() throws Exception;
	public int getAllRowss() throws Exception;
	public PageUtil<Product> findProduct(Product p,int curPage, int row) throws Exception;
	public PageUtil<Product> findProductAll(int curPage, int row) throws Exception;
	public PageUtil<Storage> findStorageAll(int curpage, int i) throws Exception;
	public PageUtil<Storage> findStorage(Storage s,int curPage, int row) throws Exception;
}
