package com.test.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.ManagerStaticAttribute;

/**
 * Servlet implementation class test_account_check_id
 */
@WebServlet("/test_account_check_id")
public class test_account_check_id extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_account_check_id() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//test_account_check_id
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		File file = new File(ManagerStaticAttribute.buyerDataPath);
		String[] buyer_string_list = file.list();
		boolean check = true;
		
		for(int i = 0 ; i < buyer_string_list.length ; i ++){
			if(buyer_string_list[i].equals(id))
				check = false;
		}
		if(check){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "parent.document.getElementById('idCheck').value='true';"
					+ "parent.document.getElementById('id').readOnly=true;"
					+ "alert('사용가능. ');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
					+ "</head><body>");
			out.print("</body></html>");
		}else{
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('아이디가 있습니다. ');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		/*
		 * 
		 * PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('please login');location.replace('/buyer/test_main');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
