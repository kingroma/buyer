package com.common;

import java.io.File;

public class OrderFileNumber {
	public OrderFileNumber(){
		
	}
	public String getFileNum(){
		String path = ManagerStaticAttribute.orderDataPath;
		int i = 0 ;
		File file = null;
		while(true){
			file = new File(path+"/O"+i+"");
			if(file.isDirectory())
				i++;
			else{
				//file.mkdirs();
				break;
			}
			
		}
		return "O"+i;
		
	}
	public void createFileNum(String input){
		String path = ManagerStaticAttribute.orderDataPath;
		File file = null;
		file = new File(path+"/"+input+"");
		file.mkdirs();
	}
}
