package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.CurrentTime;
import com.common.ManagerStaticAttribute;
import com.common.OrderFileNumber;
import com.manager.Admin_BuyerManager;
import com.manager.Admin_OrderManager;
import com.manager.Admin_ProductManager;
import com.manager.Admin_SellerManager;
import com.order.Order;
import com.product.Product;
import com.seller.Seller;

/**
 * Servlet implementation class order
 */
@WebServlet("/order")
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public order() {
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
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String product_num = request.getParameter("product_num");
		String price = request.getParameter("price");
		String phone = request.getParameter("phone");
		String order_comment = request.getParameter("order_comment");
		String buyer = (String)request.getSession().getAttribute("buyer_id");
				
		if(buyer==null){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('please login');location.replace('login');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		else if(product_num==null|price==null|phone==null|order_comment==null){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('something wrong');location.replace('login');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}else{
			if(this.SaveOrder(product_num, price, phone, order_comment, buyer)){
				PrintWriter out = response.getWriter();
				out.print("<html><head>"
						+ "<script>"
						+ "alert('purchase');location.replace('main');"
						+ "</script>"
						+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
						+ "</head><body>");
				out.print("</body></html>");
			}else{
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
	
	
	public boolean SaveOrder(String product_num , String price , String phone , String order_comment , String buyer){

		
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Admin_OrderManager aom = new Admin_OrderManager();
		Admin_ProductManager apm = new Admin_ProductManager();
		Admin_SellerManager asm = new Admin_SellerManager();
		
		CurrentTime ct = new CurrentTime();
		OrderFileNumber onf = new OrderFileNumber();
		String order_num = onf.getFileNum(); 
		onf.createFileNum(order_num);
		
		
		
		Buyer b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, buyer);
		Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, product_num);
		String seller_id = p.getSeller();
		Seller s = asm.getSeller(ManagerStaticAttribute.sellerDataPath,seller_id);
		
		Order o = new Order();
		
		o.setBuyer(buyer);
		o.setBuyer_phone(phone);
		o.setOrder_comment(order_comment);
		o.setOrder_date(ct.getTime());
		
		o.setOrder_num(order_num);
		o.setPrice(price);
		o.setProduct_num(product_num);
		o.setSeller(seller_id);
		o.setStatus("ing");
		
		System.out.println("create 성공"+aom.createOrder(ManagerStaticAttribute.orderDataPath, o));
		
		//buyer
		ArrayList<Order> order_list = b.getOrder();
		if(order_list==null)
			order_list = new ArrayList<Order>();
		order_list.add(o);
		b.setOrder(order_list);
		abm.fixBuyer(ManagerStaticAttribute.buyerDataPath, b);
		
		//seller
		order_list = null;
		order_list = s.getOrder();
		if(order_list==null)
			order_list = new  ArrayList<Order>();
		order_list.add(o);
		s.setOrder(order_list);
		asm.fixSeller(ManagerStaticAttribute.sellerDataPath, s);
		
		
		return true;
	}
}
