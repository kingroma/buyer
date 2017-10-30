package com.test.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BuyerManager;

/**
 * Servlet implementation class test_login
 */
@WebServlet("/test_login")
public class test_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_login() {
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
		//response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
		String location = request.getParameter("location");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(location);
		
		location = "/buyer/test_main";
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Buyer b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, id);
		test_message_class msg = null;
		if(b!=null){
			if(pw.equals(b.getPw())){
				if(b.getStatus()==null){
				
					request.getSession().setAttribute("buyer_id", id);
					
					msg = new test_message_class("환영합니다.",""+location,request,response);
				}else if (b.getStatus().equals("")){
					request.getSession().setAttribute("buyer_id", id);
					
					msg = new test_message_class("환영합니다.",""+location,request,response);
				}else if(b.getStatus().equals("error")){
					msg = new test_message_class("회원 제한 로그인 불가",""+location,request,response);
				}
			}else{
				msg = new test_message_class("비밀번호가 일치하지 않습니다..",""+location+"?login=false",request,response);
			}
		}else{
			msg = new test_message_class("아이디가 없습니다.",""+location+"?login=false",request,response);
		}
		
		
	
		
	}

}
