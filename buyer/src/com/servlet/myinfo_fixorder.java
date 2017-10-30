package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.common.SuperAdminClass;
import com.manager.Admin_BuyerManager;
import com.manager.Admin_OrderManager;
import com.manager.Admin_ProductManager;
import com.manager.Admin_SellerManager;
import com.order.Order;
import com.seller.Seller;

/**
 * Servlet implementation class myinfo_fixorder
 */
@WebServlet("/myinfo_fixorder")
public class myinfo_fixorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myinfo_fixorder() {
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
		
		//myinfo_fixorder
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String order_num = request.getParameter("order_num");
		String price = request.getParameter("price");
		String comment = request.getParameter("comment");
		String phone = request.getParameter("phone");
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		String seller_id = (String)request.getParameter("seller_id");
		
		System.out.println("price : "+price);
		
		if(order_num==null|price==null|comment==null|phone==null|buyer_id==null|seller_id==null){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('something wrong');location.replace('myinfo');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}else{
			
			SuperAdminClass admin = new SuperAdminClass(buyer_id,seller_id,null,order_num);
			
			admin.fixOrderInfoByBuyer(price, comment, phone);
			
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('complete');location.replace('myinfo');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		
	}

}
