package com.common;

import java.io.File;
import java.util.ArrayList;

import com.manager.Admin_ProductManager;
import com.product.Product;

public class SearchProduct {
	public SearchProduct(){
		
	}
	public ArrayList<Product> SearchProductKeyword(String keyword , ArrayList<Product> input_list){
		Admin_ProductManager apm = new Admin_ProductManager();
		String path = ManagerStaticAttribute.productDataPath;
		File file = null;
		String temp = null;
		int count = 0; // 시작점 
		Product p = null;
		ArrayList<Product> product_list = input_list;
		String product_num = null;
		
		while(true){
			product_num = "A"+count;
			file = null;
			p = null;
					
			file = new File(path+"/"+product_num+"/product.data");
			
			if(file.exists()){
				
				p = apm.getProduct(path, product_num);
				
				if(p!=null){
					String str_categori = null;
					if(p.getCategori()!=null)
						str_categori = p.getCategori();
					
					String str_textarea = null;
					if(p.getTitle()!=null)
						str_textarea = p.getTextarea();
					
					String str_product_num = null;
					if(p.getProduct_num()!=null)
						product_num = p.getProduct_num();
					
					String str_title = null;
					if(p.getTitle()!=null)
						str_title = p.getTitle();
					
					if(match(str_categori,keyword)){
						if(CheckIfTheProductIsInTheList(product_list,p))
							product_list.add(p);	
					}
					else if(match(str_textarea,keyword)){
						if(CheckIfTheProductIsInTheList(product_list,p))
							product_list.add(p);
					}
					else if(match(str_product_num,keyword)){
						if(CheckIfTheProductIsInTheList(product_list,p))
							product_list.add(p);
					}
					else if(match(str_title,keyword)){
						if(CheckIfTheProductIsInTheList(product_list,p))
							product_list.add(p);
					}
				}
								
				
				
			}else{
				return product_list;
			}
			
			count++;
			
		}
	}
	
	public boolean CheckIfTheProductIsInTheList(ArrayList<Product> list , Product p){
		for(int i = 0 ; i < list.size() ; i ++ ){
			if(list.get(i).getProduct_num().equals(p.getProduct_num()))
				return false;
		}
		return true;
	}
	
	public boolean match(String str , String keyword){
		if(str == null | keyword == null){
			return false;
		}
		//product.data
		Boolean found = str.contains(keyword);
		if(found){
		      //System.out.println("Keyword matched the string");
			return true;
		}
		return false;
	}
	public void getSize(){
		String path = ManagerStaticAttribute.productDataPath;
		File file = new File(path);
		
	}
}
