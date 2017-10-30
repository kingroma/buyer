package com.common;

import java.io.File;

public class RefreshFileSystem {
	public RefreshFileSystem (){
		String path = ManagerStaticAttribute.dataPath;
		File file = new File(path);
		file.isFile();
		file = new File(path+"/product");
		file.isFile();
		file.exists();
		file.list();
		
		
		for(int i = 0 ; i < file.list().length ; i ++){
			System.out.println(file.list()[i]);
		}
		System.out.println();
	}
}
