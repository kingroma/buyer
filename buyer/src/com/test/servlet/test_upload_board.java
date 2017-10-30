package com.test.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.Board;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BoardManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class test_upoad_board
 */
@WebServlet("/test_upload_board")
public class test_upload_board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test_upload_board() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    String buyer_id = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("get : test_upoad_board");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		buyer_id = (String)request.getSession().getAttribute("buyer_id");
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/test/test_upload_board.jsp");
		
		
		
		rd.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//System.out.println("post : test_upoad_board");

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		buyer_id = (String)request.getSession().getAttribute("buyer_id");
		
		if(buyer_id==null){
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('please login');parent.location.replace('test_main');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
		}
		//Board b = new Board();
		create(request,response);
	}
	public void create(HttpServletRequest request, HttpServletResponse response){
		Admin_BoardManager abm = new Admin_BoardManager(null);
		String empty_num = abm.nextEmptyBoardFolder();
		File empty_file_folder = new File(ManagerStaticAttribute.boardDataPath+"/"+empty_num);
		if(!empty_file_folder.exists())empty_file_folder.mkdirs();
		String path = empty_file_folder.getPath();
		int sizeLimit = 1024*1024;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
			Board b = new Board();
			
			//이제 buyer ID 올려야함 .
			
			String textarea = multi.getParameter("textarea");
			String title = multi.getParameter("title");
			String categori = multi.getParameter("radio");
			File file = multi.getFile("file");
			if(textarea!=null)
				b.setTextarea(textarea);
			if(title!=null)
				b.setTitle(title);
			if(categori!=null)
				b.setCategori(categori);
			if(file!=null){
				System.out.println(file.getName());
				b.setFile_name(file.getName());
				b.setFile_path(file.getPath());
			}
			if(buyer_id!=null){
				b.setBuyer(buyer_id);
			}
			
			b.setBoard_num(empty_num);
			
			abm.setB(b);
			abm.createBoard();
			
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<script>"
					+ "alert('complete');parent.location.replace('test_showboard');"
					+ "</script>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>"
					+ "</head><body>");
			out.print("</body></html>");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
