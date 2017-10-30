package com.servlet;

import java.io.IOException;

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
 * Servlet implementation class orderproduct
 */
@WebServlet("/orderproduct")
public class orderproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderproduct() {
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
		//System.out.println("show product java");
		String product_num = request.getParameter("product_num");
		
		Admin_ProductManager apm = new Admin_ProductManager();
		Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, product_num);
		
		System.out.println(p.getTitle());
		
		if(p!=null){
			RequestDispatcher rd = request.getRequestDispatcher("/orderproduct.jsp?product_num="+product_num);
			
			request.setAttribute("order_product", p);
			
			rd.forward(request,response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
