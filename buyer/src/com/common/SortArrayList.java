package com.common;

import com.buyer.Buyer;
import com.order.*;
import com.product.Product;
import com.seller.Seller;

import java.util.ArrayList;
public class SortArrayList {
	public SortArrayList(){
		
	}
	
	
	
	public String[] SortASC_String_ArrayList_Board(String[] input){
		//String[] temp_string_list = input;
		ArrayList<String> string_list = new ArrayList<String>();
		for (int i = 0 ; i < input.length ; i ++){
			string_list.add(input[i]);
			
		}
		//"b0~b*"
		
		for(int i = 0 ; i < string_list.size()-1 ; i ++){
			for(int j = i+1 ; j < string_list.size() ; j ++){
				String temp_1 = string_list.get(i);
				String temp_2 = string_list.get(j);
				temp_1 = temp_1.substring(1, temp_1.length());
				temp_2 = temp_2.substring(1, temp_2.length());
				//System.out.println(temp_1);
				//System.out.println(temp_2);
				int int_temp_1 = 0;
				int int_temp_2 = 0;
				int_temp_1 = Integer.parseInt(temp_1);
				int_temp_2 = Integer.parseInt(temp_2);
				if(int_temp_1>int_temp_2){
					String temp_temp = string_list.get(i);
					string_list.set(i, string_list.get(j));
					string_list.set(j, temp_temp);
				}
			}
		}
		
		String[] return_string = new String[string_list.size()];
		for(int i = 0 ; i < string_list.size() ; i ++){
			return_string[i] = string_list.get(i);
		}
		
		return return_string;
	}
	
	public ArrayList<Order> SortOrder(ArrayList<Order> order_list){
		
		if(order_list == null)
			return null;
		else {
			ArrayList<Order> temp = new ArrayList<Order>();
			for(int i = order_list.size()-1 ; i >=0  ; i --){
				temp.add(order_list.get(i));
			}
			return temp;
		}
		
	}
	public ArrayList<Product> SortProduct(ArrayList<Product> product_list){
		
		if(product_list == null)
			return null;
		else {
			ArrayList<Product> temp = new ArrayList<Product>();
			for(int i = product_list.size()-1 ; i >=0  ; i --){
				temp.add(product_list.get(i));
			}
			return temp;
		}
		
	}
	public ArrayList<Buyer> SortBuyer(ArrayList<Buyer> buyer_list){
		
		if(buyer_list == null)
			return null;
		else {
			ArrayList<Buyer> temp = new ArrayList<Buyer>();
			for(int i = buyer_list.size()-1 ; i >=0  ; i --){
				temp.add(buyer_list.get(i));
			}
			return temp;
		}
		
	}
	public ArrayList<Seller> SortSeller(ArrayList<Seller> seller_list){
		
		if(seller_list == null)
			return null;
		else {
			ArrayList<Seller> temp = new ArrayList<Seller>();
			for(int i = seller_list.size()-1 ; i >=0  ; i --){
				temp.add(seller_list.get(i));
			}
			return temp;
		}
		
	}
	
	public String[] SortStringArray(String[] input){
		if(input == null)
			return null;
		else {
			String[] temp = new String[input.length];
			
			for(int i = input.length-1 ; i >=0  ; i --){
			
				temp[input.length-i-1] = input[i];
			}
			return temp;
		}
	}
}
