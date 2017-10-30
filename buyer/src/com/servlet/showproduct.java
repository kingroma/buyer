package com.servlet;

import java.io.IOException;
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
 * Servlet implementation class showproduct
 */
@WebServlet("/showproduct")
public class showproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showproduct() {
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
		System.out.println("show product java");
		String product_num = request.getParameter("product_num");
		
		Admin_ProductManager apm = new Admin_ProductManager();
		
		Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, product_num);
		
		ArrayList<Product> see_product = (ArrayList<Product>)request.getSession().getAttribute("see_product");
		if(see_product==null){
			see_product= new ArrayList<Product>();
			see_product.add(p);
		}
		boolean check = true;
		for(int i = 0 ; i < see_product.size() ; i ++){
			if(see_product.get(i).getProduct_num().equals(p.getProduct_num())){
				check = false;
				break;
			}
		}
		
		if(check)see_product.add(p);
		
		if(see_product.size()>30){
			see_product.remove(0);
		}
		request.getSession().setAttribute("see_product", see_product);
		
		System.out.println(p.getTitle());
		if(p!=null){
			RequestDispatcher rd = request.getRequestDispatcher("/showproduct.jsp?product_num="+product_num);
			
			request.setAttribute("show_product", p);
			
			rd.forward(request,response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
