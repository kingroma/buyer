package com.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class DataClassManager {
	public DataClassManager(){
		
	}

	public boolean save(Object obj,String path){
		try{
			
			File f = new File(path);
			if(f.exists()){
				f.delete();
			}
			FileOutputStream fos = new FileOutputStream(f , true);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			
			oos.writeObject(obj);
			oos.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public Object load(String path){
		Object obj = null;
		
		try{			
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream(path));
			obj = ois.readObject();
			ois.close();

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return obj;
	}
}
