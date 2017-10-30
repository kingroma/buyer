package com.manager;

import java.io.File;
import java.util.ArrayList;

import com.common.DataClassManager;
import com.common.ManagerStaticAttribute;
import com.product.Product;
import com.seller.Seller;

public class Admin_SellerManager {
	DataClassManager dcm;
	public Admin_SellerManager(){
		dcm = new DataClassManager();
	}
	
	public boolean createSeller(String path , Seller seller){
		String id = seller.getId();
		String newPath = path+"/"+id;
		File file = new File(newPath);
		if(file.exists())
			return false;
		else
			file.mkdirs();
		dcm.save(seller, newPath+"/seller.data");
		return true;
	}
	
	public Seller getSeller(String path , String id){
		//path 는 기본폴더 에 아이디 추가 되어야함
		Seller output = null;
		output = (Seller)dcm.load(path+"/"+id+"/seller.data");
		return output;
	}
	
	public void fixSeller(String path , Seller seller){
		String id = seller.getId();
		String newPath = path+"/"+id;
		File file = new File(newPath);
		dcm.save(seller, newPath+"/seller.data");
	}
	
	public void deleteSeller(String path, String id){
		Seller seller = null;
		dcm.save(seller, path+"/"+id+"/seller.data");
	}
	
	public boolean loginSeller(String path, String id,String password){
		File file = new File(path+"/"+id);
		if(file.isDirectory()){
			Seller seller = getSeller(path,id);
			String pw = seller.getPw();
			if(pw.equals(password))
				return true;
		}else
			return false;
		return false;
	}
	
	public boolean fixSellerProduct(String id , Product p){
		String product_num = p.getProduct_num();
		Seller s = this.getSeller(ManagerStaticAttribute.sellerDataPath, id);
		ArrayList<Product> list = s.getSell_product();
		
		for(int i = 0 ; i < list.size() ; i ++){
			if(list.get(i).getProduct_num().equals(product_num)){
				//list.get(i).setPrice(p.getPrice());
				//list.get(i).setTitle(p.getTitle());
				//list.get(i).setTextarea(p.getTextarea());
				list.set(i, p);
				s.setSell_product(list);
				this.fixSeller(ManagerStaticAttribute.sellerDataPath,s);
				return true;
			}
		}
		
		return false;
	}
}
