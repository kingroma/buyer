package com.common;

import java.util.ArrayList;

public class Categori {
	ArrayList<String> list = new ArrayList<String>();
	ArrayList<String> board_list = new ArrayList<String>();
	
	public Categori(){
		list.add("book");
		list.add("bag");
		list.add("clothes");
		
		board_list.add("없음");
		board_list.add("");
		board_list.add("");
		board_list.add("");
	}
	
	public ArrayList<String> getBoardList(){
		return board_list;
	}
	
	public ArrayList<String> getList(){
		return list;
	}
}
