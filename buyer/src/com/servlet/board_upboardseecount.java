package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manager.Admin_BoardManager;

/**
 * Servlet implementation class board_upboardseecount
 */
@WebServlet("/board_upboardseecount")
public class board_upboardseecount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public board_upboardseecount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("get info do get");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//System.out.println("get info post");
		
		String board_num = request.getParameter("board_num");
		String ip = request.getParameter("ip");
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		System.out.println(ip+"] buyer_id : "+buyer_id);
		
		Admin_BoardManager abm = new Admin_BoardManager(null);
		
		if(buyer_id==null)
			abm.upSeeCount(board_num,ip);
		else if(buyer_id!=null)
			abm.upSeeCount(board_num,buyer_id);
		//System.out.println("upseecount");
	}

}
