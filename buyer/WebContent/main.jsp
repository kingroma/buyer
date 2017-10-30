<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.manager.Admin_ProductManager" %>
<%@ page import="com.manager.Admin_SellerManager" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.seller.Seller" %>
<%@ page import="com.common.ManagerStaticAttribute" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.GetProductList" %>
<%@ page import="com.common.Categori" %>
<%@ page import="com.board.Board" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script type="text/javascript" src="jquery-1.7.1.min.js"></script> -->
<script type="text/javascript" src="jquery-welslider-master/js/jquery-1.4.2.js"></script>


<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" href="jquery-welslider-master/css/welslider.css" type="text/css" media="screen" charset="utf-8" />
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.ui.core.js"></script>
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.ui.widget.js"></script>
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.welslider.js"></script>


<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
body{
	font-family: 'sans-serif';
    
}
</style>
<%
	String buyer_id = null;
	if(request.getSession().getAttribute("buyer_id")!=null){
		buyer_id = (String)request.getSession().getAttribute("buyer_id");
	}
	Categori categori_list = new Categori();
	
	
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
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		
	</div>
	<div id="ibody" style="">
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
			<div id="header_center_div" style="background-image:url('img/main_image_main.png')">
				<div>
					<table id="header_center_table" >
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
		</div>
		<!-- header -->
		
		<!-- body -->
		<div id="mybody" style="">
			<div id="body_table_div">
				<table style="vertical-align:text-top;">
					<tr>
						<td id="main_table_left" style="background-color:white;border-right:1px solid #e2e2e2">
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
								<div>
									<div style="margin-bottom:30px;margin-top:10px;margin-left:20px;">
									<!-- 이미지 겔러리 -->
										
										<ul id="mygallery">
											<%
											if(request.getAttribute("new_product")!=null){
												ArrayList<Product> new_product = (ArrayList<Product>)request.getAttribute("new_product");
													
												for(int i = 0 ; i < new_product.size() ; i ++){
													%>
														<li>
															<a href="<%=ManagerStaticAttribute.buyerUrl%>/showproduct?product_num=<%=new_product.get(i).getProduct_num()%>">
																<img src="<%=ManagerStaticAttribute.dataUrl %>/product/<%=new_product.get(i).getProduct_num() %>/<%=new_product.get(i).getFile_name() %>" 
																	alt=""  
																	style="width:700px;height:300px;"/>
															</a>
														</li>
													<%
												}
											}%>
										</ul>
										<script>
										 $(function () {
										        $("#mygallery").welSlider({
										            autoSlide: 3000
										        });
										}); 
										</script>
									</div>
								</div>
								<div style="margin-bottom:30px;clear:both;border-top:1px solid #e2e2e2;">
								
								</div>
								<div style="float:left;width:300px;padding-right:20px;margin-left:30px;margin-bottom:10px;">
									
									<span style="font-size:10pt;color:green;font-weight:bold;">최신 상품</span>
									<table style="font-size:9pt;">
										<tr>
											<td style="height:20px;width:70px;text-align:center;color:white;background-color:#aaccef;">카테고리
											</td>
											<td style="height:20px;width:200px;overflow:hidden;text-align:center;color:white;background-color:#aaccef;"> 제목
											</td>
										</tr>
									<%
									if(request.getAttribute("new_product")==null){
										response.sendRedirect("/buyer/main");
									}
									else if(request.getAttribute("new_product")!=null){
										ArrayList<Product> new_product = (ArrayList<Product>)request.getAttribute("new_product");
											for(int i = 0 ; i < new_product.size() ; i ++){
												if(new_product.get(i)!=null){
													%>
													<tr>
														<td style="padding-top:3px;padding-bottom:3px;height:20px;width:70px;text-align:center;background-color:#eeeeff;">[[<%=new_product.get(i).getCategori() %>]]</td>
														<td style="padding-top:3px;padding-bottom:3px;height:20px;width:200px;overflow:hidden;background-color:#eeeeff;"><a href="/buyer/showproduct?product_num=<%=new_product.get(i).getProduct_num()%>"><%=new_product.get(i).getTitle()%></a></td>
													</tr><%	
												}
											}
									}
									%>	
									
									</table>
									
								</div>
								<div style="float:left;width:1px;height:330px;border-left:1px solid #e2e2e2;">
									
								</div>
								<div style="padding-left:40px;float:left;width:300px;text-align:left;">
									<span style="font-size:10pt;color:green;font-weight:bold;">최신 게시판</span>
									<table style="font-size:9pt;">
										<tr>
											<td style="height:20px;width:70px;text-align:center;color:white;background-color:#aaccff;">카테고리
											</td>
											<td style="height:20px;width:200px;overflow:hidden;text-align:center;color:white;background-color:#aaccff;"> 제목
											</td>
										</tr>
									<%
									if(request.getAttribute("new_board")==null){
										response.sendRedirect("/buyer/main");
									}
									else if(request.getAttribute("new_board")!=null){
										ArrayList<Board> new_board = (ArrayList<Board>)request.getAttribute("new_board");
											for(int i = 0 ; i < new_board.size() ; i ++){
												if(new_board.get(i)!=null){
													%>
													<tr>
														<td style="padding-top:3px;padding-bottom:3px;height:20px;width:70px;text-align:center;background-color:#eeeeff;"><%=new_board.get(i).getCategori() %></td>
														<td style="padding-top:3px;padding-bottom:3px;height:20px;width:200px;overflow:hidden;background-color:#eeeeff;"><a href="/buyer/board?board_num_focus=<%=new_board.get(i).getBoard_num()%>"><%=new_board.get(i).getTitle()%></a></td>
													</tr><%	
												}
											}
									}
									%>	
									
									</table>
								</div>
								
								
								<div style="padding-left:20px;clear:both;padding-top:10px;padding-bottom:10px;border-bottom:1px solid #e2e2e2;">
								
								</div>
								
								<div>
									<div style="float:left;width:200px;">
									a
									</div>
									<div style="float:left;">
									a
									</div>
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