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
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BuyerManager;

/**
 * Servlet implementation class test_myinfo_fixbuyerinfo
 */
@WebServlet("/test_myinfo_fixbuyerinfo")
public class test_myinfo_fixbuyerinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_myinfo_fixbuyerinfo() {
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
		
		
		String buyer_id = request.getSession().getAttribute("buyer_id").toString();
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String mail = request.getParameter("mail");
		String address = request.getParameter("address");
		
		String url = "/buyer/test_myinfo";
		
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Buyer b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, buyer_id);
		b.setPw(pw);
		b.setBirth(birth);
		b.setPhone(phone);
		b.setMail(mail);
		b.setAdress(address);
		abm.fixBuyer(ManagerStaticAttribute.buyerDataPath, b);
		
		if(true){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('변경 완료');location.replace('/buyer/test_myinfo');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		
		
	}

}
