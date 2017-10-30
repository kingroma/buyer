<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.manager.Admin_BoardManager" %>
<%@ page import="com.manager.Admin_SellerManager" %>
<%@ page import="com.board.Board" %>
<%@ page import="com.seller.Seller" %>
<%@ page import="com.common.ManagerStaticAttribute" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.order.Order" %>
<%@ page import="com.common.Categori" %>
<%@ page import="com.board.Board" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.buyer.Buyer" %>
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
	

	ArrayList<Board> board_list = (ArrayList<Board>)request.getAttribute("board_list");
	String focus_board = "";
	if(request.getAttribute("focus")!=null)
		focus_board = (String)request.getAttribute("focus");
	
	ArrayList<Product> saw_product = (ArrayList<Product>)request.getSession().getAttribute("saw_product");
	
	//System.out.println(random_board_list.get(0).getboard_num());
	if(saw_product==null)
		saw_product=new ArrayList<Product>();
	
	ArrayList<Order> order_list = (ArrayList<Order>)request.getAttribute("order_list");
	ArrayList<Product> orderproduct_list = (ArrayList<Product>)request.getAttribute("orderproduct_list");
	ArrayList<Board> my_board_list = (ArrayList<Board>)request.getAttribute("my_board_list");
	Buyer b = (Buyer)request.getAttribute("buyer");
	
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
	
	$('.hidden_show_board_detail').fadeOut(100);
	/*
	
	*/
}


