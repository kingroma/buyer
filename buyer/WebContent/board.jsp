<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.manager.Admin_ProductManager" %>
<%@ page import="com.manager.Admin_SellerManager" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.seller.Seller" %>
<%@ page import="com.common.ManagerStaticAttribute" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.GetProductList" %>
<%@ page import="javax.swing.ImageIcon" %>
<%@ page import="com.common.Categori" %>
<%@ page import="com.manager.Admin_BoardManager" %>
<%@ page import="com.board.Board" %>

<%@ page import="java.net.InetAddress"%>
<%@ page import="java.net.UnknownHostException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" href="jquery-welslider-master/css/welslider.css" type="text/css" media="screen" charset="utf-8" />
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.ui.core.js"></script>
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.ui.widget.js"></script>
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.welslider.js"></script>

<style>
.board_table a:hover{
text-decoration:underline;
color:green;
}
.board_top_td{
	margin-left:20px;
	width:70px;height:30px;
	text-align:center;
	border:1px solid #abcdef;
	color:black;
}
.board_top_td:hover{
	background-color:#abcdef;
	color:white;
}
.board_detail{
}
</style>
<%
	String buyer_id = null;
	if(request.getSession().getAttribute("buyer_id")!=null){
		buyer_id = (String)request.getSession().getAttribute("buyer_id");
	}
	Categori categori_list = new Categori();
	
	String[] board_list = (String[])request.getAttribute("board_list");
	String currentPage = request.getParameter("currentPage");
	if(currentPage == null)
		currentPage = "1";
	int howmany = 15;
	int maxPage = (int)(board_list.length/15);
	if((board_list.length%15)>0)
		maxPage+=1;
	
	Admin_BoardManager admin_board = new Admin_BoardManager(null);
	
	InetAddress local;
	String ip = "";
	try {
		local = InetAddress.getLocalHost();
		ip = local.getHostAddress();
		//System.out.println(ip);
	} catch (UnknownHostException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String keyword = request.getParameter("keyword");
	
	if(keyword==null)
		keyword="";
	
	String board_num_focus = request.getParameter("board_num_focus");
	
	if(board_num_focus==null)
		board_num_focus="";
%>
<script>


function checkSearchSubmit(){
	var value = $('#search_text').val();
	if(value==''){
		alert("2글자 이상 가능합니다.");
		return false;
	}
	else if(value.length<2){
		alert("2글자 이상 가능합니다.");
		return false;
	}
	else if(value=='  '){
		alert("글자를 입력해주세요");
		return false;
	}
	else if(value=='   '){
		alert("글자를 입력해주세요");
		return false;
	}
	else if(value=='    '){
		alert("글자를 입력해주세요");
		return false;
	}
	else if(value=='     '){
		alert("글자를 입력해주세요");
		return false;
	}
	else if(value=='      '){
		alert("글자를 입력해주세요");
		return false;
	}
	else if(value.length>10){
		alert("10글자 이하 가능합니다.");
		return false;
	}
	return true;
	
}

function board_detail_show(board_num){
	if(board_num=='x'){
		$('.board_detail').css("display","none");
	}
	if($('#board_detail_'+board_num).css("display")=="block"){
		$('.board_detail').css("display","none");
	}
	else{
		$('.board_detail').css("display","none");
		if(board_num!='x'){
			$('#board_detail_'+board_num).css("display","block");
			
			$('#frm_upSeeCount_'+board_num).target = "ifrm_upSeeCount_"+board_num;
			//document.frm_upSeeCount_+board_num.target = "ifrm_upSeeCount_"+board_num;
			$('#frm_upSeeCount_'+board_num).action = "/buyer/board_upboardseecount";
			//document.frm_upSeeCount.action = "/buyer/board_upboardseecount";
			$('#hiddenSeeCountForm_'+board_num).submit();
			//alert("done");
			//document.frm_upSeeCount.submit();
		}
	}
	
	
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="ibody" >
		<!-- header -->
		<div id="myheader">
			<div id="header_top_div">
				<div style="height:20px;text-align:right;padding:2px;">
					<span class="header_top_span" >
					<%
						if(buyer_id!=null){
							%><%=buyer_id%> &nbsp <a href="/buyer/logout" style="text-decoration:underline">로그아웃</a> <%
						}else{
							%><a href="/buyer/login">로그인</a>
						<%
						}
					%>
					</span>
					<%if(buyer_id==null) {%>
					<a href="/buyer/join"><span class="header_top_span" >회원가입</span></a>
					<%} %>
					<a href="/buyer/myinfo"><span class="header_top_span" >내정보</span></a>
					<a href="/buyer/customercenter"><span class="header_top_span" >고객센터문의</span></a>
				</div>
			</div>
			<div id="header_center_div"  style="background-image:url('img/main_image_main.png')">
				<table id="header_center_table">
					<tr>
						<td style="width:100px;height:30px;border:1px red solid;">
							<a href="/buyer/main">logo</a>
						</td>
						<td style="margin-left:30px;">
							<form action="/buyer/search" method="get" onsubmit="return checkSearchSubmit();">
								<div style="border:1px dotted #abcdef;padding:2px;">
								
								<input id="search_text" type="text" style="margin-top:0px;width:200px;height:20px;margin-top:0px;" name="keyword" >
								<input style="vertical-align:top;margin-top:0px;background:url(<%=ManagerStaticAttribute.imgUrl %>/search_btn.png) no-repeat;
									background-size:cover;width:50px;height:27px;border:1px solid black;"
									type="submit" value="">
								</div>
							</form>
						</td>
						<td>
								<div id="see_product_hidden"">
								<script>
									$( "#see_product_hidden" ).hover(function() {
									  
										$( "#see_product_hidden_detail" ).fadeIn( 200 );
									},function(){
										$( "#see_product_hidden_detail" ).fadeOut( 50 );
									});
								</script>
									<div style="margin-left:30px;">
										<button style="font-size:9pt">최근본상품</button>
										<!-- <span style="font-size:9pt;">최근본상품</span> -->
									</div>
									<div id="see_product_hidden_detail"style="padding:5px;background-color:white;padding-top:10px;display:none;position:absolute;border:1px solid #abcdef;">
										
										<%
										
										ArrayList<Product> see_product = null;
										//request.getSession().setAttribute("see_product", see_product);
										see_product = (ArrayList<Product>)request.getSession().getAttribute("see_product");
										
										%>
										<div style="width:450px;">
										<%
										if(see_product!=null){
											
											for(int i = 0 ; i < see_product.size() ; i ++){
												%>
												<a href="<%=ManagerStaticAttribute.buyerUrl%>/showproduct?product_num=<%=see_product.get(i).getProduct_num()%>">
													<img style="width:80px;height:80px;border:1px solid black" 
													title="[[<%=see_product.get(i).getProduct_num() %>]]<%=see_product.get(i).getTitle() %>"
													src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=see_product.get(i).getProduct_num() %>/<%=see_product.get(i).getFile_name()%>">
													
												</a>	
													
											<%}
											
										}
										%>
										</div>
									</div>
								</div>
							</td>	
					</tr>
				</table>
			</div>
		</div>
		<!-- header -->
		
		<!-- body -->
		<div id="mybody">
			<div id="body_table_div">
				<table style="vertical-align:text-top;">
					<tr>
						<td id="main_table_left" style="background-color:white;">
							<div id="body_left_div" style="background-color:white;">
								<div id="categori_title" style="border-bottom:3px solid #abcdef;">
									판매 카테고리
								</div>
								<div id="categori_show" style="background-color:white;">
									<table>
										<%for(int i = 0 ; i < categori_list.getList().size() ; i ++){
											%>
											<tr>
												<td>
													<a href="/buyer/search?keyword=<%=categori_list.getList().get(i)%>"><%=categori_list.getList().get(i)%></a>
												</td>
											</tr>
											<%
										} %>
									</table>
								</div>
								<div id="categori_title" style="border-bottom:3px solid #abcdef;">
									메뉴
								</div>
								<div id="categori_show" style="background-color:white;">
									<div>
										<a href="/buyer/board"> 게시판 </a> 
									</div>
									<table style="margin-left:10px;">
										<%for(int i = 1 ; i < categori_list.getBoardList().size() ; i ++){
											%>
											<tr>
												<td>
													<a href="/buyer/board?keyword=<%=categori_list.getBoardList().get(i) %>"><%=categori_list.getBoardList().get(i) %></a>
												</td>
											</tr>
											<%
										} %>
									</table>
								</div>
								
								
								
							</div>
						</td>
						<td id="main_table_right" >
							<div id="body_right_div" style="background-color:white;">
								<div style="float:left;text-align:center">
									<div style="text-align:left;font-size:9pt;margin-bottom:20px;">
										<table style="margin-left:10px;">
											<tr>
												<td class="board_top_td">
													<a class="" href="/buyer/createboard" style="">글 올리기</a>
												</td>
											</tr>
										</table>
										<table style="margin-top:10px;">
											<tr>
												<td style="width:300px;">
													<form action="/buyer/board" method="get">
														<input name="keyword" type="text" style="width:200px;margin-left:10px;">
														<input type="submit" value="검색" style="margin-right:30px;">
													</form>
												</td>
											</tr>
										</table>
									</div>
									<table style="font-size:10pt;" >
										<tr>
											<td style="height:20px;border-top:1px solid #e2e2e2;border-bottom:1px solid #e2e2e2;width:80px;background-color:#e2e2e2;">
												번호
											</td>
											<td style="height:20px;border-top:1px solid #e2e2e2;border-bottom:1px solid #e2e2e2;width:80px;background-color:#e2e2e2;">
												카테고리
											</td>
											<td style="height:20px;border-top:1px solid #e2e2e2;border-bottom:1px solid #e2e2e2;width:400px;background-color:#e2e2e2;">
												제목
											</td>
											<td style="height:20px;border-top:1px solid #e2e2e2;border-bottom:1px solid #e2e2e2;width:100px;background-color:#e2e2e2;">
												글쓴이
											</td>
											<td style="height:20px;border-top:1px solid #e2e2e2;border-bottom:1px solid #e2e2e2;width:100px;background-color:#e2e2e2;">
												날짜
											</td>
											<td style="height:20px;border-top:1px solid #e2e2e2;border-bottom:1px solid #e2e2e2;width:30px;background-color:#e2e2e2;">
												조회
											</td>
											<td style="height:20px;border-top:1px solid #e2e2e2;border-bottom:1px solid #e2e2e2;width:30px;background-color:#e2e2e2;">
												추천
											</td>
										</tr>
									</table>
									<%for(int i = (Integer.parseInt(currentPage)-1)*howmany ; i < (Integer.parseInt(currentPage))*howmany ; i ++){
										if(i<=board_list.length-1){
											//Board temp_board = admin_board.getBoard("b"+""+(board_list.length-i-1));
											
											System.out.println("i : "+i+"//"+(board_list[i]));
											//Board temp_board = admin_board.getBoard(""+""+(board_list[board_list.length-i-1]));
											Board temp_board = admin_board.getBoard(""+""+(board_list[i]));
									%>
									<div>
										<%if(temp_board!=null){ %>
										<table style="font-size:9pt;" class="board_table">
											<tr>
												<td style="padding-bottom:5px;width:80px;border-bottom:1px solid #e2e2e2;">
													<%if(temp_board.getBoard_num()!=null){ %>
														<%=temp_board.getBoard_num()%>
														<%} %>
												</td>
												<td style="padding-bottom:5px;width:80px;border-bottom:1px solid #e2e2e2;">
													<%if(temp_board.getCategori()!=null){ %>
														<%=temp_board.getCategori() %>
														<%}else{
														%>없음<%	
														}%>
												</td>
												<td style="text-align:left;padding-bottom:5px;width:400px;border-bottom:1px solid #e2e2e2;">
													
													<div style="overflow:hidden;width:400px;">
														<span style="cursor:pointer"onclick="board_detail_show('<%=temp_board.getBoard_num() %>')" >
															<%if(temp_board.getTitle()!=null){ %>
																<%=temp_board.getTitle()%>
																<%} %>
															[<%=temp_board.getReply().size() %>]
														</span>
														<iframe name='ifrm_upSeeCount_<%=temp_board.getBoard_num() %>' width='0px' height='0px' frameborder='0'></iframe>
														<form id="hiddenSeeCountForm_<%=temp_board.getBoard_num() %>"action ="/buyer/board_upboardseecount" method="post" name="frm_upSeeCount_<%=temp_board.getBoard_num() %>" target="ifrm_upSeeCount_<%=temp_board.getBoard_num() %>">
															<input type="submit" style="display:none;">
															<input type="text" name="board_num" value="<%=temp_board.getBoard_num() %>" style="display:none">
															<input type="hidden" name="ip" value="<%=ip %>" style="display:none;">
														</form>
															
													</div>
												</td>
												<td style="padding-bottom:5px;width:100px;border-bottom:1px solid #e2e2e2;">
													<%if(temp_board.getBuyer()!=null){ %>
														<%=temp_board.getBuyer()%>
														<%} %>
												</td>
												
												<td style="padding-bottom:5px;width:100px;border-bottom:1px solid #e2e2e2;">
													<%if(temp_board.getTime()!=null){ %>
														<%=temp_board.getTime()%>
														<%} %>
												</td>
												<td style="padding-bottom:5px;width:30px;border-bottom:1px solid #e2e2e2;">
													
													<%=temp_board.getSeecount()%>
													
												</td>
												<td style="padding-bottom:5px;width:30px;border-bottom:1px solid #e2e2e2;">
													
													<%=temp_board.getRecommend()%>
													
												</td>
											</tr>
										</table>
										<%
											String board_detail_display = "none";
											if(board_num_focus!=null|board_num_focus.equals("")){
												if(temp_board.getBoard_num().equals(board_num_focus)){
													board_detail_display = "block";
												}
											}
										%>
										<div id="board_detail_<%=temp_board.getBoard_num() %>" class="board_detail" style="display:<%=board_detail_display %>;border:1px solid #e2e2e2;">
											<div>
												<div style="width:800px;padding-top:10px;position:absolute;text-align:right;">
													<button onclick="board_detail_show('x')">X</button>
												</div>
												<table style="font-size:9pt;">
													<tr>
														<td style="width:60px;text-align:left;padding-left:10px;">
															제목
														</td>
														<td style="font-weight:bold;">
															<%=temp_board.getTitle()%>
														</td>
													</tr>
												</table>
												<table style="font-size:9pt;">
													<tr>
														<td style="width:60px;text-align:left;padding-left:10px;">
															글쓴이
														</td>
														<td style="">
															<%=temp_board.getBuyer()%>
														</td>
														<td style="width:60px;">
															조회   
														</td>
														<td>
															<%=temp_board.getSeecount() %>
														</td>
														<td style="width:60px;">
															댓글 
														</td>
														<td>
															 <%=temp_board.getReply().size() %>
														</td>
													</tr>
												</table>
											</div>
											<div style="padding:10px;text-align;">
												<%if(!temp_board.getFile_name().equals("")|!temp_board.getFile_path().equals("")){
													//ManagerStaticAttribute.dataUrl;
													%>
														<img style="overflow:hidden" src="<%=ManagerStaticAttribute.dataUrl+"/board/"+temp_board.getBoard_num()+"/"+temp_board.getFile_name()%>">
													<%
												} %>
												<div style="font-size:9pt;text-align:left;padding:10px;">
													<%=temp_board.getTextarea() %>
												</div>
											</div>
											<div style="">
												<form action="/buyer/board_upboardrecommend" method="post">
													<input style="display:none;" name="board_num" type="text" value="<%=temp_board.getBoard_num()%>">
													<input style="display:none;" name="currentPage" type="text" value="<%=currentPage%>">
													<input style="font-size:9pt;" value="추천하기" type="submit">
												</form>
											</div>
											<div style="">
												<div>
													<div style="text-align:left;padding:10px;font-size:9pt;">
														전체 댓글 수 <%=temp_board.getReply().size() %>
													</div>
													<div style="background-color:#e2e2e2;margin:10px;">
														<%for(int j = 0 ; j < temp_board.getReply().size() ; j++){
															%>
															<div style="background-color:#e2e2e2;padding:10px;">
																<table style="font-size:9pt;">
																	<tr>
																		<td style="width:100px;">
																			<%=temp_board.getReply().get(j).getBuyer() %>
																		</td>
																		<td>
																			<%=temp_board.getReply().get(j).getTextarea() %>
																		</td>
																	</tr>
																</table>
															</div>
															<%
														} %>
														<div><!-- 댓글달기 -->
															<div style="margin-top:20px;padding-top:10px;padding-bottom:10px;">
																<form method="post" action="board_createreply">
																	<input name="board_num" type="text" style="display:none;" value="<%=temp_board.getBoard_num()%>">
																	<input name="currentPage" type="text" style="display:none;" value="<%=currentPage%>">
																	<table>
																		<tr>
																			<td style="width:50px;">
																				
																			</td>
																			<td style="width:600px;">
																				<textarea name="textarea" style="resize:none;width:600px;height:50px;"></textarea>
																			</td>
																			<td style="padding:10px;">
																				<input style="width:100px;height:40px;"type="submit" value="댓글 달기">
																			</td>
																		</tr>
																	</table>
																</form>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div style="margin-bottom:10px;">
												
											</div>
										</div>
										
										<%} %>
										
										
										</div>
										
										
										<%}
									} %>
									<div>
										<%
											int bottom_current_page = Integer.parseInt(currentPage);
											int bottom_min = bottom_current_page-5;
											if(bottom_min<1)
												bottom_min=1;
											int bottom_max = bottom_current_page+5;
											if(bottom_max>maxPage)
												bottom_max = maxPage;
										%>
										<%for(int i = bottom_min ; i <= bottom_max ; i ++) {
											%> <a style="color:green;" href="/buyer/board?currentPage=<%=i %>&keyword=<%if(keyword!=null|!keyword.equals("")) {%><%=keyword %><%}%>"><%=i %></a>&nbsp&nbsp
											<%}%>
										<!-- 1,2,3,4,5,6 -->
									</div>
									
									<div style="height:50px;">
									
									</div>
								</div>
								<div style="float:left;text-align:center;">
									
								</div>
								<div style="float:left;text-align:center;">
									
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- body -->
	</div>
</body>
</html>