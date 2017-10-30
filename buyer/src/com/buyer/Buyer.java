package com.buyer;

import java.io.Serializable;
import java.util.ArrayList;

import com.order.Order;
import com.product.Comment;

public class Buyer implements Serializable{
	private static final long serialVersionUID = 5L;
	private String id = null;
	private String pw = null;
	private String birth = null;
	private String adress = null;
	private String phone = null;
	private String phone2 = null;
	private String mail = null;
	private String join_date = null;
	
	private ArrayList<Order> order = null;
	private ArrayList<Comment> comment = null;

	private String status="";
	private String status_msg="";
	public Buyer(){
		id="";
		pw="";
		birth="";
		adress="";
		phone="";
		phone2="";
		mail="";
		join_date="";
		order = new ArrayList<Order>();
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus_msg() {
		return status_msg;
	}

	public void setStatus_msg(String status_msg) {
		this.status_msg = status_msg;
	}
	
	
}
