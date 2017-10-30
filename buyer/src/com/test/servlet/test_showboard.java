package com.test.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.Board;
import com.manager.Admin_BoardManager;

/**
 * Servlet implementation class test_showboard
 */
@WebServlet("/test_showboard")
public class test_showboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
		Admin_BoardManager abm = new Admin_BoardManager(null);
		ArrayList<Board> board_list = abm.getAllBoardList();
		
		ArrayList<Board> best_recommend_board = abm.getBestRecommendBoardList();//추천
		ArrayList<Board> best_reply_board = abm.getBestReplyBoardList();//댓글
		ArrayList<Board> best_count_board = abm.getBestCountBoardList();//조회수
		
		best_recommend_board.remove(best_recommend_board.size()-1);
		best_recommend_board.remove(best_recommend_board.size()-1);
		best_reply_board.remove(best_reply_board.size()-1);
		best_reply_board.remove(best_reply_board.size()-1);
		best_count_board.remove(best_count_board.size()-1);
		best_count_board.remove(best_count_board.size()-1);
		
		//board_list.get(0).getBuyer
		
		RequestDispatcher rd = request.getRequestDispatcher("/test/test_showboard.jsp");
		if(request.getParameter("focus")!=null){
			request.setAttribute("focus", request.getParameter("focus"));
		}
		//request.setAttribute("focus", "A0");
		
		request.setAttribute("board_list", board_list);
		request.setAttribute("best_recommend_board", best_recommend_board);
		request.setAttribute("best_reply_board",best_reply_board);
		request.setAttribute("best_count_board", best_count_board);
	
		rd.forward(request,response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
