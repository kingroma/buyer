package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.SearchProduct;
import com.common.SortArrayList;
import com.product.*;
import java.util.*;
/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//String order_num = request.getParameter("order_num");
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		//String seller_id = (String)request.getParameter("seller_id");
		String keyword = (String)request.getParameter("keyword");
		
				
		
		if(keyword==null){
		PrintWriter out = response.getWriter();
		out.print("<html><head>"
			+ "<script>"
			+ "alert('something wrong');location.replace('myinfo');"
			+ "</script>"
			+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
			+ "</head><body>");
			out.print("</body></html>");
		}else{
			ArrayList<Product> search_product_list = search(keyword);
			SortArrayList sal = new SortArrayList();
			search_product_list = sal.SortProduct(search_product_list);
			
			
			System.out.println("size : "+search_product_list.size());
			RequestDispatcher rd = request.getRequestDispatcher("/search.jsp?"+"keyword="+keyword+"");
			
			request.setAttribute("search_product_list", search_product_list);
			
			rd.forward(request,response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	public ArrayList<Product> search(String keyword){
		String[] list = keyword.split(" ");
		SearchProduct sp = new SearchProduct();
		
		ArrayList<Product> product_list = new ArrayList<Product>();
		
		for(int i = 0 ; i < list.length ; i ++){
			product_list = sp.SearchProductKeyword(list[i],product_list);
			
		}
		return product_list;
	}
	
	public void checkSameProductList(ArrayList<Product> product_list , ArrayList<Product> temp_list){
		for(int i = 0 ; i < product_list.size() ; i ++){
			
		}
	}
	
}
