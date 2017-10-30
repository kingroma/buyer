package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.Board;
import com.manager.Admin_BoardManager;

/**
 * Servlet implementation class test_boardfix
 */
@WebServlet("/test_boardfix")
public class test_boardfix extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_boardfix() {
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
		
		String buyer_id = request.getParameter("buyer_id");
		String board_num = request.getParameter("board_num");
		String textarea = request.getParameter("textarea");
		String title = request.getParameter("title");
		
		if(textarea==null)
			textarea="";
		if(title==null)
			title="";
		
		//System.out.println("buyer id : "+buyer_id);
		//System.out.println("board_num : "+board_num);
		//System.out.println("textarea : "+textarea);
		//System.out.println("title : "+title);
		
		Admin_BoardManager abm = new Admin_BoardManager(null);
		Board b = abm.getBoard(board_num);
		String location = "/buyer/test_showboard_detail?board_num="+b.getBoard_num(); 
		if(b.getBuyer().equals(buyer_id)){
			b.setTextarea(textarea);
			b.setTitle(title);
			abm.fixBoard(b);
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
					+ "<script>"
					+ "alert('수정성공');location.replace('"+location+"');"
					+ "</script>"
					+ "</head><body>");
			out.print("</body></html>");
		}else{
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
					+ "<script>"
					+ "alert('something wrong');location.replace('"+location+"');"
					+ "</script>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		
	}

}
