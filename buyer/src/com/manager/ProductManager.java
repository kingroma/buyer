package com.manager;

import com.common.DataClassManager;
import com.product.Product;

public class ProductManager {
	
	DataClassManager dcm;
	public ProductManager(){
		dcm = new DataClassManager();
	}
	
	public boolean createProduct(String path , Product product){
		
		return true;
	}
}
