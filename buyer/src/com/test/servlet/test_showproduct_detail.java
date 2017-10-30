package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.ManagerStaticAttribute;
import com.manager.Admin_ProductManager;
import com.product.Product;

/**
 * Servlet implementation class test_showproduct_detail
 */
@WebServlet("/test_showproduct_detail")
public class test_showproduct_detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showproduct_detail() {
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
		response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
		String product_num = request.getParameter("product_num");
		
		Admin_ProductManager apm = new Admin_ProductManager();
		
		Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, product_num);
		
		//what_did_you_see
		
		saw_product(request,p);
		
		//what_did_you_see		
		
		RequestDispatcher rd = request.getRequestDispatcher("/test/test_showproduct_detail.jsp");
		
		request.setAttribute("product",p);
		
		rd.forward(request,response);
		
		
		//System.out.println("test"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}
	
	public void saw_product(HttpServletRequest request,Product p){
		ArrayList<Product> saw_product = (ArrayList<Product>)request.getSession().getAttribute("saw_product");
		if(saw_product==null)
			saw_product=new ArrayList<Product>();
		
		boolean check = true;
		for(int i = 0 ; i < saw_product.size() ; i++){
			if(saw_product.get(i).getProduct_num().equals(p.getProduct_num()))
				check=false;
		}
		if(check){
			saw_product.add(0,p);
		}
		if(saw_product.size()>8){
			saw_product.remove(7);
		}
		request.getSession().setAttribute("saw_product", saw_product);
	}
}
