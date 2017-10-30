package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BuyerManager;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Buyer b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, id);
		
		if(b!=null){
			if(pw.equals(b.getPw())){
				System.out.println(id);
				request.getSession().setAttribute("buyer_id", id);
				
				PrintWriter out = response.getWriter();
				out.print("<html><head>"
						+ "<script>"
						+ "alert('welcome');location.replace('main');"
						+ "</script>"
						+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
						+ "</head><body>");
				out.print("</body></html>");
				
				//RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
				
				//rd.forward(request,response);
			}
			else{
				PrintWriter out = response.getWriter();
				out.print("<html><head>"
						+ "<script>"
						+ "alert('something wrong');location.replace('login');"
						+ "</script>"
						+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
						+ "</head><body>");
				out.print("</body></html>");
			}
		}
		else{
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('something wrong');location.replace('login');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");	
		}
	}

}
