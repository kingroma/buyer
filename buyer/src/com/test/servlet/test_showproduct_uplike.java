package com.test.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.ManagerStaticAttribute;
import com.manager.Admin_ProductManager;
import com.product.Product;

/**
 * Servlet implementation class test_showproduct_uplike
 */
@WebServlet("/test_showproduct_uplike")
public class test_showproduct_uplike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showproduct_uplike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("get hello");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		
		String buyer_id=request.getParameter("buyer_id");
		String product_num =request.getParameter("product_num"); 
		
		Admin_ProductManager apm = new Admin_ProductManager();
		Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, product_num);
		
		boolean check = true;
		if(p.getRecommend_ip()==null){
			p.setRecommend_ip(new ArrayList<String>());
		}
		for(int i = 0 ; i < p.getRecommend_ip().size() ; i ++){
			if(p.getRecommend_ip().get(i).equals(buyer_id)){
				check = false;
				break;
			}
		}
		if(check){
			p.getRecommend_ip().add(buyer_id);
			p.setRecommend(p.getRecommend()+1);
			apm.fixProduct(ManagerStaticAttribute.productDataPath,p);
			
		}
		
	}

}