$(document).ready(function(){
	//header
	
	//header-top
	$('#showboard_main_body').fadeIn(800);
	
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
	
	
	var focus_board = "<%=focus_board%>";
	
	if(focus_board!=""&focus_board!=null&focus_board!=" "){
		//alert(focus_board);
		hidden_show_board_detail(focus_board);
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
int temp_hidden_show_board_detail = 0;
%>

function hidden_show_board_detail(num){
	initHidden();
	$('#hidden_opacity_gray').fadeIn(200);
	
	$('.hidden_show_board_detail').fadeOut(100);
	setTimeout(function(){
		$('#hidden_show_board_detail_0').fadeIn(500);
	},100);
	//hidden_show_board_detail_
	//$('#').reload();
	var url = "http://localhost:8080/buyer/test_showboard_detail?board_num="+num+"&buyer_id=<%=buyer_id%>";
	//$('#show_board_detail_iframe_show').attr("src", "http://localhost:8080/buyer/test_showboard_detail?board_num="+num);
	
	
	
	$('#show_board_detail_iframe_show').attr("src", url);
	
	/*
	hidden_show_board_detail_0
	<iframe id="show_board_detail_iframe_show" style="border:0px;width:870px;height:470px;" 
	src="http://localhost:8080/buyer/test_showboard_detail?board_num=b33">
		
	</iframe>
	*/
	
	//alert($('#show_board_detail_iframe_show').attr('src'));
	//document.getElementById("show_board_detail_iframe_show").src = url;

	//document.getElementById("show_board_detail_iframe_show").location.href = url;

	//document.getElementById("show_board_detail_iframe_show").contentWindow.location.reload();
	//window['show_board_detail_iframe_show'].location.reload(true);

	//alert("RELOAD");
	
}

function alertMSG(msg){
	alert(msg);
}

function show_what(what){
	iframe_show_detail_click_init();
	$('#order_list').fadeOut(300);
	$('#board_list').fadeOut(300);
	$('#myinfo').fadeOut(300);
	
	$('#menu_my_list_div').css("background-color","white");
	$('#menu_my_list_span').css("color","black");
	$('#menu_order_list_div').css("background-color","white");
	$('#menu_order_list_span').css("color","black");
	$('#menu_board_list_div').css("background-color","white");
	$('#menu_board_list_span').css("color","black");
	
	setTimeout(function(){
		$('#'+what).fadeIn(500);
		if(what=="order_list"){
			$('#menu_order_list_div').css("background-color","black");
			$('#menu_order_list_span').css("color","white");
		}if(what=="board_list"){
			$('#menu_board_list_div').css("background-color","black");
			$('#menu_board_list_span').css("color","white");
		}if(what=="myinfo"){
			$('#menu_my_list_div').css("background-color","black");
			$('#menu_my_list_span').css("color","white");
		}
	},70);
	
	
}

function iframe_show_detail_click_init(){
	$('#iframe_show_detail_X').fadeOut(200);
	
	$('#iframe_show_detail').fadeOut(200);
	$('#iframe_show_detail_comment_X').fadeOut(200);
	
	$('#iframe_show_detail_comment').fadeOut(200);
}

function iframe_show_detail_click_order_num(order_num){
	iframe_show_detail_click_init();
	var url = "http://localhost:8080/buyer/test_myinfo_order_detail?order_num="+order_num;
	$('#iframe_show_detail_X').fadeIn(600);
	$('#iframe_show_detail').css("display","none");
	$('#iframe_show_detail').fadeIn(500);
	$('#iframe_show_detail').attr("src",url);
	//alert("open");
}

function iframe_show_detail_click_order_num_X(){
	$('#iframe_show_detail_X').fadeOut(600);
	//$('#iframe_show_detail').css("display","none");
	$('#iframe_show_detail').fadeOut(500);
	//$('#iframe_show_detail').attr("src",url);
}
function iframe_show_detail_comment_click_order_num(order_num){
	iframe_show_detail_click_init();
	var url = "http://localhost:8080/buyer/test_myinfo_order_detail_comment?order_num="+order_num;
	$('#iframe_show_detail_comment_X').fadeIn(600);
	$('#iframe_show_detail_comment').css("display","none");
	$('#iframe_show_detail_comment').fadeIn(500);
	$('#iframe_show_detail_comment').attr("src",url);
	//alert("open");
}
function iframe_show_detail_comment_click_order_num_X(){
	$('#iframe_show_detail_comment_X').fadeOut(600);
	//$('#iframe_show_detail').css("display","none");
	$('#iframe_show_detail_comment').fadeOut(500);
	//$('#iframe_show_detail').attr("src",url);
}

function buyer_hidden_div_open(){
	if($('#hidden_buyer_info_div').css("display")=="block"){
		$('#hidden_buyer_info_div').fadeOut(500);
		$('#buyer_fix_btn').text("수정하기");
	}else if($('#hidden_buyer_info_div').css("display")=="none"){
		$('#hidden_buyer_info_div').fadeIn(500);
		$('#buyer_fix_btn').text("수정취소");
	}
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
							<div id="saw_product_div" style="margin-left:200px;margin-top:25px;display:none;padding-left:10px;padding-right:20px;position:fixed;background-color:#e2e2e2;">
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
			<div class="main_body_header" style="margin-left:30px;width:1000px;">
				<div style="position:fixed;margin-left:770px;margin-top:0px;
					width:350px;height:320px;">
					<div id="iframe_show_detail_X" 
						onclick="iframe_show_detail_click_order_num_X()"
						style="z-index:11;cursor:pointer;display:none;position:absolute;margin-left:320px;font-size:28pt;">X</div>
					<iframe 
					scrolling="no"
					id="iframe_show_detail"
					style="position:absolute;display:none;width:350px;height:320px;overflow:hidden;border:0px;"
					src="">
					
					</iframe>
					<div id="iframe_show_detail_comment_X" 
						onclick="iframe_show_detail_comment_click_order_num_X()"
						style="z-index:11;cursor:pointer;display:none;position:absolute;margin-left:320px;font-size:28pt;">X</div>
					<iframe 
					scrolling="no"
					id="iframe_show_detail_comment"
					style="position:absolute;display:none;width:350px;height:320px;overflow:hidden;border:0px;"
					src="">
					
					</iframe>
					
				</div>
				<div style="position:fixed;">
					<div style="margin-left:0px;width:100px;height:400px;border:0px solid black;vertical-align:top;">
						<div
							id="menu_order_list_div"
							onclick="show_what('order_list')" 
							style="cursor:pointer;text-align:right;width:100px;border-bottom-left-radius:10px;border-top-left-radius:10px;background-color:black;color:white;">
							<span
								id="menu_order_list_span"
								style="font-size:18pt;padding-right:10px;">주문정보</span>
						</div>
						<div style="padding:10px;"></div>
						<div 
							id="menu_board_list_div"
							onclick="show_what('board_list')"
							style="cursor:pointer;text-align:right;width:100px;border-bottom-left-radius:10px;border-top-left-radius:10px;background-color:white;">
							<span
								id="menu_board_list_span"
								style="font-size:18pt;padding-right:10px;">게시판정보</span>
						</div>
						<div style="padding:10px;"></div>
						<div
							id="menu_my_list_div"
							onclick="show_what('myinfo')" 
							style="cursor:pointer;text-align:right;width:100px;border-bottom-left-radius:10px;border-top-left-radius:10px;background-color:white;">
							<span
								id="menu_my_list_span"
								style="font-size:18pt;padding-right:10px;">내회원정보</span>
						</div>
						
					</div>
				</div>
			</div>
			<div style="clear:both">
			</div>
			<div>
			<div class="main_body_body" 
			style="margin-left:140px;border:1px solid #e2e2e2;padding-left:10px;display:block;width:630px;">
				<div id="order_list" style="padding:15px;">
					<div>
						<table style="margin-left:8px;">
							<tr>
								<td style="text-align:center;width:90px;">
									주문일
								</td>
								<td style="text-align:center;width:300px;">
									주문정보
								</td>
								<td style="text-align:center;width:100px;">
									판매자
								</td>
								<td style="text-align:center;width:70px;">
									주문상태
								</td>
							</tr>	
						</table>
					</div>
					<div style="height:1px;border-top:1px dotted #ffffff;"></div>
					<%for(int i = 0 ; i < order_list.size() ; i ++){
						%>
							<div 
								style="overflow:hidden;width:650px;height:85px;margin-bottom:5px;">
								<iframe  
								scrolling="no"
								id=""
								style="border:0px;overflow:hidden;width:600px;height:60px;padding:0px;margin:0px;"
								src="http://localhost:8080/buyer/test_myinfo_order?order_num=<%=order_list.get(i).getOrder_num()%>">
								
								</iframe>
								
								<div style="margin-left:20px;">
									<button 
										onclick="iframe_show_detail_click_order_num('<%=order_list.get(i).getOrder_num() %>')"
										style="outline:none;padding:0px;margin:0px;border:1px dotted #e2e2e2;border-radius:5px;">
										상세보기</button>
									<button 
										onclick="iframe_show_detail_comment_click_order_num('<%=order_list.get(i).getOrder_num() %>')"
										style="outline:none;padding:0px;margin:0px;border:1px dotted #e2e2e2;border-radius:5px;">
										판매자 문의</button>
									
								</div>
							</div>
							<div style="height:1px;border-top:1px dotted #ffffff;"></div>
						<%
					} %>
					
				</div>
				<div id="board_list" style="display:none;">
					<%
					if(my_board_list.size()==0){
						%>
						없습니다
						<%
					}
					%>
					<%for(int i = 0 ; i < my_board_list.size() ; i ++){
						%>
						<div style="width:550px;border-bottom:1px dotted white;font-size:14pt;
						margin-left:20px;padding:10px;margin-top:15px;margin-bottom:15px;">
							<div>
								<%=my_board_list.get(i).getTime() %> / 
								<%=my_board_list.get(i).getBoard_num() %> /  
								<%=my_board_list.get(i).getCategori() %> / 	
								<a href="<%=ManagerStaticAttribute.buyerUrl%>/test_showboard?focus=<%=my_board_list.get(i).getBoard_num()%>">
									<button style="underline:none;border:1px solid #e2e2e2;border-radius:5px;">보러가기 ☞</button>
								</a>
							</div>
							<div>
								제목 : <%=my_board_list.get(i).getTitle() %>
							</div>
							<div style="font-size:10pt;color:black;">
								<span style="color:red;">♥</span> 
								<span><%=my_board_list.get(i).getRecommend() %> : 명</span>
								
								<span style="padding-left:10px;">댓글 :</span> 
								<span><%=my_board_list.get(i).getReply().size() %>명</span>
								
								<span style="padding-left:10px;">조회수 :</span> 
								<span><%=my_board_list.get(i).getSeecount() %>명</span> 
							</div>
						</div>
						<%	
					} %>
					
				</div>
				<div id="myinfo" style="display:none;">
					<div style="width:550px;font-size:14pt;
						margin-left:20px;padding:10px;margin-top:15px;margin-bottom:15px;">
						<span style="font-size:20pt;">회원정보</span>
						<div 
							style="margin-top:5px;margin-bottom:5px;
							border-bottom:1px dotted white;">
							
						</div>
						
						<div
							id="hidden_buyer_info_div" 
							style="display:none;position:absolute;background-color:white;">
							<form action="/buyer/test_myinfo_fixbuyerinfo" method="post">
								<table style="padding-left:30px;">
									<tr>
										<td style="color:green;text-align:right;width:60px;height:40px;">
											아이디
										</td>
										<td style="width:400px;">
											<span style="padding-left:10px;">
												<%=b.getId() %>
											</span>
										</td>
									</tr>
									<tr>
										<td style="color:green;text-align:right;width:60px;height:40px;">
											비밀번호
										</td>
										<td style="width:400px;">
											<input 
												value="<%=b.getPw() %>"
												style="width:200px;" type="text" name="pw">
										</td>
									</tr>
									<tr>
										<td style="color:green;text-align:right;width:60px;height:40px;">
											생년월일
										</td>
										<td style="width:400px;">
											<input value="<%=b.getBirth() %>"
												style="width:200px;" type="text" name="birth">
										</td>
									</tr>
									<tr>
										<td style="color:green;text-align:right;width:60px;height:40px;">
											핸드폰 
										</td>
										<td style="width:400px;">
											<input
												value="<%=b.getPhone() %>"  
												style="width:200px;"type="text" name="phone">
										</td>
									</tr>
									<tr>
										<td style="color:green;text-align:right;width:60px;height:40px;">
											주소:
										</td>
										<td style="width:400px;">
											<input 
												value="<%=b.getAdress() %>"
												style="width:200px;" type="text" name="address">
										</td>
									</tr>
									<tr>
										<td style="color:green;text-align:right;width:60px;height:40px;">
											메일:
										</td>
										<td style="width:400px;">
											<input
												value="<%=b.getMail() %>" 
												style="width:200px;" type="text" name="mail">
										</td>
									</tr>
								</table>
								<div style="position:absolute;text-align:right;">
									<button 
										style="cursor:pointer;outline:none;
										marigin-left:200px;margin-top:5px;
										border:1px dotted #e2e2e2;border-radius:5px;">수정하기</button>
								</div>
							</form>
						</div>
						
						
						<div style="margin-top:10px;">
							<table style="padding-left:30px;">
								<tr>
									<td style="color:green;text-align:right;width:60px;height:40px;">
										아이디
									</td>
									<td style="width:400px;">
										<span style="padding-left:10px;">
											<%=b.getId() %>
										</span>
									</td>
								</tr>
								<tr>
									<td style="color:green;text-align:right;width:60px;height:40px;">
										비밀번호
									</td>
									<td style="width:400px;">
										<span style="padding-left:10px;">
											<%=b.getPw() %>
										</span>
									</td>
								</tr>
								<tr>
									<td style="color:green;text-align:right;width:60px;height:40px;">
										생년월일
									</td>
									<td style="width:400px;">
										<span style="padding-left:10px;">
											<%=b.getBirth() %>
										</span>
									</td>
								</tr>
								<tr>
									<td style="color:green;text-align:right;width:60px;height:40px;">
										핸드폰 
									</td>
									<td style="width:400px;">
										<span style="padding-left:10px;">
											<%=b.getPhone() %>
										</span>
									</td>
								</tr>
								<tr>
									<td style="color:green;text-align:right;width:60px;height:40px;">
										주소:
									</td>
									<td style="width:400px;">
										<span style="padding-left:10px;">
											<%=b.getAdress() %>
										</span>
									</td>
								</tr>
								<tr>
									<td style="color:green;text-align:right;width:60px;height:40px;">
										메일:
									</td>
									<td style="width:400px;">
										<span style="padding-left:10px;">
											<%=b.getMail() %>
										</span>
									</td>
								</tr>
							</table>
							<div style="text-align:left;padding-left:100px;">
								<button 
									onclick="buyer_hidden_div_open()"
									id="buyer_fix_btn"
									style="cursor:pointer;outline:none;border:1px solid #e2e2e2;border-radius:5px;">수정하기</button>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			
			<div class="main_body_footer" style="margin-top:200px;margin-left:140px;width:1000px;">
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