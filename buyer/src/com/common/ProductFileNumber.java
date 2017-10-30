package com.common;

import java.io.File;

public class ProductFileNumber {
	public ProductFileNumber(){
		
	}
	public String getFileNum(){
		String path = ManagerStaticAttribute.productDataPath;
		int i = 0 ;
		File file = null;
		while(true){
			file = new File(path+"/A"+i+"");
			if(file.isDirectory())
				i++;
			else{
				file.mkdirs();
				break;
			}
			
		}
		return "A"+i;
		
	}
}
