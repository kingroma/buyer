package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.CurrentTime;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BuyerManager;

/**
 * Servlet implementation class test_account
 */
@WebServlet("/test_account")
public class test_account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/test/test_account.jsp");
		
		
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
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String birth=request.getParameter("birth");
		String phone=request.getParameter("phone");
		String adress=request.getParameter("adress");
		String mail=request.getParameter("mail");
		
		System.out.println(id+"/"+
				id+"/"+
				pw+"/"+
				birth+"/"+
				phone+"/"+
				adress+"/"+
				mail+"");
		
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Buyer b = new Buyer();
		b.setId(id);
		b.setPw(pw);
		b.setBirth(birth);
		b.setPhone(phone);
		b.setAdress(adress);
		b.setMail(mail);
		b.setJoin_date(new CurrentTime().getTime());
		
		abm.createBuyer(ManagerStaticAttribute.buyerDataPath, b);
		
		PrintWriter out = response.getWriter();
		out.print("<html><head>"
				+ "<script>"
				+ "alert('가입 완료 . 로그인해주세요. ');"
				+ "location.replace('/buyer/test_main')"
				+ "</script>"
				+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
				+ "</head><body>");
		out.print("</body></html>");
		/*
		RequestDispatcher rd = request.getRequestDispatcher("/test/test_account.jsp");
		
		
		rd.forward(request,response);
		*/
	}

}
