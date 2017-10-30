package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.*;
import com.board.Board;
import com.buyer.*;
import com.common.*;
import com.manager.Admin_BoardManager;

/**
 * Servlet implementation class main
 */
@WebServlet("/main")
public class main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public main() {
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
		
		
		
		GetProductList gnp = new GetProductList();
		Admin_BoardManager abm = new Admin_BoardManager(null);//board => new and top recommend
		
		ArrayList<Product> new_product = gnp.getNewProductList();
		ArrayList<Board> new_board = abm.getNewBoardList();
		
		ArrayList<Product> see_product = (ArrayList<Product>)request.getSession().getAttribute("see_product");
		
		
		//SortArrayList sal = new SortArrayList();
		//new_product = sal.SortProduct(new_product); 
		
		RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
		
		request.setAttribute("new_product", new_product);
		request.setAttribute("new_board", new_board);
		rd.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

	public void getNewBoard(){
		Admin_BoardManager abm = new Admin_BoardManager(null);//board => new and top recommend
		String[] temp_new_board_string_list = abm.getCommonBoardList();
		int howmanynewboard = 10;//개수
		
		ArrayList<Board> board_list = abm.getNewBoardList();
		
	}
}
