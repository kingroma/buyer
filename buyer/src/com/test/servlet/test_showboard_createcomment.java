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
import com.product.Comment;
import com.product.Product;

/**
 * Servlet implementation class test_showboard_createcomment
 */
@WebServlet("/test_showboard_createcomment")
public class test_showboard_createcomment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showboard_createcomment() {
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
		
		System.out.println("test_showboard_createcomment");
		
		String buyer_id = request.getParameter("buyer_id");
		String board_num = request.getParameter("board_num");
		String textarea = request.getParameter("textarea");
		
		if(textarea==null)
			textarea="";
		
		
		Admin_BoardManager abm = new Admin_BoardManager(null);
		Board p = abm.getBoard(board_num);
		
		boolean check = true;
		if(p.getReply()==null){
			p.setReply(new ArrayList<Board>());
		}
		Board b = new Board();
		
		b.setBuyer(buyer_id);
		
		b.setBoard_num(board_num);
		b.setTextarea(textarea);
		//p.getComment().add(c);
		
		p.getReply().add(0,b);
		
		
		abm.fixBoard(p);
	}

}
