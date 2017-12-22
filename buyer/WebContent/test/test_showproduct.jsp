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
<%
	String buyer_id = (String)request.getSession().getAttribute("buyer_id");
	//request.getSession().removeAttribute("buyer_id");
	if(buyer_id==null)
		buyer_id="로그인";
	String loginfalse = request.getParameter("login");
	String loginDisplay = "none";
	if(loginfalse!=null){
		if(loginfalse.equals("false")){
			loginDisplay = "block";
		}
	}
	else{
	}
	
	//ArrayList<Product> random_product_list = (ArrayList<Product>)request.getAttribute("random_product_list");
	ArrayList<Product> random_product_list = (ArrayList<Product>)request.getAttribute("new_product");
	ArrayList<Product> best_recommend_product = (ArrayList<Product>)request.getAttribute("best_recommend_product");
	ArrayList<Product> best_reply_product = (ArrayList<Product>)request.getAttribute("best_reply_product");
	String focus_product = "";
	if(request.getAttribute("focus")!=null)
		focus_product = (String)request.getAttribute("focus");
	
	
	boolean heartcheck = true;
	
	//System.out.println(random_product_list.get(0).getProduct_num());
	
	ArrayList<Product> saw_product = (ArrayList<Product>)request.getSession().getAttribute("saw_product");
	if(saw_product==null)
		saw_product=new ArrayList<Product>();
	
%>
<script type="text/javascript" src="jquery-1.7.1.min.js"></script> 
<script type="text/javascript" charset="utf-8" src="jquery-ui-1.12.1/jquery-ui.min.js"></script>


<link rel="stylesheet" type="text/css" href="jquery-ui-1.12.1/jquery-ui.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
a:hover{
	color:black;
	text-decoration:none;
}
a:active{
	color:black;
	text-decoration:none;
}
a:visited{
	color:black;
	text-decoration:none;
}
a:link{
	color:black;
	text-decoration:none;
}
input {
font-family: 'Nanum Pen Script', serif;
}
body{
	font-family: 'Nanum Pen Script', serif;
	font-size:15pt;
	width:100%;
	margin:0px;
	word-break:break-all;
}
.myheader{
	width:100%;
	background-color:#333333;
	position:fixed;
}
.header_top{
	width:1280px;
	height:40px;
	color:white;
	text-align:center;
}
.hedaer_top_table{
	width:1000px;
	padding-top:5px;
	margin-left:140px;
	
}
.header_top_table_td{
	width:100px;
	cursor:pointer;
}
.mybody{
padding-top:40px;
}

#hidden_header_top_search_div{
	display:block;
	position:absolute;
	color:white;
}
#input_search{
	font-family: 'Nanum Pen Script', serif;
}
</style>

<script>

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
	
	
</script>

<script>
function fadeFunction(time){
	setTimeout(function(){
		$(this).fadeIn(200);
	},time);
}
function initHidden(){
	
	$('#hidden_header_top_search_div').fadeOut(300);
	$('#hidden_opacity_gray').fadeOut(300);
	$('#hidden_login_div').fadeOut(300);
	
	$('.header_top_table_td').fadeIn(300);
	$('#hidden_opacity_gray').fadeOut(200);
	
	$('#hidden_id_mypage').fadeOut(100);
	$('#hidden_id_logout').fadeOut(100);
	
	$('.hidden_show_product_detail').fadeOut(100);
	/*
	
	*/
}


