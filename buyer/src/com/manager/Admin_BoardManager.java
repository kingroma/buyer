package com.manager;

import java.io.File;
import java.util.ArrayList;

import com.board.*;
import com.common.CurrentTime;
import com.common.DataClassManager;
import com.common.ManagerStaticAttribute;
import com.common.SortArrayList;

public class Admin_BoardManager {
	private Board b = null;
	private DataClassManager dcm;
	private String board_num = null; 
	private String path = ManagerStaticAttribute.boardDataPath;
	private CurrentTime ct = new CurrentTime();
	
	private String urlPath = ManagerStaticAttribute.dataUrl+"/board";
	private SortArrayList sal = new SortArrayList();
	public Admin_BoardManager(Board b){
		this.b = b;
		dcm = new DataClassManager();
	}
	
	public ArrayList<Board> getMyBoard(String buyer_id){
		ArrayList<Board> all_list = this.getAllBoardList();
		ArrayList<Board> return_list = new ArrayList<Board>();
		
		for(int i = 0 ; i < all_list.size() ; i ++){
			if(all_list.get(i).getBuyer().equals(buyer_id)){
				return_list.add(all_list.get(i));
			}
		}
		
		return return_list;
	}
	
	public ArrayList<Board> getBestReplyBoardList(){
		int count = 5;
		int min = 0;
		ArrayList<Board> reployboard = new ArrayList<Board>();
		
		File file = new File(path);
		String[] file_list = file.list();
		
		for(int i = 0 ; i < count ; i ++){
			reployboard.add(this.getBoard(file_list[i]));
		}
		
		for(int i = count ; i < file_list.length ; i ++){
			Board temp_board = this.getBoard(file_list[i]);
			int num = returnListMinReply(reployboard);
			if(temp_board.getReply().size()>reployboard.get(num).getReply().size()){
				reployboard.set(num, temp_board);
			}
		}
		
		for(int i = 0 ; i < count-1 ; i ++){
			for(int j = i+1 ; j < count ; j ++){
				if(reployboard.get(i).getReply().size()<reployboard.get(j).getReply().size()){
					Board temp_board = reployboard.get(i);
					Board temp_board2 = reployboard.get(j);
					reployboard.set(i,temp_board2);
					reployboard.set(j,temp_board);
				}
			}
		}
		
		return reployboard;
	}
	
	public ArrayList<Board> getBestCountBoardList(){
		int count = 5;
		int min = 0;
		ArrayList<Board> countboard = new ArrayList<Board>();
		
		File file = new File(path);
		String[] file_list = file.list();
		
		for(int i = 0 ; i < count ; i ++){
			countboard.add(this.getBoard(file_list[i]));
		}
		
		for(int i = count ; i < file_list.length ; i ++){
			Board temp_board = this.getBoard(file_list[i]);
			int num = returnListMin(countboard);
			if(temp_board.getSeecount()>countboard.get(num).getSeecount()){
				countboard.set(num, temp_board);
			}
		}
		
		for(int i = 0 ; i < count-1 ; i ++){
			for(int j = i+1 ; j < count ; j ++){
				if(countboard.get(i).getSeecount()<countboard.get(j).getSeecount()){
					Board temp_board = countboard.get(i);
					Board temp_board2 = countboard.get(j);
					countboard.set(i,temp_board2);
					countboard.set(j,temp_board);
				}
			}
		}
		
		return countboard;
	}
	
	public int returnListMin(ArrayList<Board> countboard){
		int num = 0;
		int min = countboard.get(0).getSeecount() ;
		for(int i = 1 ; i < countboard.size() ; i ++){
			if(countboard.get(i).getSeecount()<min){
				num = i;
				min = countboard.get(i).getSeecount();
			}
		}
		return num;
	}
	
	public int returnListMinReply(ArrayList<Board> replyboard){
		int num = 0;
		int min = replyboard.get(0).getReply().size() ;
		for(int i = 1 ; i < replyboard.size() ; i ++){
			if(replyboard.get(i).getReply().size()<min){
				num = i;
				min = replyboard.get(i).getReply().size();
			}
		}
		return num;
	}
	
