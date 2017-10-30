package com.test.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BuyerManager;

/**
 * Servlet implementation class test_search_idpw_pw
 */
@WebServlet("/test_search_idpw_check_pw")
public class test_search_idpw_check_pw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_search_idpw_check_pw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String birth = request.getParameter("birth");
		String id = request.getParameter("id");
		String return_string = " "+checkPw(id,birth)+" ";
		
		
		
		
		PrintWriter out = response.getWriter();
		out.print("<html><head>"
				
				+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
				+ "<script>"
				+ "alert('id : "+id+" / birth : "+birth+""
						+ return_string
						+ "');"
				+ "</script>"
				+ "</head><body>");
		out.print("</body></html>");
		
	}
	public String checkPw(String id , String birth){
		Admin_BuyerManager buyer_manager = new Admin_BuyerManager();
		File file = new File(ManagerStaticAttribute.buyerDataPath);
		String[] buyer_string_list = file.list();
		ArrayList<Buyer> buyer_list = new ArrayList<Buyer>();
		ArrayList<Buyer> return_list = new ArrayList<Buyer>();
		
		for(int i = 0 ; i < buyer_string_list.length ; i ++){
			buyer_list.add(buyer_manager.getBuyer(ManagerStaticAttribute.buyerDataPath, buyer_string_list[i]));
		}
		for(int i = 0 ; i < buyer_list.size() ; i ++){
			if(buyer_list.get(i).getBirth().equals(birth))
				return_list.add(buyer_list.get(i));
		}
		
		for(int i = 0 ; i < return_list.size() ; i ++){
			if(return_list.get(i).getId().equals(id)){
				return "your pw : "+return_list.get(i).getPw();
			}
		}
		
		return "i can't find";
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
