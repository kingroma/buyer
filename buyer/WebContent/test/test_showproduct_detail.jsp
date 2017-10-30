<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.product.Product" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="jquery-ui-1.12.1/jquery-ui.min.js"></script>
</head>
<%
	String buyer_id = (String)request.getSession().getAttribute("buyer_id");
	//request.getSession().removeAttribute("buyer_id");
	if(buyer_id==null)
		buyer_id="로그인";
	Product p = (Product)request.getAttribute("product");
%>
<script>
function alertMSG(msg){
	alert(msg);
}
function uplikeproduct(product_num,count){
	$('#hidden_like_form_'+product_num).target = "name_hidden_like_iform_"+product_num;
							//document.frm_upSeeCount_+board_num.target = "ifrm_upSeeCount_"+board_num;
	$('#hidden_like_form_'+product_num).action = "/buyer/test_showproduct_uplike";
	//document.frm_upSeeCount.action = "/buyer/board_upboardseecount";
	$('#hidden_like_form_'+product_num).submit();
	$('#uplikeproduct_count_'+product_num).text((count+1)+' 명');
	//alert($('#uplikeproduct_count_'+product_num).html());							
	$('#hidden_like_iform_'+product_num).load(function(){
	});
};
function upcommentproduct(product_num){
	$('#hidden_comment_form_'+product_num).target = "name_hidden_comment_iform_"+product_num;
	//document.frm_upSeeCount_+board_num.target = "ifrm_upSeeCount_"+board_num;
	$('#hidden_comment_form_'+product_num).action = "/buyer/test_showproduct_createcomment";
	//document.frm_upSeeCount.action = "/buyer/board_upboardseecount";
	$('#hidden_comment_form_'+product_num).submit();
	//alert($("#reply_comment_div").html());
	alert("댓글 올리기 성공");
	//font-size:10pt;padding-top:3px;padding-bottom:3px;
	var input_id = "<%=buyer_id%>";
	var input = "<div style='font-size:10pt;margin-top:3px;margin-bottom:3px;'><span style='color:green;'>"+input_id+"</span> "+$('#comment_upload_textarea_'+product_num).val()+"</div>"+$("#reply_comment_div_"+product_num).html();
	$("#reply_comment_div_"+product_num).html(input);
	$('#comment_upload_textarea_'+product_num).val("");
	//reply_comment_div / comment_upload_textarea_
}
	
