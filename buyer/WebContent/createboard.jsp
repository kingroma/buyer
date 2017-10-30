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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<style>

</style>
<%
	String buyer_id = null;
	if(request.getSession().getAttribute("buyer_id")!=null){
		buyer_id = (String)request.getSession().getAttribute("buyer_id");
	}
	Categori categori_list = new Categori();
%>
<script>

function checkForm(){
	//alert($('#upload_title').value);
	
	//var upload_textarea = $('#upload_textarea');
	
	if($('#order_price').val()==''){
		alert("가격을 입력해주세요.");
		return false;
	}
	if($('#order_phone').val()==''){
		alert("핸드폰번호를 입력해주세요.");
		return false;
	}
	if($('#order_comment').val()==''){
		alert("전달내용을 입력해주세요");
		return false;
	}
	
}
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
			<div id="header_center_div">
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
									<div>
										<!-- 보드 올리는것 / 보는것 / 수정하는것 -->
									</div> 
									<%
									
									/*
										private String categori = "";
										private String Buyer = "";
										private String board_num = "";
										private ArrayList<Board> reply = null;
										private String time = "";
										private int good = 0;
										private int bad = 0;
										private int seecount = 0 ;
										private String textarea;
										private String title;
										private String file_name = "";
										private String file_path = "";
									*/
									%>
									<form action="/buyer/createboard" enctype="multipart/form-data" method="post">
										<table style="font-size:9pt;">
											<tr>
												<td style="width:100px;text-align:center;">
													제목 : 
												</td>
												<td style="width:800px;">
													<div style="width:800px;text-align:left;margin-top:10px;">
														<input type="text" style="width:400px;" name="title">
													</div>
												</td>
											</tr>
											<tr>
												<td style="width:100px;text-align:center;margin-top:10px;">
													카테고리 : 
												</td>
												<td style="width:800px;">
													<div style="width:800px;text-align:left;margin-top:10px;">
														<%for(int i = 0 ; i < categori_list.getBoardList().size() ; i ++){%>
															<input type="radio" style="" value="<%=categori_list.getBoardList().get(i) %>" name="radio" 
															<%if(i==0){ %>checked<%} %>
															><%=categori_list.getBoardList().get(i) %>&nbsp&nbsp
														<%}%>
													</div>
												</td>
											</tr>
											<tr>
												<td style="width:100px;text-align:center;margin-top:10px;">
													파일 : 
												</td>
												<td style="width:800px;">
													<div style="width:800px;text-align:left;margin-top:10px;">
														<input type="file" style="width:200px;" name="file">
													</div>
												</td>
											</tr>
											<tr>
												<td style="width:100px;height:300px;text-align:center;margin-top:10px;">
													내용 : 
												</td>
												<td style="width:800px;">
													<div style="width:800px;text-align:left;margin-top:10px;">
														<textarea name="textarea" style="width:500px;height:300px;resize:none;"></textarea>
													</div>
												</td>
											</tr>
										</table>
										<div>
											<input type="submit" value="올리기">
										</div>
									</form>
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