package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.buyer.Buyer;
import com.common.CurrentTime;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BuyerManager;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class join
 */
@WebServlet("/join")
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public join() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd = request.getRequestDispatcher("/join.jsp");
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MultipartRequest multi = new MultipartRequest(request, null);
		
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String adress = request.getParameter("adress");
		String phone = request.getParameter("phone");
		String mail = request.getParameter("mail");
		
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Buyer b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, id);
		if(b==null)
			System.out.println("null");
		else{
			System.out.println("nt null null");
		}
		if(b==null){
			if(id!=null|pw!=null|birth!=null|adress!=null|phone!=null|mail!=null){
				
				b = new Buyer();
				b.setId(id);
				b.setPw(pw);
				b.setBirth(birth);
				b.setAdress(adress);
				b.setPhone(phone);
				b.setMail(mail);
				CurrentTime ct = new CurrentTime();
				b.setJoin_date(ct.getTime());
				
				if(abm.createBuyer(ManagerStaticAttribute.buyerDataPath, b)){
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					
					PrintWriter out = response.getWriter();
					out.print("<html><head>"
							+ "<script>"
							+ "alert('welcome.');location.replace('main');"
							+ "</script>"
							+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
							+ "</head><body>");
					out.print("</body></html>");		
				}else{
					PrintWriter out = response.getWriter();
					out.print("<html><head><script>alert('something wrong');location.replace('index.jsp');</script></head><body>");
					out.print("</body></html>");
					//response.sendRedirect("index.jsp");
				}
			}
			
			
			
			
		}else{
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('can t use ID .');location.replace('join');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");	
		}
		
	}

}
