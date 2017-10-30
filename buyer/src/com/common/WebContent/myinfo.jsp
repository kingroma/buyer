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
<%@ page import="com.order.Order" %>
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
%>
<% 
	ArrayList<Order> order_list = (ArrayList<Order>)request.getAttribute("order_list");
	ArrayList<Product> orderproduct_list = (ArrayList<Product>)request.getAttribute("orderproduct_list");
	
	Categori categori_list = new Categori();
	
%>
<script>

function checkForm(){
	//alert($('#upload_title').value);
	
	//var upload_textarea = $('#upload_textarea');

}
function hidden_info(input){
	//alert(input);
	$('.hidden_info_order').css("display","none");
	$('.hidden_info_order2').css("display","none");
	$('.hidden_cancel_order').css("display","none");
	$('.hidden_comment_order').css("display","none");
	if(input=='x'){
	
	}else{
		$('.hidden_info_order').css("display","none");
	
		$('#hidden_info_'+input+'').css("display","block");
	}
}

function hidden_info2(input){
	if(input=='x'){
		
	}else{
		$('.hidden_info_order2').css("display","none");
	
		$('#hidden_info2_'+input+'').css("display","block");
	}
}

function hidden_cancel(input){

	$('.hidden_info_order').css("display","none");
	$('.hidden_info_order2').css("display","none");
	$('.hidden_cancel_order').css("display","none");
	$('.hidden_comment_order').css("display","none");
	if(input=='x'){
		
	}else{
	
		$('#hidden_cancel_'+input+'').css("display","block");
	}
}
function hidden_comment(input){
	$('.hidden_info_order').css("display","none");
	$('.hidden_info_order2').css("display","none");
	$('.hidden_cancel_order').css("display","none");
	$('.hidden_comment_order').css("display","none");
	if(input=='x'){
		
	}else{
	
		$('#hidden_comment_'+input+'').css("display","block");
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
								<div id="categori_title" style="border-bottom:3px solid #abcdef">
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
								<div id="body_right_div" style="float:left;width:950px;height:100%;background-color:white;">
									<span>내가 주문요청한 상품</span> 
									<br>
									<table style="font-size:9pt;">
										<tr>
											<td style="background-color:#b2b2b2;width:135px;text-align:center;">
												주문일 
											</td>
											
											<td style="background-color:#b2b2b2;width:400px;text-align:center;">
												상세정보
											</td>
											<td style="background-color:#b2b2b2;width:100px;text-align:center;">
												판매자
											</td>
											<td style="background-color:#b2b2b2;width:100px;text-align:center;">
												상태
											</td>
										
										</tr>
									</table>
											<%
											for(int i = 0 ; i < order_list.size() ; i ++){
											%>
											<table style="font-size:9pt;">
												<tr>
													<td style="vertical-align: text-top;background-color:#fcfcfc;width:135px;text-align:center;text-align:center;"><!-- 주문일 -->
														<div style="margin-top:5px;"><%=order_list.get(i).getOrder_date() %></div>
													</td>
													
													<td style="background-color:#fcfcfc;width:400px;text-align:left;"><!-- 상세정보 -->
														<div style="width:380px;height:80px;padding:5px;">
														
															<table style="width:380px;height:80px;">
																<tr>
																	<td style="width:70px;height:70px;">
																		<img style="width:70px;height:70px;"src="<%=ManagerStaticAttribute.dataUrl+"/product"+"/"+orderproduct_list.get(i).getProduct_num()+"/"+orderproduct_list.get(i).getFile_name()%>">		
																	</td>
																	<td style="padding:5px;width:300px;height:60px;vertical-align:text-top;">
																		<div>
																			<%if(orderproduct_list.get(i)!=null) {%>
																				<%if(orderproduct_list.get(i).getTitle()!=null) %>
																					<%=orderproduct_list.get(i).getTitle()%>
																			<%} %>
																		</div>
																		<div style="font-size:7pt;margin-top:10px;">
																			주문번호 : <%=order_list.get(i).getOrder_num() %>
																		</div>
																	</td>
																</tr>
															</table>									
														</div>
																
														<div style="padding:5px;text-align:right;margin-right:10px;margin-bottom:5px;">
															<a><button onclick="hidden_info('<%=order_list.get(i).getOrder_num() %>')" style="margin-right:10px;font-size:8pt;">주문 정보 조회</button></a>
															<%if(order_list.get(i).getStatus().equals("ing")){ %>
															<a><button onclick="hidden_cancel('<%=order_list.get(i).getOrder_num() %>')" style="margin-right:10px;font-size:8pt;">취소</button></a>
															<%} %>
															<a><button onclick="hidden_comment('<%=order_list.get(i).getOrder_num() %>')" style="margin-right:10px;font-size:8pt;">판매자 문의</button></a>
															<!-- <a><button style="margin-right:10px;font-size:8pt;">구매 결정</button></a> -->
														</div>
														<!-- 주문정보 조회 / 취소 / 판매자 문의  -->
														<div class="hidden_comment_order" id="hidden_comment_<%=order_list.get(i).getOrder_num()%>" style="z-index:2;position:absolute;display:none;margin-left:250px;">
															<div style="width:400px;padding:10px;background-color:white;border:3px solid #abcdef;">
																<div style="">
																	<span style="">판매자 문의</span>
																	<button style="margin-left:300px;background-color:white;"onclick="hidden_comment('x')">X</button>
																</div>	
																<div>
																<%if(order_list.get(i).getComment()!=null){
																	System.out.println("리스트 개수 "+order_list.get(i).getComment().size());
																	for(int j = 0 ; j < order_list.get(i).getComment().size() ; j ++){
																		%>
																		<table style="border:1px solid black;margin-top:5px;margin-bottom:5px;">
																			<tr>
																				<td style="text-align:center;width:70px;">
																					문의 내용 :
																				</td>
																				<td style="width:300px;">
																					<%=order_list.get(i).getComment().get(j).getTextarea() %>
																				</td>
																			</tr>
																			<%if(order_list.get(i).getComment().get(j).getReply()!=null){%>
																			<tr>
																				<td style="text-align:center;width:70px;">
																					답변 :
																				</td>
																				<td style="width:300px;">
																					<%=order_list.get(i).getComment().get(j).getReply() %>
																				</td>
																			</tr>
																			<%} %>
																		</table>
																		
																	<%}
																}
																%>
																</div>
																<div>
																	<form method="post" action="/buyer/createordercomment">
																		
																		<input name="order_num" type="text" value="<%=order_list.get(i).getOrder_num()%>" style="display:none">
																		<input name="buyer_id" type="text" value="<%=order_list.get(i).getBuyer() %>" style="display:none">
																		<input name="seller_id" type="text" value="<%=order_list.get(i).getSeller() %>" style="display:none">
																		<input name="product_num" type="text" value="<%=order_list.get(i).getProduct_num() %>" style="display:none">
																		<table>
																			<tr>
																				<td>
																					<textarea name="textarea" style="resize:none;width:300px;height:50px;fon-size:9pt;"></textarea>
																				</td>
																				<td>
																					<input type="submit" value="문의" style="width:50px;height:50px;">
																				</td>
																			</tr>
																		</table>
																	</form>
																</div>
															</div>
														</div>
														<div class="hidden_cancel_order" id="hidden_cancel_<%=order_list.get(i).getOrder_num()%>"style="z-index:2;position:absolute;display:none;margin-left:200px;" >
															<div style="text-align:center;width:180px;hieght:50px;background-color:white;border:3px solid #abcdef;">
																취소하시겠습니까 ?<br>
																<form action="/buyer/cancelorder" method="post">
																	<input type="text" name="order_num" value="<%=order_list.get(i).getOrder_num()%>" style="display:none;">
																	<input type="text" name="seller_id" value="<%=order_list.get(i).getSeller()%>" style="display:none;">
																	
																	<input type="submit" value="취소하기"><input style="margin-left:10px;"type="button" value="아니요" onclick="hidden_cancel('x')">
																</form>
															</div>
														</div>
														
														<div class="hidden_info_order" id="hidden_info_<%=order_list.get(i).getOrder_num()%>" style="z-index:2;position:absolute;display:none;">
															<div style="background-color:white;width:300px;height:150px;border:3px solid #abcdef;">
																<div style="text-align:right">
																	<button style="background-color:white;"onclick="hidden_info('x')">X</button>
																</div>
																<div>
																	<table>
																		<tr>
																			<td>
																				주문 번호 :
																			</td>
																			<td>
																				<%=order_list.get(i).getOrder_num()%>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				올린 가격 : 
																			</td>
																			<td>
																				<%=order_list.get(i).getPrice() %>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				추가 내용 :
																			</td>
																			<td>
																				<%=order_list.get(i).getOrder_comment() %>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				구매자 번호 : 
																			</td>
																			<td>
																				<%=order_list.get(i).getBuyer_phone() %>
																			</td>
																		</tr>
																		
																	</table>
																	
																</div>		
																
																<div style="filter:alpha(opacity=0.5);border:0px solid white;text-align:right;margin-right:20px;">
																	<button onclick="hidden_info2('<%=order_list.get(i).getOrder_num() %>')">수정</button>
																</div>	
																<div class="hidden_info_order2" id="hidden_info2_<%=order_list.get(i).getOrder_num()%>"style="border:3px solid #abcdef; width:300px;height:200px;display:none;background-color:white;">
																	<form action="/buyer/myinfo_fixorder" method="post" >

																		<input type="text" name="order_num" value="<%=order_list.get(i).getOrder_num()%>" style="display:none;">
																		<input type="text" name="seller_id" value="<%=order_list.get(i).getSeller()%>" style="display:none;">
																		<table>
																			<tr>
																				<td>
																					올린 가격 : 
																				</td>
																				<td>
																					<input type="text" name="price" value="<%=order_list.get(i).getPrice() %>" > 
																				</td>
																			</tr>
																			<tr>
																				<td>
																					추가 내용 :
																				</td>
																				<td>
																					<input type="text" name="comment" value="<%=order_list.get(i).getOrder_comment() %>">
																				</td>
																			</tr>
																			<tr>
																				<td>
																					구매자 번호 : 
																				</td>
																				<td>
																					<input type="text" name="phone" value="<%=order_list.get(i).getBuyer_phone() %>">
																				</td>
																			</tr>
																		</table>
																		<div style="text-align:right;margin-right:20px;">
																			<input type="submit" value="수정완료">
																		</div>
																	</form>
																</div>													
															</div>
														</div>
													</td>
													<td style="vertical-align: text-top;background-color:#fcfcfc;width:100px;text-align:center;text-align:center;"><!-- 판매자 -->
														<div style="margin-top:5px;"><%=order_list.get(i).getSeller() %></div>
													</td>
													<td style="vertical-align: text-top;background-color:#fcfcfc;width:100px;text-align:center;text-align:center;"><!-- 상태 -->
														<%if(order_list.get(i).getStatus().equals("ing")){%>
															<div style="margin-top:5px;">주문 확인중</div>
														<%} %>
														<%if(order_list.get(i).getStatus().equals("cancel")){%>
															<div style="margin-top:5px;">취소됨</div>
														<%} %>
														<%if(order_list.get(i).getStatus().equals("done")){%>
															<div style="margin-top:5px;">구매 완료</div>
														<%} %>
													</td>
													
												<tr>
											</table>
											<%
											}
										%>
									
									
								</div>
								<div style="background-color:red;float:left;">
									
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