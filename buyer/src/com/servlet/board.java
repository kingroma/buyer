package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SortArrayList;
import com.manager.Admin_BoardManager;

/**
 * Servlet implementation class board
 */
@WebServlet("/board")
public class board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public board() {
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
		
		String keyword = request.getParameter("keyword");
		
		SortArrayList sal = new SortArrayList();
		if(keyword==null){
			Admin_BoardManager abm = new Admin_BoardManager(null);
			RequestDispatcher rd = request.getRequestDispatcher("/board.jsp");
			
			
			request.setAttribute("board_list", sal.SortStringArray(abm.getCommonBoardList()));
			rd.forward(request,response);
			
		}else{
			
			Admin_BoardManager abm = new Admin_BoardManager(null);
			String[] temp = abm.getKeywordBoard(keyword);
			RequestDispatcher rd = request.getRequestDispatcher("/board.jsp?keyword="+keyword);
			request.setAttribute("board_list", sal.SortStringArray(temp));
			rd.forward(request,response);
			
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
