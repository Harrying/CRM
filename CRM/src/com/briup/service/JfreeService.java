package com.briup.service;

import org.jfree.data.category.CategoryDataset;

public interface JfreeService {
	public CategoryDataset findCstcontribute(String cust_name) throws Exception ;
	public CategoryDataset findCstMakeup(int condit) throws Exception;
}
