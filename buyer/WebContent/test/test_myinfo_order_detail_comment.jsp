<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.Board" %>
<%@ page import="com.seller.Seller" %>
<%@ page import="com.common.ManagerStaticAttribute" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.order.Order" %>
<%@ page import="com.common.Categori" %>
<%@ page import="com.board.Board" %>
<%@ page import="com.product.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery-1.7.1.min.js"></script> 
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
body{
	font-family: 'Nanum Pen Script', serif;
	border:0px;padding:0px;
	word-break:break-all;
	width:350px;height:320px;
	background-color:white;
}
textarea,input,button{
	font-family: 'Nanum Pen Script', serif;
}
</style>
</head>
<%
Order o = (Order)request.getAttribute("order");
Product p = (Product)request.getAttribute("product");
%>
<body style="border:0px;padding:0px;">
	<div style="width:350px;height:320px;">
		<div>
			<form action="/buyer/test_myinfo_order_detail_comment" method="post">
				<input type="hidden" value="<%=o.getSeller() %>" name="seller_id">
				<input type="hidden" value="<%=o.getBuyer() %>" name="buyer_id">
				<input type="hidden" value="<%=o.getOrder_num() %>" name="order_num">
				
				<input type="hidden" value="<%=p.getProduct_num() %>" name="product_num"> 
				댓글 : 
				<input type="text"  name="textarea"
					style="outline:none;border:1px dotted #e2e2e2;width:250px;border-radius:5px;">
			</form>
		</div>
		<div style="margin-top:10px;"></div>
		<div style="width:320px;height:270px;overflow-y:auto;background-color:#e2e2e2;">
			<%
			if(o.getComment()!=null){
				for(int i = 0 ; i < o.getComment().size() ; i ++){
					%>
					<div style="margin:2px;">
						<%if(o.getComment().get(i).getBuyer()!=null&o.getComment().get(i).getTextarea()!=null){ %>
							<span style="color:green"><%=o.getComment().get(i).getBuyer() %></span>
							<span style="color:black"><%=o.getComment().get(i).getTextarea() %></span>
						<%} %>
						<%if(o.getComment().get(i).getReply()!=null){ 
							if(!o.getComment().get(i).getReply().equals("")){
						%>
							<div style="padding-left:5px;">
								└ <span style="color:blue"> 판매자 :</span> 
								<span style="color:black"><%=o.getComment().get(i).getReply() %></span>
							</div>
							<%} %>
						<%} %>
					</div>
					<%
				}
			}
			%>
		</div>
	</div>
	<% %>
</body>
</html>