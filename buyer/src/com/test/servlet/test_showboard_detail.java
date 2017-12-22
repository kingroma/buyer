package com.test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class test_showboard_detail
 */
@WebServlet("/test_showboard_detail")
public class test_showboard_detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showboard_detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
		System.out.println(request.getParameter("board_num"));
		
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		System.out.println(buyer_id);
		String board_num = request.getParameter("board_num");		
		Admin_BoardManager abm = new Admin_BoardManager(null);
		
		Board b = abm.getBoard(board_num);
		//abm.setB(b);
		
		//b.setStatus("null");
		//abm.fixBoard(b);
		//abm.setB(b);
		abm.upSeeCount(board_num, buyer_id);
		
		System.out.println(b.getTitle());
		System.out.println(b.getStatus());
		if(b.getStatus()==null){
			System.out.println(1);
			RequestDispatcher rd = request.getRequestDispatcher("/test/test_showboard_detail.jsp");
			
			request.setAttribute("board",b);
			
			rd.forward(request,response);
		}
		else if(b.getStatus().equals("null")){
			System.out.println(2);
			RequestDispatcher rd = request.getRequestDispatcher("/test/test_showboard_detail.jsp");
			
			request.setAttribute("board",b);
			
			rd.forward(request,response);
		}else if(b.getStatus().equals("error")){
			System.out.println(3);
			RequestDispatcher rd = request.getRequestDispatcher("/test/test_showboard_detail_error.jsp");
			
			//request.setAttribute("board",b);
			
			rd.forward(request,response);
		}else {//여기가 문제 
			//System.out.println(4);
			//RequestDispatcher rd = request.getRequestDispatcher("/test/test_showboard_detail.jsp");
			
			//request.setAttribute("board",b);
		}
		
		//abm.fixBoard(b);
		
		//b = abm.getBoard(board_num);
	
		//response.sendRedirect("/test/test_showboard_detail.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
