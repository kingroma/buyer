package com.test.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.GetProductList;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_ProductManager;
import com.product.Product;

/**
 * Servlet implementation class test_showproduct
 */
@WebServlet("/test_showproduct")
public class test_showproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showproduct() {
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
		
		
		
		Admin_ProductManager apm = new Admin_ProductManager();
		ArrayList<Product> random_product_list = apm.getRandomProductList();
		
		
		GetProductList gnp = new GetProductList();
		ArrayList<Product> new_product = gnp.getNewProductList();
		ArrayList<Product> best_recommend_product = apm.getBestProduct();
		ArrayList<Product> best_reply_product = apm.getBestReplyProduct();
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/test/test_showproduct.jsp");
		if(request.getParameter("focus")!=null){
			request.setAttribute("focus", request.getParameter("focus"));
		}
		//request.setAttribute("focus", "A0");
		
		request.setAttribute("random_product_list", random_product_list);
		request.setAttribute("new_product", new_product);
		request.setAttribute("best_recommend_product", best_recommend_product);
		request.setAttribute("best_reply_product", best_reply_product);
		
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
