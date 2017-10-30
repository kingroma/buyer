package com.test.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.Board;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BoardManager;
import com.manager.Admin_ProductManager;
import com.product.Product;

/**
 * Servlet implementation class test_showboard_uplike
 */
@WebServlet("/test_showboard_uplike")
public class test_showboard_uplike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showboard_uplike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		
		String buyer_id=request.getParameter("buyer_id");
		String board_num =request.getParameter("board_num"); 
		
		Admin_BoardManager abm = new Admin_BoardManager(null);
		Board b = abm.getBoard(board_num);
		
		boolean check = true;
		if(b.getBuyer_id_recommend_list()==null){
			b.setBuyer_id_recommend_list(new ArrayList<String>());
		}
		for(int i = 0 ; i < b.getBuyer_id_recommend_list().size() ; i ++){
			if(b.getBuyer_id_recommend_list().get(i).equals(buyer_id)){
				check = false;
				break;
			}
		}
		if(check){
			b.getBuyer_id_recommend_list().add(buyer_id);
			b.setRecommend(b.getRecommend()+1);
			//p.setRecommend(p.getRecommend()+1);
			abm.fixBoard(b);	
			
		}
		
	}

}
