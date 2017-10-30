<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.manager.Admin_BoardManager" %>
<%@ page import="com.manager.Admin_SellerManager" %>
<%@ page import="com.board.Board" %>
<%@ page import="com.seller.Seller" %>
<%@ page import="com.common.ManagerStaticAttribute" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="com.common.Categori" %>
<%@ page import="com.board.Board" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
</head>
<%
	//response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'");
	String buyer_id = (String)request.getSession().getAttribute("buyer_id");
	//request.getSession().removeAttribute("buyer_id");
	if(buyer_id==null){
		buyer_id="로그인";
	}
	Board p = (Board)request.getAttribute("board");
	
	
	//System.out.println("show board num : "+p.getBoard_num());
	//System.out.println("show board num buyer id  : "+buyer_id);
%>
<script>
function alertMSG(msg){
	alert(msg);
}
function uplikeboard(board_num,count){
	$('#hidden_like_form_'+board_num).target = "name_hidden_like_iform_"+board_num;
							//document.frm_upSeeCount_+board_num.target = "ifrm_upSeeCount_"+board_num;
	$('#hidden_like_form_'+board_num).action = "/buyer/test_showboard_uplike";
	//document.frm_upSeeCount.action = "/buyer/board_upboardseecount";
	$('#hidden_like_form_'+board_num).submit();
	$('#uplikeboard_count_'+board_num).text((count+1)+' 명');
	//alert($('#uplikeboard_count_'+board_num).html());							
	$('#hidden_like_iform_'+board_num).load(function(){
	});
};
function upcommentboard(board_num){
	$('#hidden_comment_form_'+board_num).target = "name_hidden_comment_iform_"+board_num;
	//document.frm_upSeeCount_+board_num.target = "ifrm_upSeeCount_"+board_num;
	$('#hidden_comment_form_'+board_num).action = "/buyer/test_showboard_createcomment";
	//document.frm_upSeeCount.action = "/buyer/board_upboardseecount";
	$('#hidden_comment_form_'+board_num).submit();
	//alert($("#reply_comment_div").html());
	alert("댓글 올리기 성공");
	//font-size:10pt;padding-top:3px;padding-bottom:3px;
	var input_id = "<%=buyer_id%>";
	var input = "<div style='font-size:10pt;margin-top:3px;margin-bottom:3px;'><span style='color:green;'>"+input_id+"</span> "+$('#comment_upload_textarea_'+board_num).val()+"</div>"+$("#reply_comment_div_"+board_num).html();
	$("#reply_comment_div_"+board_num).html(input);
	$('#comment_upload_textarea_'+board_num).val("");
	//reply_comment_div / comment_upload_textarea_
}
	
