package com.product;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;

public class Product implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String time = null;
	
	private String seller = null;
	private String product_num = null;
	private String price = null;
	
	private String title = null;
	private String file_name = null;
	private File file = null;
	
	private String textarea = null;
	private String status = null;
	
	private ArrayList<Comment> comment = null;
	
	private String categori = null;
	private int seecount=0;
	private int recommend = 0;
	private ArrayList<String> seecount_ip = null;
	private ArrayList<String> recommend_ip = null;
	
	
	public Product(){
		time="";
		seller="";
		product_num="";
		price="";
		title="";
		file_name="";
		file = null;
		textarea="";
		status="";
		comment = new ArrayList<Comment>();
		categori="";
		seecount=0;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getProduct_num() {
		return product_num;
	}

	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getTextarea() {
		return textarea;
	}

	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ArrayList<Comment> getComment() {
		return comment;
	}

	public void setComment(ArrayList<Comment> comment) {
		this.comment = comment;
	}

	public String getCategori() {
		return categori;
	}

	public void setCategori(String categori) {
		this.categori = categori;
	}

	public int getSeecount() {
		return seecount;
	}

	public void setSeecount(int seecount) {
		this.seecount = seecount;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public ArrayList<String> getSeecount_ip() {
		return seecount_ip;
	}

	public void setSeecount_ip(ArrayList<String> seecount_ip) {
		this.seecount_ip = seecount_ip;
	}

	public ArrayList<String> getRecommend_ip() {
		return recommend_ip;
	}

	public void setRecommend_ip(ArrayList<String> recommend_ip) {
		this.recommend_ip = recommend_ip;
	}
	
	
}
