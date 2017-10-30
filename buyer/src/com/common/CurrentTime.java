package com.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CurrentTime {
	public CurrentTime(){
		
	}
	
	public String getTime(){
		long time = System.currentTimeMillis(); 

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
													   //0123456789012345678
		String str = dayTime.format(new Date(time));

		//System.out.println(str);
		return str;
	}
	
	
	
	
}
