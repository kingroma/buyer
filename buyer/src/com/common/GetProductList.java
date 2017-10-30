package com.common;

import java.io.File;
import java.util.ArrayList;

import com.manager.Admin_ProductManager;
import com.product.Product;

public class GetProductList {
	
	
	
	File file = null;
	Admin_ProductManager apm = new Admin_ProductManager();
	
	private int newProductCount = 10;//이개수 만큼 뽑아줌 
	
	public GetProductList(){
		file  = new File(ManagerStaticAttribute.productDataPath); 
	}
	
	public ArrayList<Product> getNewProductList(){
		
		ArrayList<Product> product_list = null;
		String[] list = file.list();
		int num = list.length-1;
		product_list = new ArrayList<Product>();
		for(int i = num ; i > num-newProductCount ; i--){
			Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, "A"+i+"");
			if(p!=null)
				product_list.add(p);
		}
		return product_list;
	}
	
	
	
	
	public ArrayList<Product> getCategoriProductList(String keyword , int range){
		String[] list = file.list();
		int num = list.length-1;
		ArrayList<Product> temp = new ArrayList<Product>();
		int count = 3;
		for(int i = num-range ; i > 1 ; i--){
			Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, "A"+i+"");
			if(p.getCategori().equals(keyword)){
				temp.add(p);
				count--;
			}
			if(count == 0 )
				break;
		}
		return temp;
	}
	
	
	
}
