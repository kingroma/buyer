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
	<div>
		<table>
			<tr>
				<td>
					<img
						style="width:100px;height:100px;" 
						src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=p.getProduct_num()%>/<%=p.getFile_name()%>">
				</td>
				<td style="padding:5px;vertical-align:top;font-size:20pt;">
					<div>
						<%=p.getTitle() %>
					</div>
					<div>
						<span style="font-size:10pt;color:#e2e2e2;">주문번호 : <%=o.getOrder_num() %></span>
					</div>
				</td>
			</tr>
			
			
		</table>
	</div>
	<script>
	function fix_div_open(){
		if($('#fix_div').css("display")=="none"){
			$('#fix_div').fadeIn(500);
		}else if($('#fix_div').css("display")=="block"){
			$('#fix_div').fadeOut(500);
		}
	}
	</script>
	<div style="padding:2px;">
		<div	
			id="fix_div" 
			style="display:none;background-color:#e2e2e2;position:absolute;width:332px;height:100px;">
			<form method="post" action="/buyer/test_myinfo_order_detail">
				<input type="hidden" name="seller_id" value="<%=o.getSeller()%>">
				<input type="hidden" value="<%=o.getOrder_num() %>" name="order_num">
				<div>
					<table>
						<tr>
							<td style="width:70px;">
								올린가격 : 
							</td>
							<td>
								<input type="text" name="price" value="<%=o.getPrice() %>">					
							</td>
						</tr>
						<tr>
							<td style="width:70px;">
								구매자 번호 : 
							</td>
							<td>
								<input type="text" name="phone" value="<%=o.getBuyer_phone() %>">
							</td>
						</tr>
						<tr>
							<td>
								추가내용
							</td>
						</tr>
					</table>
				</div>
				<textarea name="comment"style="resize:none;padding:5px;height:93px;width:320px;overflow:hidden;"><%=o.getOrder_comment() %></textarea>
				<div>
					<input type="submit" value="수정완료"
						style="cursor:pointer;margin-left:0px;outline:none;border:1px solid #e2e2e2;border-radius:10px;">
					<span onclick="fix_div_open()" 
						style="cursor:pointer;font-size:11pt;padding-left:7px;padding-right:7px;margin-left:20px;outline:none;border:1px solid #e2e2e2;border-radius:10px;width:50px;background-color:#e2e2e2;">
						수정취소</span>
				</div>
			</form>
				
				
		</div>
		<table>
			<tr>
				<td style="width:70px;">
					올린가격 : 
				</td>
				<td>
					<%=o.getPrice() %>					
				</td>
			</tr>
			<tr>
				<td style="width:70px;">
					구매자 번호 : 
				</td>
				<td>
					<%=o.getBuyer_phone() %>					
				</td>
			</tr>
			<tr>
				<td>
					추가내용
				</td>
			</tr>
		</table>
		<div style="padding:5px;height:100px;width:320px;overflow:hidden;">
				<%=o.getOrder_comment() %>
		</div>
		<div>
			<button
				onclick="fix_div_open()" 
				style="outline:none;border:1px solid #e2e2e2;border-radius:10px;">수정하기</button> 
		</div>
	</div>
	
</body>
</html>