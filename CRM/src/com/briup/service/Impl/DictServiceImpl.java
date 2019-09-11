package com.briup.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Product;
import com.briup.bean.Storage;
import com.briup.dao.DictDao;
import com.briup.service.DictService;
import com.briup.util.PageUtil;

@Service("DicService")
public class DictServiceImpl implements DictService {

	@Autowired
	private DictDao dd;

	@Override
	public PageUtil<Product> findProduct(Product p, int curPage, int row) throws Exception {
		List<Product> products = dd.findProductBy(p, (curPage-1)*row, row);
		PageUtil<Product> pu =new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(products);
		pu.setROW(row);
		pu.setRows(getAllRows());
		return pu;
	}

	// 分页找到所有的product
	@Override
	public PageUtil<Product> findProductAll(int curPage, int row) throws Exception {
		List<Product> products = dd.findProductAll((curPage - 1) * 8, row);
		PageUtil<Product> pu = new PageUtil<>();
		pu.setROW(row);
		pu.setCurPage(curPage);
		pu.setData(products);
		// 设置总行数
		pu.setRows(getAllRows());
		return pu;
	}

	// 分页找到所有的storage
	@Override
	public PageUtil<Storage> findStorageAll(int curpage, int i) throws Exception {
		List<Storage> storages = dd.findStorageAll((curpage-1)*i, i);
		PageUtil<Storage> pu = new PageUtil<>();
		pu.setROW(i);
		pu.setCurPage(curpage);
		pu.setData(storages);
		// 设置总行数
		pu.setRows(getAllRowss());
		return pu;
	}

	@Override
	public PageUtil<Storage> findStorage(Storage s, int curPage, int row) throws Exception {
		List<Storage> Storages = dd.findStorageBy(s, (curPage-1)*row, row);
		PageUtil<Storage> pu =new PageUtil<>();
		pu.setCurPage(curPage);
		pu.setData(Storages);
		pu.setROW(row);
		pu.setRows(getAllRows());
		return pu;
	}

	// 获取总行数
	@Override
	public int getAllRows() throws Exception {
		return dd.getAllRows();
	}

	// 获取总行数
	@Override
	public int getAllRowss() throws Exception {
		return dd.getAllRowss();
	}

}
