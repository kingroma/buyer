package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manager.Admin_BoardManager;

/**
 * Servlet implementation class board_upboardrecommend
 */
@WebServlet("/board_upboardrecommend")
public class board_upboardrecommend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public board_upboardrecommend() {
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
		String who = (String)request.getSession().getAttribute("buyer_id");
		String currentPage = (String)request.getParameter("currentPage");
		
		if(who==null){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('loginplease');location.replace('login');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}else{
			Admin_BoardManager abm = new Admin_BoardManager(null);
			if(abm.upRecomment(board_num, who)){
			
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('complete');location.replace('board?currentPage="+currentPage+"');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
			}else{
				PrintWriter out = response.getWriter();
				out.print("<html><head>"
						+ "<script>"
						+ "alert('you already did');location.replace('board?currentPage="+currentPage+"');"
						+ "</script>"
						+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
						+ "</head><body>");
				out.print("</body></html>");
			}
		}
		
		
		//abm.upRecomment()
	}

}
