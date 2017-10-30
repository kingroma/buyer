package com.common;

public class myTime {
	private String year;
	private String month;
	private String day;
	private String hour;
	private String minute;
	private String seconds;
	
	//2017-09-11 04:12:08
	//0123 56 89 12 45 78
	public myTime(String input){
		year="";month="";day="";hour="";minute="";seconds="";
		year+=input.charAt(0);
		year+=input.charAt(1);
		year+=input.charAt(2);
		year+=input.charAt(3);
		
		month+=input.charAt(5);
		month+=input.charAt(6);
		
		day+=input.charAt(8);
		day+=input.charAt(9);
		
		hour+=input.charAt(11);
		hour+=input.charAt(12);
		
		minute+=input.charAt(14);
		minute+=input.charAt(15);
		
		seconds+=input.charAt(17);
		seconds+=input.charAt(18);
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}

	public String getSeconds() {
		return seconds;
	}

	public void setSeconds(String seconds) {
		this.seconds = seconds;
	}
	
	
}
