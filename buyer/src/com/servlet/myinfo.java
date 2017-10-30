package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.common.SortArrayList;
import com.manager.Admin_BuyerManager;
import com.manager.Admin_ProductManager;
import com.order.Order;
import com.product.Product;

/**
 * Servlet implementation class myinfo
 */
@WebServlet("/myinfo")
public class myinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myinfo() {
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
		
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		if(buyer_id==null||buyer_id==""){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('please login');location.replace('login');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		
		
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Admin_ProductManager apm = new Admin_ProductManager();
		Buyer b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, buyer_id);
		//apm.getProduct(ManagerStaticAttribute.productDataPath, num);
		
		ArrayList<Order> order_list = b.getOrder(); //error
		
		ArrayList<Product> orderproduct_list = new ArrayList<Product>();
		
		SortArrayList sal = new SortArrayList();
		order_list = sal.SortOrder(order_list);
		orderproduct_list = sal.SortProduct(orderproduct_list);
		
		for(int i = 0 ; i < order_list.size() ; i ++){
			Product product_temp = apm.getProduct(ManagerStaticAttribute.productDataPath, order_list.get(i).getProduct_num());
			
				
			orderproduct_list.add(product_temp);
		}
		System.out.println(orderproduct_list.size());
		for(int i = 0 ; i < orderproduct_list.size(); i ++){
			System.out.println(orderproduct_list.get(i).getTitle());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/myinfo.jsp");
		request.setAttribute("order_list", order_list);
		request.setAttribute("orderproduct_list", orderproduct_list);
		rd.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}
	
}
