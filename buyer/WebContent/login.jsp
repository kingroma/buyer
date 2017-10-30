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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>

<link rel="stylesheet" href="jquery-welslider-master/css/welslider.css" type="text/css" media="screen" charset="utf-8" />
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.ui.core.js"></script>
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.ui.widget.js"></script>
<script type="text/javascript" charset="utf-8" src="jquery-welslider-master/js/jquery.welslider.js"></script>
<script>
function checkForm(){
	if($('#id').val()==''){
		alert("아이디를 입력해주세요.");
	return false;
	}
	else if($('#pw').val()==''){
		alert("비밀번호를 입력해주세요.");
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
<link rel="stylesheet" type="text/css" href="css/basic.css">
<style>

</style>
<%
	String buyer_id = null;
	if(request.getSession().getAttribute("buyer_id")!=null){
		buyer_id = (String)request.getSession().getAttribute("buyer_id");
		response.sendRedirect("/buyer/main");
	}
	Categori categori_list = new Categori();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="ibody" >
		<!-- header -->
		<div id="myheader">
			<div id="header_top_div">
				<div style="height:20px;text-align:right;padding:2px;">
					<a href="/buyer/login"><span class="header_top_span" >로그인</span></a>
					<a href="/buyer/join"><span class="header_top_span" >회원가입</span></a>
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
								<div id="categori_show"style="background-color:white;">
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
								<div style="float:left;">
									<div style="border:2px solid #abcdef;padding:20px;margin-left:20px;">
										<div style="border-bottom:2px solid black;margin-top:10px;margin-bottom:20px;padding-bottom:10px;">
											로그인
										</div>
										<form method="post" action="/buyer/login" onsubmit="return checkForm();">
											<table>
												<tr>
													<td  style="width:100px;text-align:right;">
														아이디 : 
													</td>
													<td>
														<input id="id" style="width:200px;"type="text" name="id">
													</td>
												</tr>
												<tr>
													<td style="width:100px;text-align:right;">
														비밀번호 : 
													</td>
													<td>
														<input id="pw" style="width:200px;"type="password" name="pw">
													</td>
												</tr>
											</table>	
											<div style="margin-left:200px;margin-top:20px;">
												<input type="submit" style="width:100px;" value="로그인">
											</div>
											<div>
												<table style="margin-left:10px;font-size:9pt;">
													<tr>
														<td>
															<a style="color:#888888" href="#">아이디 찾기</a>
														</td>
													</tr>
													<tr>
														<td>
															<a style="color:#888888" href="#">비밀번호 찾기</a>
														</td>
													</tr>
													<tr>
														<td>
															<a style="color:#888888" href="#">회원가입하기</a>
														</td>
													</tr>
												</table>
											</div>
										</form>
									</div>
								</div>
								<div style="float:left;width:0px;text-align:center;">
									
								</div>
								<div style="float:left;width:0px;text-align:center;">
									
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