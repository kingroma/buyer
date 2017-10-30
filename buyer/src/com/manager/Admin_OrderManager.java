package com.manager;
import java.io.File;

import com.common.DataClassManager;
import com.order.Order;;
public class Admin_OrderManager {
	DataClassManager dcm;
	public Admin_OrderManager(){
		dcm = new DataClassManager();
	}
	
	public boolean createOrder(String path,Order order){
		String num = order.getOrder_num();
		String newPath = path+"/"+num;
		File file = new File(newPath);
		/*
		if(file.exists())
			return false;
		else
			file.mkdirs();
		 */
		dcm.save(order, newPath+"/order.data");
		return true;
	}
	
	public Order getOrder(String path , String num){
		Order output = null;
		output = (Order)dcm.load(path+"/"+num+"/order.data");
		return output;
	}
	
	public boolean fixOrder(String path , Order order){
		String num = order.getOrder_num();
		String newPath = path+"/"+num;
		File file = new File(newPath);
		dcm.save(order, newPath+"/order.data");
		return true;
	}
	
}
