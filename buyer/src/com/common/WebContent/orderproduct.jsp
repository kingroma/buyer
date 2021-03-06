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
							<input type="text" style="width:200px;">
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
									<table>
										<tr>
											<td>
												<a href="#">1</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href="#">2</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href="#">3</a>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</td>
						<td id="main_table_right" >
							<div id="body_right_div" style="background-color:white;">
								<div style="border:2px solid #abcdef;float:left;width:700px;background-color:white;font-size:9pt;">
									<%
										Product p = (Product)request.getAttribute("order_product");
									%>	
									<table style="margin:10px;background-color:white">
										<tr>
											<td style="padding-left:5px;width:70px;text-align:right;">제목 : 
											</td>
											<td style="padding-left:20px;"><%=p.getTitle() %>
											</td>
										</tr>
										<tr>
											<td style="padding-left:5px;width:70px;text-align:right;">
												상품번호 : 
											</td>
											<td style="padding-left:20px;">
												<%=p.getProduct_num() %> 
											</td>
										</tr>
										<tr>
											<td style="padding-left:5px;width:70px;text-align:right;">
												가격 : 
											</td>
											<td style="padding-left:20px;">
												<%=p.getPrice() %> 원
											</td>
										</tr>
										
									</table>
									<div>
										<img style="border:2px solid #abcdef;margin-left:30px;width:200px;height:120px;"src="<%="/data/data/product"+"/"+p.getProduct_num()+"/"+p.getFile_name() %>">
									</div>
									<div style="margin-left:40px;margin-top:20px;margin-bottom:30px;">
										<%=p.getTextarea() %>
									</div>
									<form action="/buyer/order" method="post" onsubmit="return checkForm();">
										<input style="display:none;" name="product_num" value="<%=p.getProduct_num()%>">
										<div style="margin-left:20px;margin-top:10px;">
											<table>
												<tr>
													<td style="width:70px">
														구매 가격 :
													</td>
													<td>
														<input id="order_price"style="width:200px;"type="text" name="price">
													</td>
												</tr>
												<tr>
													<td style="width:70px">
														핸드폰번호
													</td>
													<td>
														<input id="order_phone"style="width:200px;"type="text" name="phone">
													</td>
												</tr>
												<tr>
													<td style="width:70px">
														전달 내용 :
													</td>
													<td>
														<input id="order_comment"style="width:300px;"type="text" name="order_comment">
													</td>
												</tr>
											</table>
										</div>
										<div style="margin-top:10px;margin-bottom:10px;">
											<input type="submit" value="주문넣기"style="margin-left:300px;">
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