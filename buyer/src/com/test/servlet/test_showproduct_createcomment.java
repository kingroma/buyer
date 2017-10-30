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
import com.product.Comment;
import com.product.Product;

/**
 * Servlet implementation class test_showproduct_createcomment
 */
@WebServlet("/test_showproduct_createcomment")
public class test_showproduct_createcomment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_showproduct_createcomment() {
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
		
		String buyer_id = request.getParameter("buyer_id");
		String product_num = request.getParameter("product_num");
		String textarea = request.getParameter("textarea");
		
		if(textarea==null)
			textarea="";
		
		
		Admin_ProductManager apm = new Admin_ProductManager();
		Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, product_num);
		
		boolean check = true;
		if(p.getComment()==null){
			p.setComment(new ArrayList<Comment>());
		}
		Comment c = new Comment();
		c.setBuyer(buyer_id);
		c.setProduct_num(product_num);
		c.setTextarea(textarea);
		//p.getComment().add(c);
		p.getComment().add(0, c);
		
		apm.fixProduct(ManagerStaticAttribute.productDataPath, p);
	}

}
