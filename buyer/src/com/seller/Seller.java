package com.seller;

import java.io.Serializable;
import java.util.ArrayList;

import com.order.Order;
import com.product.Comment;
import com.product.Product;

public class Seller implements Serializable{
	private static final long serialVersionUID = 3L;
	private String id = null;
	private String pw = null;
	private String birth = null;
	private String adress = null;
	private String phone = null;
	private String phone2 = null;
	private String mail = null;
	private String join_date = null;
	
	private ArrayList<Product> sell_product = null;
	private ArrayList<Order> order = null;
	private ArrayList<Comment> comment = null;
	
	public Seller(){
		id="";
		pw="";
		birth="";
		adress="";
		phone ="";
		phone2="";
		mail="";
		join_date="";
		sell_product = new ArrayList<Product>();
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public ArrayList<Product> getSell_product() {
		return sell_product;
	}

	public void setSell_product(ArrayList<Product> sell_product) {
		this.sell_product = sell_product;
	}

	public ArrayList<Order> getOrder() {
		return order;
	}

	public void setOrder(ArrayList<Order> order) {
		this.order = order;
	}

	public ArrayList<Comment> getComment() {
		return comment;
	}

	public void setComment(ArrayList<Comment> comment) {
		this.comment = comment;
	}
	
	
	
}