	public ArrayList<Board> getBestRecommendBoardList(){
		int count = 5;
		int min = 0;
		ArrayList<Board> countboard = new ArrayList<Board>();
		
		File file = new File(path);
		String[] file_list = file.list();
		
		for(int i = 0 ; i < count ; i ++){
			countboard.add(this.getBoard(file_list[i]));
		}
		
		for(int i = count ; i < file_list.length ; i ++){
			Board temp_board = this.getBoard(file_list[i]);
			int num = returnListMin(countboard);
			if(temp_board.getRecommend()>countboard.get(num).getRecommend()){
				countboard.set(num, temp_board);
			}
		}
		
		for(int i = 0 ; i < count-1 ; i ++){
			for(int j = i+1 ; j < count ; j ++){
				if(countboard.get(i).getRecommend()<countboard.get(j).getRecommend()){
					Board temp_board = countboard.get(i);
					Board temp_board2 = countboard.get(j);
					countboard.set(i,temp_board2);
					countboard.set(j,temp_board);
				}
			}
		}
		
		return countboard;
	}
	public int returnListMinRecommend(ArrayList<Board> countboard){
		int num = 0;
		int min = countboard.get(0).getRecommend() ;
		for(int i = 1 ; i < countboard.size() ; i ++){
			if(countboard.get(i).getRecommend()<min){
				num = i;
				min = countboard.get(i).getRecommend();
			}
		}
		return num;
	}
	public ArrayList<Board> getNewBoardList(){
		int howManyBoardDoYouWant = 10 ;
		String[] temp_new_board_string_list = getCommonBoardList();
		
		temp_new_board_string_list = sal.SortASC_String_ArrayList_Board(temp_new_board_string_list);
		
		ArrayList<Board> board_list = new ArrayList<Board>();
		
		for(int i = temp_new_board_string_list.length-1 ; i > temp_new_board_string_list.length-1-howManyBoardDoYouWant ; i --){
			board_list.add(this.getBoard(temp_new_board_string_list[i]));
		}
		
		return board_list;
	}
	public ArrayList<Board> getAllBoardList(){
		int howManyBoardDoYouWant = 10 ;
		String[] temp_new_board_string_list = getCommonBoardList();
		
		temp_new_board_string_list = sal.SortASC_String_ArrayList_Board(temp_new_board_string_list);
		
		ArrayList<Board> board_list = new ArrayList<Board>();
		
		for(int i = temp_new_board_string_list.length-1 ; i >= 0 ; i --){
			board_list.add(this.getBoard(temp_new_board_string_list[i]));
		}
		
		return board_list;
	}
	
	
	
	public String[] getKeywordBoard(String keyword){
		File file = null;
		String temp = null;
		Board temp_board = null;
		ArrayList<String> string_board_list = new ArrayList<String>();
		String board_num = null;
		int count = 0;
		while(true){
			board_num = "b"+count;
			file = null;
			temp_board = null;
			
			file = new File(path+"/"+board_num+"/board.data");
			
			if(file.exists()){
				temp_board = this.getBoard(board_num);
				
				if(temp_board!=null){
					String title = "";
					String categori = "";
					String textarea = "";
					String temp_board_num = "";
					if(temp_board.getTitle()!=null){
						title = temp_board.getTitle();
					}
					if(temp_board.getCategori()!=null){
						categori = temp_board.getCategori();
					}
					if(temp_board.getTextarea()!=null){
						textarea = temp_board.getTextarea();
					}
					if(temp_board.getBoard_num()!=null){
						temp_board_num = temp_board.getBoard_num();
					}
					
					
					if(this.match(title, keyword)){
						string_board_list.add(temp_board.getBoard_num());
					}
					
					
					
					else if(this.match(categori, keyword)){
						string_board_list.add(temp_board.getBoard_num());
						
					}
					
					
					else if(this.match(textarea, keyword)){
						string_board_list.add(temp_board.getBoard_num());
						
					}
					else if(this.match(temp_board_num, keyword)){
						string_board_list.add(temp_board.getBoard_num());
					}
				}
				count++;
			}else{
				
				break;
			}
			
			
		}
		String[] return_string = new String[string_board_list.size()];
		for(int i = 0 ; i < string_board_list.size() ; i ++){
			return_string[i] = string_board_list.get(i);
		}
		return return_string;
		
	}
	
	public boolean match(String str, String keyword){
		if(str == null | keyword == null){
			return false;
		}
		Boolean found = str.contains(keyword);
		if(found){
			return true;
		}
		return false;
	}
	