function fixBtn(){
	if($('#fix_div').css("display")=="block"){
		$('#fix_btn').text("수정하기");	
		$('#fix_div').fadeOut(300);
	}
	else if($('#fix_div').css("display")=="none"){
		$('#fix_btn').text("수정 취소");
		$('#fix_div').fadeIn(300);
	}
	//alert("click");
}	
</script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
body{
	overflow:auto;
	margin:0px;
	padding:10px;
	border:0px;
	font-family: 'Nanum Pen Script', serif;
	font-size:15pt;
	word-break:break-all;
}
input ,textarea , button{
	font-family: 'Nanum Pen Script', serif;	
}
</style>
<body style="width:850px;height:450px;">
	<div id="fix_div"style="border:1px solid black;display:none;z-index:55;position:fixed;">
		<form action="/buyer/test_boardfix" method="post">
			<input type="hidden" name="buyer_id" value="<%=buyer_id%>">
			<input type="hidden" name="board_num" value="<%=p.getBoard_num()%>">
			<div style="position:fixed;top:10px;left:30px;">
				<input
				name="title" 
				type="text" style="font-size:25pt;" value="<%=p.getTitle()%>">
			</div>
			<div style="position:fixed;top:100px;left:330px;">
				<textarea
				name="textarea"
				style="width:250px;height:300px;font-size:15pt;" 
				><%=p.getTextarea()%></textarea>
			</div>
			<div  style="position:fixed;top:22px;left:700px;">
				<input type="submit" 
				style="outline:none;border:1px dotted #e2e2e2;border-radius:5px;"
				value="수정 완료"
				>
			</div>
		</form>
	</div>
	<div style="padding-bottom:10px;">
		<table style="width:830px;">
			<tr>
				<td>
					<span style="padding-left:20px;font-size:25pt;"><%=p.getTitle() %></span>
				</td>
				<td style="text-align:right;">
					<%if(buyer_id.equals(p.getBuyer())){ %>
					<button onclick="fixBtn()" id="fix_btn"
					style="outline:none;border:1px dotted #e2e2e2;border-radius:5px;">수정하기</button>
					<%} %>
				</td>
			</tr>
		</table>			
	</div>	
	<div style="padding-left:20px;border-top:1px solid black;">
		<span style="font-size:15pt;color:#e2e2e2;"><%=p.getBoard_num() %></span>
		<span style="font-size:13pt;color:#e2e2e2;">[<%=p.getTime() %>]</span>
		
		<table>
			<tr>
				<td>
					<%if (p.getFile_name()!=null&!p.getFile_name().equals("") ){%>
					<img alt=" " style="width:290px;height:250px;margin:0px;padding:0px;" 
						src="<%=ManagerStaticAttribute.dataUrl %>/board/<%=p.getBoard_num()%>/<%=p.getFile_name()%>">
					<%}else{
						%>
					<img alt=" 없음 " style="width:290px;height:250px;margin:0px;padding:0px;"
						src="img/empty.png">
						<%
					} %>
					<div>
						<iframe name="name_hidden_like_iform_<%=p.getBoard_num()%>" 
							id="hidden_like_iform_<%=p.getBoard_num()%>" 
							style="display:none;">
						</iframe>
						<form target="name_hidden_like_iform_<%=p.getBoard_num()%>" 
							action="/buyer/test_showboard_uplike" 
							method="post" 
							id="hidden_like_form_<%=p.getBoard_num()%>">
							<input type="hidden" value="<%=buyer_id%>" name="buyer_id">
							<input type="hidden" value="<%=p.getBoard_num()%>" name="board_num">
						</form>
						
						<%
						if(buyer_id!=null&!buyer_id.equals("")&!buyer_id.equals("로그인")){
						%>
						
						<%
							boolean heartcheck = true;
							if(p.getBuyer_id_recommend_list()!=null){
								for(int z = 0 ; z < p.getBuyer_id_recommend_list().size() ; z ++){
									if(p.getBuyer_id_recommend_list().get(z).equals(buyer_id)){
										heartcheck = false;
									}
								} 
							}
							%>		
							<%
							if(heartcheck){%>
								
								<a onclick="uplikeboard('<%=p.getBoard_num()%>',<%=p.getRecommend() %>)"><span style="cursor:pointer;color:red;">♥</span></a>
								<span id="uplikeboard_count_<%=p.getBoard_num()%>" style="color:#888888"><%=p.getRecommend() %>명 </span>,
									&nbsp &nbsp <span style="padding-left:10px;text-align:right;color:#888888">댓글 <%=p.getReply().size() %>명</span>
												
							<%	
							}else{
							%>
							
								<a onclick="alertMSG('이미 좋아요를 눌르셨습니다.')"><span style="cursor:pointer;color:red;">♥</span></a><span style="color:#888888"><%=p.getRecommend() %>명</span>,
									&nbsp &nbsp <span style="padding-left:10px;text-align:right;color:#888888">댓글 <%=p.getReply().size() %>명</span>`
												
							<%
							}
							%>		
						<%
						}else{%>
							<a onclick="alertMSG('please login')"><span style="cursor:pointer;color:red;">♥</span></a><span style="color:#888888"><%=p.getRecommend() %>명</span>,
							&nbsp &nbsp <span style="padding-left:10px;text-align:right;color:#888888">댓글 <%=p.getReply().size() %>명</span>
												
						<%}%>
						 <span style="padding-left:10px;text-align:right;color:#888888">조회수 <%=p.getSeecount() %>명</span>
					</div>		
				</td>
				<td style="vertical-align:top;width:270px;height:350px;">
					<div style="padding-left:10px;">
																
						<div style="text-align:left;margin-top:5px;">
						 
						
						</div>
									
						<div style="overflow:auto;
						width:240px;height:300px;text-align:left;margin-top:10px;">
							<span style="width:240px;"><%=p.getTextarea() %></span>
							
						</div>
												
					</div>
				</td >
				<td style="height:350px;width:270px;vertical-align:top;">
										<!-- 댓글좋아요 -->
					<div style="padding:5px;">
					<%if(buyer_id!=null&!buyer_id.equals("")&!buyer_id.equals("로그인")){ %>
								
						<iframe name="name_hidden_comment_iform_<%=p.getBoard_num()%>" 
							id="hidden_comment_iform_<%=p.getBoard_num()%>" 
							style="display:none;">
						</iframe>
						<form target="name_hidden_comment_iform_<%=p.getBoard_num()%>" 
							action="/buyer/test_showboard_createcomment" 
							method="post" 
							id="hidden_comment_form_<%=p.getBoard_num()%>">
							<input type="hidden" value="<%=buyer_id%>" name="buyer_id">
							<input type="hidden" value="<%=p.getBoard_num()%>" name="board_num">
							<div>
								<span style="font-size:10pt;">댓글 :</span>
								<input id="comment_upload_textarea_<%=p.getBoard_num() %>" name="textarea"type="text" style="width:150px;height:20px;border-radius:5px;border:1px dotted #333333;outline:none;">
								<input onclick="upcommentboard('<%=p.getBoard_num()%>')" type="button" value="올리기" style="border:1px solid white;border-radius:10px;">
							</div>
						</form>
					<%} %>
					</div>							
					<div id="reply_comment_div_<%=p.getBoard_num()%>" style="overflow-y:scroll;height:300px;">
						<div>
											
						</div>
						<%for(int j = 0 ; j < p.getReply().size() ; j++){%>
											
							<div style="font-size:10pt;padding-top:3px;padding-bottom:3px;">
								<span style="color:green"><%=p.getReply().get(j).getBuyer() %> </span> 
								<%=p.getReply().get(j).getTextarea()%>
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