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
import com.common.GetProductList;
import com.manager.Admin_BoardManager;
import com.product.Product;

/**
 * Servlet implementation class test_main
 */
@WebServlet("/test_main")
public class test_main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_main() {
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
		
		GetProductList gnp = new GetProductList();
		Admin_BoardManager abm = new Admin_BoardManager(null);//board => new and top recommend
		
		ArrayList<Product> new_product = gnp.getNewProductList();
		ArrayList<Board> new_board = abm.getNewBoardList();
		
		//ArrayList<Product> see_product = (ArrayList<Product>)request.getSession().getAttribute("see_product");
		
		ArrayList<Board> see_count_board = abm.getBestCountBoardList();
		ArrayList<Board> recommend_board = abm.getBestRecommendBoardList();
		for(int i = 0 ; i < new_board.size() ; i ++){
			//System.out.println("main board file name  :"+new_board.get(i).getFile_name());
		}
		
		//SortArrayList sal = new SortArrayList();
		//new_product = sal.SortProduct(new_product); 
		
		RequestDispatcher rd = request.getRequestDispatcher("/test/test1.jsp");
		request.setAttribute("see_count_board", see_count_board);
		request.setAttribute("new_product", new_product);
		request.setAttribute("new_board", new_board);
		request.setAttribute("recommend_board", recommend_board);
		
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}
	public void getNewBoard(){
		Admin_BoardManager abm = new Admin_BoardManager(null);//board => new and top recommend
		String[] temp_new_board_string_list = abm.getCommonBoardList();
		int howmanynewboard = 10;//개수
		
		ArrayList<Board> board_list = abm.getNewBoardList();
		
	}
}
