package com.board;

import java.io.Serializable;
import java.util.ArrayList;

public class Board implements Serializable{
	private static final long serialVersionUID = 76L;
	
	private int recommend = 0;
	private String categori = "";
	private String Buyer = "";
	private String board_num = "";
	private ArrayList<Board> reply = null;
	private String time = "";
	private int good = 0;
	private int bad = 0;
	private int seecount = 0 ;
	private String textarea = "";
	private String title = "";
	private String file_name = "";
	private String file_path = "";
	private ArrayList<String> buyer_id_recommend_list = null;
	private ArrayList<String> buyer_id_seecount_list = null;
	
	private String status = "";
	public Board(){
		buyer_id_seecount_list = new ArrayList<String>();
		buyer_id_recommend_list = new ArrayList<String>();
		reply = new ArrayList<Board>();
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public ArrayList<Board> getReply() {
		return reply;
	}

	public void setReply(ArrayList<Board> reply) {
		this.reply = reply;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getBad() {
		return bad;
	}

	public void setBad(int bad) {
		this.bad = bad;
	}

	public int getSeecount() {
		return seecount;
	}

	public void setSeecount(int seecount) {
		this.seecount = seecount;
	}

	public String getTextarea() {
		return textarea;
	}

	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getCategori() {
		return categori;
	}

	public void setCategori(String categori) {
		this.categori = categori;
	}

	public String getBuyer() {
		return Buyer;
	}

	public void setBuyer(String buyer) {
		Buyer = buyer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public ArrayList<String> getBuyer_id_recommend_list() {
		return buyer_id_recommend_list;
	}

	public void setBuyer_id_recommend_list(ArrayList<String> buyer_id_recommend_list) {
		this.buyer_id_recommend_list = buyer_id_recommend_list;
	}

	public ArrayList<String> getBuyer_id_seecount_list() {
		return buyer_id_seecount_list;
	}

	public void setBuyer_id_seecount_list(ArrayList<String> buyer_id_seecount_list) {
		this.buyer_id_seecount_list = buyer_id_seecount_list;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