$(document).ready(function(){
	//header
	
	//header-top
	$('#showproduct_main_body').fadeIn(800);
	
	$("#header_top_table_td_span2").hover(function(){
			$(this).fadeOut(200);
			setTimeout(function(){
				$('#header_top_table_td_span2').fadeIn(200);
			},210);
		},function(){
			//$(this).animate({ color: 'white' },100);
	});
	$("#header_top_table_td_span3").hover(function(){
		$(this).fadeOut(200);
		setTimeout(function(){
			$('#header_top_table_td_span3').fadeIn(200);
		},210);
	},function(){
		//$(this).animate({ color: 'white' },100);
});
	$("#header_top_table_td_span4").hover(function(){
		$(this).fadeOut(200);
		setTimeout(function(){
			$('#header_top_table_td_span4').fadeIn(200);
		},210);
	},function(){
		//$(this).animate({ color: 'white' },100);
});
	$("#header_top_table_td_span5").hover(function(){
		$(this).fadeOut(200);
		setTimeout(function(){
			$('#header_top_table_td_span5').fadeIn(200);
		},210);
	},function(){
		//$(this).animate({ color: 'white' },100);
});
	$("#header_top_table_td_span6").hover(function(){
		$(this).fadeOut(200);
		setTimeout(function(){
			$('#header_top_table_td_span6').fadeIn(200);
		},210);
	},function(){
		//$(this).animate({ color: 'white' },100);
});
	$("#header_top_table_td_span7").hover(function(){
		$(this).fadeOut(200);
		setTimeout(function(){
			$('#header_top_table_td_span7').fadeIn(200);
		},210);
	},function(){
		//$(this).animate({ color: 'white' },100);
});
	//header-top
	
	//header_hidden search
	$('#header_top_table_td4').click(function(){
		initHidden();
		if($('#hidden_login_div').css("display")=="block"){
			$('#hidden_login_div').fadeOut(300);
			
		}
		//$('#hidden_header_top_search_div').css("visibility","visible");
		
		//$('.header_top_table_td').css("visibility","hidden");
		
		setTimeout(function(){
			$('#header_top_table_td1').fadeOut(500);
		},70);
		setTimeout(function(){
			$('#header_top_table_td2').fadeOut(500);
		},140);
		setTimeout(function(){
			$('#header_top_table_td3').fadeOut(500);
		},210);
		
		setTimeout(function(){
			$('#header_top_table_td4').fadeOut(500);
		},280);
		
		setTimeout(function(){
			$('#header_top_table_td5').fadeOut(500);
		},350);
		setTimeout(function(){
			$('#header_top_table_td6').fadeOut(500);
		},420);
		
		setTimeout(function(){
			$('#header_top_table_td7').fadeOut(500);
		},490);
		
		//for(var i = 1 ; i <=7 ; i ++){
			//setTimeout(function(){
				//$('#header_top_table_td'+i).fadeOut(500);
			//}, 50);
		//}
		setTimeout(function(){
			$('#hidden_header_top_search_div').fadeIn(500);
			$('#input_search').focus();
		}, 700);
		
		$('#hidden_opacity_gray').fadeIn(500);
		
	});
	
	$('#hidden_header_top_search_div_X').click(function(){
		//$('#hidden_header_top_search_div').css("visibility","hidden");
		$('#hidden_header_top_search_div').fadeOut(300);
		//$('.header_top_table_td').css("visibility","visible");
		$('.header_top_table_td').fadeIn(300);
		$('#hidden_opacity_gray').fadeOut(200);
	});
	if($('#header_top_table_td_span5').text()!='로그인'){
		$('#header_top_table_td_span5').css("color","green");
	}
	//alert($('#header_top_table_td_span5').val()+"/"+$('#header_top_table_td_span5').text());
	$('#header_top_table_td5').click(function(){
		initHidden();
		if($('#header_top_table_td_span5').text()=='로그인'){
			if($('#hidden_login_div').css("display")=="none"){
				$('#input_login_id').focus();
				$('#hidden_login_div').fadeIn(300);
				$('#hidden_opacity_gray').fadeIn(200);
			}else{
				$('#hidden_login_div').fadeOut(300);
				$('#hidden_opacity_gray').fadeOut(200);
			}
		}else{
			if($('#hidden_id_logout').css("display")=="none"){
				setTimeout(function(){
					$('#hidden_id_logout').fadeIn(500);
				},50);
				setTimeout(function(){
					$('#hidden_id_mypage').fadeIn(500);
				},400);
			}else{
				setTimeout(function(){
					$('#hidden_id_mypage').fadeOut(500);
				},50);
				setTimeout(function(){
					$('#hidden_id_logout').fadeOut(500);
				},400);
				
			}
		}
	});
	
	
	var focus_product = "<%=focus_product%>";
	
	if(focus_product!=""&focus_product!=null&focus_product!=" "){
		//alert(focus_product);
		hidden_show_product_detail(focus_product);
	}
	
	$('#header_top_table_td_span6').click(function(){
		if($('#saw_product_div').css("display")=="none"){
			$('#saw_product_div').fadeIn(500);
		}
		else if($('#saw_product_div').css("display")=="block"){
			$('#saw_product_div').fadeOut(400);
		}
	});
	
	
});
<%
int temp_hidden_show_product_detail = 0;
%>

