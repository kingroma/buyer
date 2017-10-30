package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.ManagerStaticAttribute;
import com.common.SuperAdminClass;
import com.manager.Admin_OrderManager;
import com.manager.Admin_ProductManager;
import com.order.Order;
import com.product.Product;

/**
 * Servlet implementation class test_myinfo_order_detail_comment
 */
@WebServlet("/test_myinfo_order_detail_comment")
public class test_myinfo_order_detail_comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_myinfo_order_detail_comment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String order_num = (String)request.getParameter("order_num");
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		
		if(order_num!=null|buyer_id!=null){
		
			Admin_OrderManager abm = new Admin_OrderManager();
			Admin_ProductManager apm = new Admin_ProductManager();
			Order o = abm.getOrder(ManagerStaticAttribute.orderDataPath, order_num);
			Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, o.getProduct_num());
		
			RequestDispatcher rd = request.getRequestDispatcher("/test/test_myinfo_order_detail_comment.jsp");
			
			request.setAttribute("order", o);
			request.setAttribute("product", p);
			
			rd.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String seller_id = request.getParameter("seller_id");
		String buyer_id = request.getParameter("buyer_id");
		String order_num = request.getParameter("order_num");
		String textarea = request.getParameter("textarea");
		String product_num = request.getParameter("product_num");
		
		String url = "http://localhost:8080/buyer/test_myinfo_order_detail_comment?order_num="+order_num;
		
		if(seller_id==null|buyer_id==null|order_num==null|textarea==null|product_num==null){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('something wrong');location.replace('"+url+"');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		
		//System.out.println(seller_id + "/" + buyer_id + "/" + order_num);
		else{
			SuperAdminClass sac = new SuperAdminClass(buyer_id , seller_id , product_num , order_num);
			sac.createOrderCommentByBuyer(textarea);
	
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('complete');location.replace('"+url+"');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
	}

}
