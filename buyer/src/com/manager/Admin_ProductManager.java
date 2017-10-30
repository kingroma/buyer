package com.manager;

import java.io.File;
import java.util.ArrayList;
import java.util.Random;

import com.common.DataClassManager;
import com.common.ManagerStaticAttribute;
import com.common.SortArrayList;
import com.product.Product;

public class Admin_ProductManager {
	DataClassManager dcm;
	public Admin_ProductManager(){
		dcm = new DataClassManager();
	}
	
	public ArrayList<Product> getNewProduct(){
		SortArrayList sal = new SortArrayList();
		File file = new File(ManagerStaticAttribute.productDataPath);
		
		String[] list = sal.SortASC_String_ArrayList_Board(file.list());
		ArrayList<Product> product_list = new ArrayList<Product>();
		for(int i = 0 ; i < list.length ; i ++){
			product_list.add(this.getProduct(ManagerStaticAttribute.productDataPath, list[i]));
		}
		product_list = sal.SortProduct(product_list);
		return product_list;
	}
	
	public ArrayList<Product> getBestReplyProduct(){
		//탑 3 reply
		ArrayList<Product> new_product = getNewProduct();
		ArrayList<Product> top3_product = new ArrayList<Product>();
		
			
		for(int count = 0 ; count < 3 ; count ++){
			int num = 0 ;
			int max = new_product.get(0).getComment().size();
			
			for(int i = 1 ; i < new_product.size() ; i ++){
			if(new_product.get(i).getComment().size()>max){
					max = new_product.get(i).getComment().size();
					num = i;
				}
			}
			top3_product.add(new_product.get(num));
			new_product.remove(num);
		}
		return top3_product;
		//return null;
	}
	
	public ArrayList<Product> getBestProduct(){
		//탑 3 recommend
		ArrayList<Product> new_product = getNewProduct();
		ArrayList<Product> top3_product = new ArrayList<Product>();
		
		
		for(int count = 0 ; count < 3 ; count ++){
			int num = 0 ;
			int max = new_product.get(0).getRecommend();
			for(int i = 1 ; i < new_product.size() ; i ++){
				if(new_product.get(i).getRecommend()>max){
					max = new_product.get(i).getRecommend();
					num = i;
				}
			}
			top3_product.add(new_product.get(num));
			new_product.remove(num);
		}
		
		
		
		
		
		return top3_product;
	}
	
	public ArrayList<Product> getRandomProductList(){
		String path = ManagerStaticAttribute.productDataPath;
		File file = new File(path);
		String[] temp_string_list = file.list();
		int size = temp_string_list.length;
		
		ArrayList<Product> return_product_list = new ArrayList<Product>();
		ArrayList<String> string_list = new ArrayList<String>();
		Random random = new Random();
		
		for(int i = 0 ; i < size ; i ++){
			string_list.add(temp_string_list[i]);
		}
		
		while(size>0){
			int int_random = random.nextInt(size);
			Product getP = getProduct(path,string_list.get(int_random));
			if(getP!=null){
				return_product_list.add(getP);
			}
			string_list.remove(int_random);
			//return_product_list.add(this.getProduct(path, ));
			size--;
		}
		
		//return_product_list.add(getProduct(path,string_list.get(0)));
		
		return return_product_list;
	}
	
	public boolean createProduct(String path , Product product){
		
		String num = product.getProduct_num();
		String newPath = path+"/"+num;
		File file = new File(newPath);
		if(!file.exists())
			file.mkdirs();
		dcm.save(product, newPath+"/product.data");
		return true;
	}
	public String getProductFileNameByUrl(String num){
		File file = new File(ManagerStaticAttribute.dataUrl+"/product/"+num);
		
		if(file.exists()){
			for(int i = 0 ; i < file.list().length ; i ++){
				System.out.println(file.list()[i]);
				if(!file.list()[i].equals("product.data"))
					return file.list()[i];
			}
		}
		return null;
		
	}
	public Product getProduct(String path , String num){
		Product output = null;
		output = (Product)dcm.load(path+"/"+num+"/product.data");
		return output;
	}
	public void fixProduct(String path, Product product){
		String num = product.getProduct_num();
		String newPath = path+"/"+num;
		File file = new File(newPath);
		dcm.save(product, newPath+"/product.data");
		//System.out.println("���� ���� ");
	}
	
	
	
	
	
	
	public void Admin_Product_Init(String path){
		
	}
	
	public void Admin_Product_Add(String path , Product p){
		
	}
	
	public void Admin_Product_Delete(String path){
		
	}
	
	public void Admin_Product_Fix(String path , Product p){
		
	}
	
	public void Admin_Product_Save(String path){
		
	}
}