function hidden_show_product_detail(num){
	initHidden();
	$('#hidden_opacity_gray').fadeIn(200);
	
	$('.hidden_show_product_detail').fadeOut(100);
	setTimeout(function(){
		$('#hidden_show_product_detail_0').fadeIn(500);
	},100);
	var url = "<%=ManagerStaticAttribute.testBuyerUrl%>/test_showproduct_detail?product_num="+num+"&buyer_id=<%=buyer_id%>";
	//$('#show_board_detail_iframe_show').attr("src", "http://localhost:8080/buyer/test_showboard_detail?board_num="+num);
	
	$('#show_product_detail_iframe_show').attr("src", url);
	
}

function alertMSG(msg){
	alert(msg);
}

//hidden_header_top_search_div

</script>

</head>
<body>

	<div class="ibody" style="background-color:#eeeeee;">
		
		<div class="myheader">
			<div class="header_top">
				<div id="hidden_header_top_search_div" style="display:none;">
					<div style="text-align:center;width:1280px;padding-top:3px;">
						<div style="float:left;padding-left:300px;">
							<img style="padding-top:5px;width:25px;height:20px;"src="img/search_btn.png">
						</div>
						<form action="/buyer/test_search" method="get">
							<div style="float:left;padding-left:10px;">
								<input id="input_search" type="text" 
								placeholder="검색...." name="keyword" 
								style="width:400px;outline:none;color:white;font-size:14pt;padding-top:7px;background-color:#333333;border:0px;">	
							</div>
							<div style="float:left;padding-left:10px;padding-top:7px;">
								<select id="categori" name="categori"
									style="font-family: 'Nanum Pen Script', serif;">
									<option value="product">상품</option>
							        <option value="board">게시판</option>
								</select>
							</div>
						</form>
						<div id="hidden_header_top_search_div_X"style="cursor:pointer;float:left;padding-left:100px;padding-top:2px;">
							<span style="font-size:20pt;">X</span>
						</div>
						<div style="clear:both;">
						</div>
						
						
						
					</div>
				</div>
				<table class="hedaer_top_table">
					<tr>
						<td id="header_top_table_td1" class="header_top_table_td">
							<a href="<%=ManagerStaticAttribute.testBuyerUrlMain%>">
								<img style="width:50px;height:20px;" src="img/logo.png">
							</a>
						</td>
						<td id="header_top_table_td2" class="header_top_table_td">
							<a style="color:white;"href="/buyer/test_showproduct"><span id="header_top_table_td_span2">상품</span></a>
						</td>
						<td id="header_top_table_td3"class="header_top_table_td">
							<a style="color:white;"href="/buyer/test_showboard"><span id="header_top_table_td_span3">게시판</span></a>
						</td>
						<td id="header_top_table_td4"class="header_top_table_td">
							<span id="header_top_table_td_span4">검색</span>
						</td>
						<td id="header_top_table_td5" class="header_top_table_td">
							<span id="header_top_table_td_span5"><%=buyer_id %></span>
							<div style="background-color:#333333;margin-left:25px;margin-top:7px;position:absolute;z-index:44;">
								<form action="#" method="post">
									
									<div id="hidden_id_logout" style="width:100px;text-align:center;display:none;padding:2px;">
										<a href="/buyer/test_logout"><span style="color:white;">로그아웃</span></a>
									</div>
								</form>
								<div id="hidden_id_mypage" style="width:100px;text-align:center;display:none;padding:2px;">
								<a href="/buyer/test_myinfo"><span style="color:white;">나의페이지</span></a>
								</div>
							</div>	
						</td>
						<td id="header_top_table_td6" class="header_top_table_td">
							
							<span id="header_top_table_td_span6">내가본상품</span>
							<div id="saw_product_div" style="margin-left:200px;margin-top:25px;display:none;padding-top:20px;padding-left:10px;padding-right:20px;position:fixed;background-color:#e2e2e2;">
								<%for(int i = 0 ; i < saw_product.size() ; i ++){
									%>
									<div style="text-align:left;padding:5px;padding-top:2px;padding-bottom:2px;">
										<img style="width:40px;height:40px;"
										src="<%=ManagerStaticAttribute.dataUrl %>/product/<%=saw_product.get(i).getProduct_num()%>/<%=saw_product.get(i).getFile_name()%>"
										title="<%=saw_product.get(i).getTitle() %>"
										alt=" "
										>
										<span style="color:green;"><%=saw_product.get(i).getTitle() %></span>
										
									</div>
										
									<%
								} %>
							</div>
						</td>
						<td id="header_top_table_td7" class="header_top_table_td">
							<span id="header_top_table_td_span7">고객센터</span>
						</td>
						
					</tr>
				</table>
				
			</div>	
		</div>
		
		<div class="mybody">
			
			<div onclick="initHidden()" id="hidden_opacity_gray"
			style="display:<%=loginDisplay%>;
			padding-top:40px;z-index:55;background-color:#999999;opacity:0.8;position:fixed;width:100%;height:100%;">
				
			</div>
			<div id="hidden_login_div" style="display:<%=loginDisplay%>;z-index:66;position:fixed;left:400px;top:150px;width:400px;height:300px;background-color:white;">
				<div style="padding:30px;">
					<div style="font-size:30pt;">
						로그인
					</div>
					<form action="<%=ManagerStaticAttribute.testBuyerUrlLogin%>" method="post">
						<input name="location" type="hidden" value="<%=request.getRequestURL() %>">
						<div style="margin-top:20px;float:left;">	
							<table>
								<tr>
									<td style="width:100px;height:30px;text-align:center">
										아이디
									</td>
									<td>
										<input id="input_login_id" style="outline:none;"name="id" type="text">
									</td>
								</tr>
								<tr>
									<td style="width:100px;height:30px;text-align:center">
										패스워드
									</td>
									<td>
										<input style="outline:none;"name="pw" type="password">
									</td>
								</tr>
							</table>
						</div>
						<div style="margin-left:10px;margin-top:32px;float:left;">
							 <button style="height:46px;">확인</button>
						</div>
					</form>
					<div style="clear:both;"></div>
					<div style="padding-left:40x;">
						<div style="cursor:pointer;margin-top:10px;margin-left:60px;float:left;">
							<a href="<%=ManagerStaticAttribute.testBuyerUrlSearchId%>">아이디찾기</a>
						</div>
						<div style="padding-left:20px;margin-top:10px;cursor:pointer;float:left;"> 
						 	<a href="<%=ManagerStaticAttribute.testBuyerUrlSearchPw%>">비밀번호찾기</a> 
						</div>
						<div style="padding-left:20px;margin-top:10px;cursor:pointer;float:left;">
							<a href="<%=ManagerStaticAttribute.testBuyerUrlAccount%>">회원가입</a>
						</div>
					</div>
					<div style="clear:both;">
					</div>
				</div>
			</div>
			
			<div style="margin-top:10px;">
			</div>
			<script>
			
			</script>
			<div class="main_body_header" style="margin-left:140px;width:1000px;">
				<div style="position:fixed;">
					<div style="margin-left:50px;width:200px;height:400px;border:0px solid black;vertical-align:top;">
						<%//best_recommend_product/best_reply_product %>
						<div>							
							<div style="text-align:center;">
								<span style="font-size:10pt;color:red;">♥ </span>
								<span style="font-size:10pt;">top 3</span>
							</div>
							<div style="padding:10px;padding-left:20px;">
								<%for(int i = 0 ; i < best_recommend_product.size() ; i ++){%>
									<img alt="" 
									
									style="width:50px;margin-left:10px;height:50px;margin:0px;padding:0px;cursor:pointer;" 
									src="<%=ManagerStaticAttribute.dataUrl %>/product/<%=best_recommend_product.get(i).getProduct_num()%>/<%=best_recommend_product.get(i).getFile_name()%>"
									title="<%=best_recommend_product.get(i).getTitle() %>"
									onclick="hidden_show_product_detail('<%=best_recommend_product.get(i).getProduct_num() %>')" 
									>
								<%} %>
							</div>
						</div>
						<div>						
							<div style="text-align:center;">
								<span style="font-size:10pt;color:red;">댓글 </span> 
								<span style="font-size:10pt;">top 3</span>
							</div>
							<div style="padding:10px;padding-left:20px;">
								<%for(int i = 0 ; i < best_reply_product.size() ; i ++){%>
									<img alt="" 
									style="width:50px;margin-left:10px;height:50px;margin:0px;padding:0px;cursor:pointer;" 
									src="<%=ManagerStaticAttribute.dataUrl %>/product/<%=best_reply_product.get(i).getProduct_num()%>/<%=best_reply_product.get(i).getFile_name()%>"
									title="<%=best_reply_product.get(i).getTitle() %>"
									onclick="hidden_show_product_detail('<%=best_reply_product.get(i).getProduct_num() %>')" 
									>
								<%} %>
							</div>
						</div>
						
					</div>
				</div>
				<div id="hidden_show_product_detail_0"
				class="hidden_show_product_detail"
				style="display:none;z-index:99;position:fixed;width:870px;height:470px;border:0px;background-color:white;top:80px;left:200px;padding:0px;">
					
					<iframe id="show_product_detail_iframe_show" 
						style="border:0px;width:870px;height:470px;" 
						src="">
						
					</iframe>
					
				</div>
				<%for(int i = 0 ; i < random_product_list.size() ; i ++){
					if(random_product_list.get(i).getStatus().equals("ing")){
					%>
				
				<%}} %>
				<div id="showproduct_main_body" style="display:none;padding-left:300px;width:600px;">
					<%for(int i = 0 ; i < random_product_list.size() ; i ++){
					if(random_product_list.get(i).getStatus().equals("ing")){
					%>
					<!-- hidden_opacity_gray -->
					<div id="hidden_show_product_detail_<%=random_product_list.get(i).getProduct_num() %>"
					class="hidden_show_product_detail" 
					style="display:none;z-index:66;width:900px;height:450px;padding:10px;
					position:fixed;top:70px;left:200px;background-color:white;">
						
						<!-- 여기다 상품 상세 페이지 입력  -->
					</div>
					<div style="margin-top:20px;"></div>
					<div style="background-color:white;padding:10px;">
						<table style="vertical-align:top;">
							<tr>
								<td style="vertical-align:top;">
									<div style="width:50px;background-color:white;vertical-align:top;">
										<img style="border:1px solid white;border-radius:5px;width:50px;height:50px;vertical-align:top;" alt=" "
										src="<%=ManagerStaticAttribute.dataUrl%>/seller/<%=random_product_list.get(i).getSeller()%>/img.jpg">
									</div>
								</td>
								<td style="width:440px;">
									<div style="padding-left:10px;">
										<span style="color:green;font-weight:bold;"><%=random_product_list.get(i).getSeller() %></span>
										&nbsp&nbsp
										<span><%=random_product_list.get(i).getTime() %> / </span>
										<span> [<%=random_product_list.get(i).getProduct_num() %>] / </span> 
										<span style="color:#e2e2e2">  <%=random_product_list.get(i).getCategori() %>  </span>
										<br>
										<div id="show_product_title_<%=random_product_list.get(i).getProduct_num() %>" 
										style="width:300px;cursor:pointer;" 
										onclick="hidden_show_product_detail('<%=random_product_list.get(i).getProduct_num() %>')" >
										제목 : <%=random_product_list.get(i).getTitle()%>
										<br>
										<span style="color:red;">♥</span> <span style="color:#888888"><%=random_product_list.get(i).getRecommend() %>명</span>
										, <span style="padding-left:10px;text-align:right;color:#888888">댓글 <%=random_product_list.get(i).getComment().size() %>명</span>
										</div>
									</div>
									<div style="padding-left:20px;background-color:white;">
										<div>
										</div>
									</div>
								</td>
								<td style="">
									<%if(random_product_list.get(i).getFile_name()!=null|!random_product_list.get(i).getFile_name().equals("")){ %>
									<div style="text-align:center;margin-top:10px;">
										<img alt="" style="width:70px;height:70px;" 
										src="<%=ManagerStaticAttribute.dataUrl %>/product/<%=random_product_list.get(i).getProduct_num()%>/<%=random_product_list.get(i).getFile_name()%>">
									</div>
									<%} %>	
								</td>
							</tr>
						</table>
						
					</div>
					<div style="padding-bottom:10px;"></div>
					<div style="clear:both;"></div>
					
					<%}} %>
				</div>
			</div>
			<div style="clear:both">
			</div>
			<div>
			<div class="main_body_footer" style="margin-top:20px;margin-left:140px;width:1000px;">
				<div style="width:1000px;">
					
				</div>
			</div>
			
		</div>
		<div class="myfooter" 
		style="font-size:9pt;font-weight:bold;font-family:serif;background-color:#e2e2e2">
			<div style="width:1000px;margin-left:140px;height:200px;z-index:99">
				<div style="padding-top:10px;">
					 
				</div>
				<div style="padding-top:10px;color:#444444">
					<div>
						<img style="width:50px;height:50px;" src="img/kau.jpg">
						<span style="margin-left:5px;">한국항공대학교(Korea AeroSpace Univ)</span>
					</div>
					<div style="margin-top:10px;">
						웹 프로그래밍
					</div>
					<div style="margin-top:10px;">
						[1조] 이정헌 / 박동준 / 김정진
					</div>
					<div style="margin-top:10px;">
						<span>Copyright © 2017 KAU . All rights reserved.</span>
						
						<img style="margin-left:550px;width:30px;height:15px;" src="img/korea.png">
						<span style="margin-left:5px;">South Korea</span>
					</div>
					
					
					
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>