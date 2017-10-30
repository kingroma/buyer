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

import com.board.Board;
import com.common.GetProductList;
import com.common.SearchProduct;
import com.common.SortArrayList;
import com.manager.Admin_BoardManager;
import com.manager.Admin_ProductManager;
import com.product.Product;

/**
 * Servlet implementation class test_search
 */
@WebServlet("/test_search")
public class test_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_search() {
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
		
		//String order_num = request.getParameter("order_num");
		String buyer_id = (String)request.getSession().getAttribute("buyer_id");
		//String seller_id = (String)request.getParameter("seller_id");
		String keyword = (String)request.getParameter("keyword");
		String categori = (String)request.getParameter("categori");
				
		
		if(keyword==null|categori==null){
		PrintWriter out = response.getWriter();
		out.print("<html><head>"
			+ "<script>"
			+ "alert('something wrong');location.replace('/buyer/test_main');"
			+ "</script>"
			+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
			+ "</head><body>");
			out.print("</body></html>");
		}else{
			if(categori.equals("product")){
				ArrayList<Product> search_product_list = search(keyword);
				
				SortArrayList sal = new SortArrayList();
				search_product_list = sal.SortProduct(search_product_list);
				
				Admin_ProductManager apm = new Admin_ProductManager();
				GetProductList gnp = new GetProductList();
				//ArrayList<Product> new_product = gnp.getNewProductList();
				ArrayList<Product> best_recommend_product = apm.getBestProduct();
				ArrayList<Product> best_reply_product = apm.getBestReplyProduct();
				
				System.out.println(keyword);
				
				
				RequestDispatcher rd = request.getRequestDispatcher("/test/test_search_product.jsp?"+"keyword="+keyword+"");
				if(request.getParameter("focus")!=null){
					request.setAttribute("focus", request.getParameter("focus"));
				}
				//request.setAttribute("focus", "A0");	
				
				System.out.println(search_product_list.size());
				request.setAttribute("new_product", search_product_list);
				request.setAttribute("best_recommend_product", best_recommend_product);
				request.setAttribute("best_reply_product", best_reply_product);
				
				
				System.out.println("size : "+search_product_list.size());
				
				
				//request.setAttribute("random_product_list", search_product_list);
				
				rd.forward(request,response);
			}else if(categori.equals("board")){
				
				Admin_BoardManager abm = new Admin_BoardManager(null);
				String[] temp = abm.getKeywordBoard(keyword);
				SortArrayList sal = new SortArrayList();
				temp = sal.SortStringArray(temp);
				ArrayList<Board> board_list = new ArrayList<Board>();
				if(request.getParameter("focus")!=null){
					request.setAttribute("focus", request.getParameter("focus"));
				}
				for(int i = 0 ; i < temp.length ; i ++){
					board_list.add(abm.getBoard(temp[i]));
				}
				
				ArrayList<Board> best_recommend_board = abm.getBestRecommendBoardList();//추천
				ArrayList<Board> best_reply_board = abm.getBestReplyBoardList();//댓글
				ArrayList<Board> best_count_board = abm.getBestCountBoardList();//조회수
				
				best_recommend_board.remove(best_recommend_board.size()-1);
				best_recommend_board.remove(best_recommend_board.size()-1);
				best_reply_board.remove(best_reply_board.size()-1);
				best_reply_board.remove(best_reply_board.size()-1);
				best_count_board.remove(best_count_board.size()-1);
				best_count_board.remove(best_count_board.size()-1);
				
				RequestDispatcher rd = request.getRequestDispatcher("/test/test_search_board.jsp?"+"keyword="+keyword+"");
				request.setAttribute("board_list",  board_list);
				request.setAttribute("best_recommend_board", best_recommend_board);
				request.setAttribute("best_reply_board",best_reply_board);
				request.setAttribute("best_count_board", best_count_board);
			
				rd.forward(request,response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
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
