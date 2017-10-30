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
<script type="text/javascript" src="jquery-1.7.1.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
body{
	font-family: 'Nanum Pen Script', serif;
	border:0px;padding:0px;
	word-break:break-all;
}
</style>
</head>
<%
Order o = (Order)request.getAttribute("order");
Product p = (Product)request.getAttribute("product");
%>
<body style="border:0px;padding:0px;">
<table style="font-size:14pt;text-align:center;border:0px;padding:0px;height:60px;overflow:hidden;">
	<tr>
		<td style="font-size:10pt;vertical-align:top;padding-top:15px;width:90px;">
			<%=o.getOrder_date() %>
		</td>
		<td style="padding-top:2px;vertical-align:top;width:300px;">
			<table>
				<tr>
					<td style="padding:2px;vertical-align:top;">
						<div style="text-align:left;padding-left:5px;">
							<%=p.getTitle() %>
						</div>
						<div style="text-align:left;padding-left:5px;">
							<span style="font-size:10pt;color:#888888;">
								주문번호 <span style="padding-left:10px;"><%=o.getOrder_num() %></span></span>
						</div>
					</td>
				</tr>
			</table>
		</td>
		<td style="padding-top:5px;vertical-align:top;width:100px;">
			<%=o.getSeller() %>
		</td>
		<td style="padding-top:5px;vertical-align:top;width:70px;">
			<%
			switch(o.getStatus()){
			case "ing":
				%>
				<span style="font-size:13pt;color:#3333ff;">주문<br>확인중</span>
				<%
				break;
			case "done":
				%>
				<span style="font-size:13pt;color:green;">판매 완료</span>
				<%
				break;
			case "cancel":
				%>
				<span style="font-size:13pt;color:red;">판매 취소</span>	
				<%
				break;
			}
			%>
		</td>
	</tr>
</table>
</body>
</html>