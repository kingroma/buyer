package com.servlet;

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
 * Servlet implementation class board_createreply
 */
@WebServlet("/board_createreply")
public class board_createreply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public board_createreply() {
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
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String board_num = request.getParameter("board_num");
		String textarea = request.getParameter("textarea");
		
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		String currentPage = (String)request.getParameter("currentPage");
		
		if(buyer_id==null){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('please login');location.replace('login');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}else{
		//System.out.println(buyer_id+"_"+board_num+"_"+textarea);
			Admin_BoardManager abm = new Admin_BoardManager(null);
			Board b = abm.getBoard(board_num);
			abm.setB(b);
			System.out.println("title : "+b.getTitle());
			Board reply = new Board();
			reply.setTextarea(textarea);
			reply.setBuyer(buyer_id);
			
			b.getReply().add(reply);
			
			abm.fixBoard(b);
			
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('complete');location.replace('board?currentPage="+currentPage+"');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		
		
	}

}