function open_order_page(){
	if($('#order_page_div').css("display")=="block"){
		//alert("fadeIn");
		$('#order_page_div').fadeOut(300);
	}else{
		//alert("fadeOut");
		$('#order_page_div').fadeIn(300);
	}

}	
</script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
body{
	overflow:hidden;
	margin:0px;
	padding:10px;
	border:0px;
	font-family: 'Nanum Pen Script', serif;
	font-size:15pt;
	word-break:break-all;
}
</style>
<body style="width:850px;height:450px;">
	
	<div style="padding-bottom:10px;">
		<table style="width:830px;">
			<tr>
				<td>
					<span style="padding-left:20px;font-size:25pt;"><%=p.getTitle() %></span>
				</td>
				<td style="text-align:right;">
					<button
					onclick="open_order_page()" 
					style="border:1px dotted #e2e2e2;border-radius:5px;">구매하기</button>
					<div id="order_page_div" style="display:none;position:fixed;top:80px;left:500px;">
						<div style="border:1px solid #e2e2e2;width:330px;height:320px; background-color:white;padding:10px;" >
							<form action="/buyer/test_orderproduct" method="post" onsubmit="return checkForm();">
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
												핸드폰번호 :
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
												<textarea name="order_comment" style="resize:none;width:200px;height:100px;"></textarea>
												
											</td>
										</tr>
									</table>
								</div>
								<div style="text-align:center;margin-top:10px;margin-bottom:10px;">
									<input type="submit" value="주문넣기"style="margin-left:50px;">
								</div>
							</form>
						</div>
					</div>
				</td>
			</tr>
		</table>			
	</div>	
	<div style="padding-left:20px;border-top:1px solid black;">
		<span style="font-size:15pt;color:#e2e2e2;"><%=p.getProduct_num() %></span>
		<span style="font-size:13pt;color:#e2e2e2;">[<%=p.getTime() %>]</span>
		
		<table>
			<tr>
				<td>
					<img alt="" style="width:290px;height:250px;margin:0px;padding:0px;" 
						src="<%=ManagerStaticAttribute.dataUrl %>/product/<%=p.getProduct_num()%>/<%=p.getFile_name()%>">
					<div>
						<iframe name="name_hidden_like_iform_<%=p.getProduct_num()%>" 
							id="hidden_like_iform_<%=p.getProduct_num()%>" 
							style="display:none;">
						</iframe>
						<form target="name_hidden_like_iform_<%=p.getProduct_num()%>" 
							action="/buyer/test_showproduct_uplike" 
							method="post" 
							id="hidden_like_form_<%=p.getProduct_num()%>">
							<input type="hidden" value="<%=buyer_id%>" name="buyer_id">
							<input type="hidden" value="<%=p.getProduct_num()%>" name="product_num">
						</form>
						<%
						if(buyer_id!=null&!buyer_id.equals("")&!buyer_id.equals("로그인")){
						%>
						
						<%
							boolean heartcheck = true;
							if(p.getRecommend_ip()!=null){
								for(int z = 0 ; z < p.getRecommend_ip().size() ; z ++){
									if(p.getRecommend_ip().get(z).equals(buyer_id)){
										heartcheck = false;
									}
								} 
							}
							%><%
							if(heartcheck){
							%>
								<a onclick="uplikeproduct('<%=p.getProduct_num()%>',<%=p.getRecommend() %>)"><span style="cursor:pointer;color:red;">♥</span></a>
								<span id="uplikeproduct_count_<%=p.getProduct_num()%>"style="color:#888888"><%=p.getRecommend() %>명 </span>,
									&nbsp &nbsp <span style="padding-left:10px;text-align:right;color:#888888">댓글 <%=p.getComment().size() %>명</span>
												
							<%	
							}else{
							%>
							
								<a onclick="alertMSG('이미 좋아요를 눌르셨습니다.')"><span style="cursor:pointer;color:red;">♥</span></a><span style="color:#888888"><%=p.getRecommend() %>명</span>,
									&nbsp &nbsp <span style="padding-left:10px;text-align:right;color:#888888">댓글 <%=p.getComment().size() %>명</span>`
												
							<%
							}
							%>		
						<%
						}else{%>
							<a onclick="alertMSG('please login')"><span style="cursor:pointer;color:red;">♥</span></a><span style="color:#888888"><%=p.getRecommend() %>명</span>,
							&nbsp &nbsp <span style="padding-left:10px;text-align:right;color:#888888">댓글 <%=p.getComment().size() %>명</span>
												
						<%}%>
					</div>		
				</td>
				<td style="vertical-align:top;width:270px;height:350px;">
					<div style="padding-left:10px;">
																
						<div style="text-align:left;margin-top:5px;">
						<span style="font-size:20pt;"><%=p.getPrice() %></span>  원 
						
						</div>
									
						<div style="width:240px;height:300px;text-align:left;margin-top:10px;">
							<%=p.getTextarea() %>
						</div>
												
					</div>
				</td >
				<td style="height:350px;width:270px;vertical-align:top;">
										<!-- 댓글좋아요 -->
					<div style="padding:5px;">
					<%if(buyer_id!=null&!buyer_id.equals("")&!buyer_id.equals("로그인")){ %>
								
						<iframe name="name_hidden_comment_iform_<%=p.getProduct_num()%>" 
							id="hidden_comment_iform_<%=p.getProduct_num()%>" 
							style="display:none;">
						</iframe>
						<form target="name_hidden_comment_iform_<%=p.getProduct_num()%>" 
							action="/buyer/test_showproduct_createcomment" 
							method="post" 
							id="hidden_comment_form_<%=p.getProduct_num()%>">
							<input type="hidden" value="<%=buyer_id%>" name="buyer_id">
							<input type="hidden" value="<%=p.getProduct_num()%>" name="product_num">
							<div>
								<span style="font-size:10pt;">댓글 :</span>
								<input id="comment_upload_textarea_<%=p.getProduct_num() %>" name="textarea"type="text" style="width:150px;height:20px;border-radius:5px;border:1px dotted #333333;outline:none;">
								<input onclick="upcommentproduct('<%=p.getProduct_num()%>')" type="button" value="올리기" style="border:1px solid white;border-radius:10px;">
							</div>
						</form>
					<%} %>
					</div>							
					<div id="reply_comment_div_<%=p.getProduct_num()%>" style="overflow-y:scroll;height:300px;">
						<div>
											
						</div>
						<%for(int j = 0 ; j < p.getComment().size() ; j++){%>
											
							<div style="font-size:10pt;padding-top:3px;padding-bottom:3px;">
								<span style="color:green"><%=p.getComment().get(j).getBuyer() %> </span> 
								<%=p.getComment().get(j).getTextarea()%>
							</div>
								<%
						} %>
					</div>
				</td>
			</tr>
		</table>
		
	</div>

</body>
</html>