	public String[] getCommonBoardList(){
		
		int count = new File(path).list().length;
		
		String[] temp_str_list = new String[count];
		for(int i = 0 ; i < count ; i ++){
			temp_str_list[i] = "b"+i+"";
		}
		return temp_str_list;
		//return new SortArrayList().SortStringArray(temp_str_list);
	}
	
	public boolean createBoard(){
		if(b!=null){
			if(b.getBoard_num()==null|b.getBoard_num().equals("")){
				File file = null;
				int temp_board_num = 0;
				while(true){
					file = null;
					file = new File(path+"/b"+temp_board_num+"");
					if(file.exists()){
						temp_board_num++;
					}else{
						b.setBoard_num("b"+temp_board_num+"");
						break;
					}
				}
				//아직 생성은 안함 . 
			}else{
				board_num = b.getBoard_num();
			}
			
			File file = new File(path+"/"+board_num+"");
			if(!file.exists())
				file.mkdirs();
			if(b.getBoard_num().equals("")|b==null)
				b.setBoard_num(board_num+"");
			b.setTime(ct.getTime());
			dcm.save(b, path+"/"+board_num+""+"/board.data");
			
			return true;
		}
		return false;
	}
	
	public Board getBoard(String num){
		Board temp_board = (Board)dcm.load(path+"/"+num+""+"/board.data");
		if(temp_board!=null)
			return temp_board;
		return null;
	}
	public Board getBoardByUrl(String num){
		Board temp_board = (Board)dcm.load(urlPath+"/"+num+""+"/board.data");
		if(temp_board!=null)
			return temp_board;
		return null;
	}
	public boolean createReplyBoard(Board b_reply){
		if(b!=null){
			
		}
		
		return false;
	}
	public String nextEmptyBoardFolder(){
		File file = null;
		int temp_board_num = 0;
		while(true){
			file = null;
			file = new File(path+"/b"+temp_board_num+"");
			if(file.exists()){
				temp_board_num++;
			}else{
				if(b!=null)
					b.setBoard_num(temp_board_num+"");
				break;
			}
		}
		return "b"+temp_board_num+"";
	}
	
	public boolean fixBoard(Board b){
		
		dcm.save(b, path+"/"+b.getBoard_num()+"/board.data");
		
		return true;
	}
	
	public boolean upSeeCount(String board_num,String id){
		Board temp_board = getBoard(board_num);
		
		if(temp_board.getBuyer_id_seecount_list()==null)
			temp_board.setBuyer_id_seecount_list(new ArrayList<String>());
		//System.out.println("id : " + id + " / list size : "+temp_board.getBuyer_id_seecount_list().size());
		for(int i = 0 ; i < temp_board.getBuyer_id_seecount_list().size() ; i ++){
			if(temp_board.getBuyer_id_seecount_list().get(i)!=null){
				if(temp_board.getBuyer_id_seecount_list().get(i).equals(id)){
					//System.out.println(temp_board.getBuyer_id_seecount_list().get(i));
					//System.out.print("false");
					return false;
				}
			}
			
			
		}
		temp_board.getBuyer_id_seecount_list().add(id);
		temp_board.setSeecount(temp_board.getSeecount()+1);
		fixBoard(temp_board);
		//System.out.print("true");
		return true;
	}
	
	public boolean upRecomment(String board_num,String who){
		Board temp_board = getBoard(board_num);
		if(temp_board.getBuyer_id_recommend_list()==null){
			temp_board.setBuyer_id_recommend_list(new ArrayList<String>());
		}
		for(int i = 0 ; i < temp_board.getBuyer_id_recommend_list().size() ; i ++){
			if(temp_board.getBuyer_id_recommend_list().get(i).equals(who)){
				return false;
			}
		}
		
		temp_board.getBuyer_id_recommend_list().add(who);
		//temp_board.setBuyer_id_recommend_list(buyer_id_recommend_list);
		temp_board.setRecommend(temp_board.getRecommend()+1);
		
		this.fixBoard(temp_board);
		return true;
	}

	public Board getB() {
		return b;
	}

	public void setB(Board b) {
		this.b = b;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	public void printBoard(String num){
		Board temp_board = (Board)dcm.load(path+"/"+num+""+"/board.data");
		System.out.println(temp_board.getTextarea());
		System.out.println(temp_board.getTitle());
		System.out.println(temp_board.getTime());
		System.out.println(temp_board.getBoard_num());
		
	}
}
