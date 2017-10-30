package com.manager;

import java.io.File;

import com.buyer.Buyer;
import com.common.DataClassManager;

public class Admin_BuyerManager {
	DataClassManager dcm;
	public Admin_BuyerManager(){
		dcm = new DataClassManager();
	}
	
	public boolean createBuyer(String path , Buyer buyer){
		//기본 폴더를 path로 해야함
		
		String id = buyer.getId();
		String newPath = path+"/"+id;
		File file = new File(newPath);
		if(file.exists())
			return false;
		else
			file.mkdirs();
		dcm.save(buyer, newPath+"/buyer.data");
		return true;
	}
	
	public Buyer getBuyer(String path , String id){
		//path 는 기본폴더에 아이디 추가되어야함.
		Buyer output = null;
		output = (Buyer)dcm.load(path+"/"+id+"/buyer.data");
		return output;
	}
	
	public void fixBuyer(String path , Buyer buyer){
		String id = buyer.getId();
		String newPath = path+"/"+id;
		File file = new File(newPath);
		dcm.save(buyer, newPath+"/buyer.data");
	}
	
	public void deleteBuyer(String path , String id){
		Buyer buyer = null;
		dcm.save(buyer, path+"/"+id+"/buyer.data");
	}
}
