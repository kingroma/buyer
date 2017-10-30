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


$(document).ready(function(){
	//header
	$('#header_top_table_td_span6').click(function(){
		if($('#saw_product_div').css("display")=="none"){
			$('#saw_product_div').fadeIn(500);
		}
		else if($('#saw_product_div').css("display")=="block"){
			$('#saw_product_div').fadeOut(400);
		}
	});
	//header-top
	
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
	
	//header_hidden search
	
	//header
	
	//body
	
	
	//new_product_img
	setTimeout(function(){
		$('#new_product0').fadeIn(500);
	},50);
	setTimeout(function(){
		$('#new_product1').fadeIn(500);
	},50*3);
	setTimeout(function(){
		$('#new_product2').fadeIn(500);
	},50*5);
	setTimeout(function(){
		$('#new_product3').fadeIn(500);
	},50*7);
	setTimeout(function(){
		$('#new_product4').fadeIn(500);
	},50*9);
	
	setTimeout(function(){
		$('#new_product5').fadeIn(500);
	},50*11);
	setTimeout(function(){
		$('#new_product6').fadeIn(500);
	},50*13);
	setTimeout(function(){
		$('#new_product7').fadeIn(500);
	},50*15);
	setTimeout(function(){
		$('#new_product8').fadeIn(500);
	},50*17);
	setTimeout(function(){
		$('#new_product9').fadeIn(500);
	},50*19);
	
	setTimeout(function(){
		$('#new_board0').fadeIn(500);
	},50*21);
	setTimeout(function(){
		$('#new_board1').fadeIn(500);
	},50*23);
	setTimeout(function(){
		$('#new_board2').fadeIn(500);
	},50*25);
	setTimeout(function(){
		$('#new_board3').fadeIn(500);
	},50*27);
	setTimeout(function(){
		$('#new_board4').fadeIn(500);
	},50*29);
	
	setTimeout(function(){
		$('#new_board5').fadeIn(500);
	},50*31);
	setTimeout(function(){
		$('#new_board6').fadeIn(500);
	},50*33);
	setTimeout(function(){
		$('#new_board7').fadeIn(500);
	},50*35);
	setTimeout(function(){
		$('#new_board8').fadeIn(500);
	},50*37);
	setTimeout(function(){
		$('#new_board9').fadeIn(500);
	},50*39);
	//newproduct_img
	//body

	setTimeout(function(){
		$('#see_count_board0').fadeIn(500);
	},50);
	setTimeout(function(){
		$('#see_count_board1').fadeIn(500);
	},50*3);
	setTimeout(function(){
		$('#see_count_board2').fadeIn(500);
	},50*5);
	setTimeout(function(){
		$('#see_count_board3').fadeIn(500);
	},50*7);
	setTimeout(function(){
		$('#see_count_board4').fadeIn(500);
	},50*9);
	setTimeout(function(){
		$('#recommend_board0').fadeIn(500);
	},50);
	setTimeout(function(){
		$('#recommend_board1').fadeIn(500);
	},50*3);
	setTimeout(function(){
		$('#recommend_board2').fadeIn(500);
	},50*5);
	setTimeout(function(){
		$('#recommend_board3').fadeIn(500);
	},50*7);
	setTimeout(function(){
		$('#recommend_board4').fadeIn(500);
	},50*9);
		
	
});

function initHidden(){
	
	$('#hidden_header_top_search_div').fadeOut(300);
	$('#hidden_opacity_gray').fadeOut(300);
	$('#hidden_login_div').fadeOut(300);
	
	$('.header_top_table_td').fadeIn(300);
	$('#hidden_opacity_gray').fadeOut(200);
	
	$('#hidden_id_mypage').fadeOut(100);
	$('#hidden_id_logout').fadeOut(100);
	
}

//hidden_header_top_search_div

</script>

</head>
<body>

	<div class="ibody">
		
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
							<div id="saw_product_div" style="margin-left:260px;margin-top:25px;display:none;padding-left:10px;padding-right:20px;position:fixed;background-color:#e2e2e2;">
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
			
			<div class="main_body_header" style="margin-left:140px;width:1000p;">
			
				<div>
					<span style="font-size:9pt;">최신 상품</span>
				</div>
			
				<%
				ArrayList<Product> new_product = null;
				if(request.getAttribute("new_product")!=null){
					new_product = (ArrayList<Product>)request.getAttribute("new_product");
				}
				if(request.getAttribute("new_product")!=null){
				%> 
				<div class="main_body_header_new_product" style="width:1000px;height:400px;">
					<div>
						
					</div>
					
					<div style="width:1000px;">
						<%for(int i = 0 ; i < 5 ; i ++){ %>
						<a href="/buyer/test_showproduct?focus=<%=new_product.get(i).getProduct_num() %>" style="width:180;height:180px;">
							<img id="new_product<%=i%>"
							title="[<%=new_product.get(i).getProduct_num() %>]][<%=new_product.get(i).getCategori() %>] <%=new_product.get(i).getTitle() %>" 
							style="border-radius:15px;display:none;width:180px;height:180px;margin-left:10px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=new_product.get(i).getProduct_num()%>/<%=new_product.get(i).getFile_name()%>">
						</a>
						<%} %>
					</div>
					<div style="margin-top:10px;"></div>
					<div style="width:1000px;">
					
						<%for(int i = 5 ; i < 10 ; i ++){ %>
						<a href="/buyer/test_showproduct?focus=<%=new_product.get(i).getProduct_num() %>">
							<img id="new_product<%=i%>"
							title="[<%=new_product.get(i).getProduct_num() %>]][<%=new_product.get(i).getCategori() %>] <%=new_product.get(i).getTitle() %>" 
							style="border-radius:15px;display:none;;width:180px;height:180px;margin-left:10px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=new_product.get(i).getProduct_num()%>/<%=new_product.get(i).getFile_name()%>">
						</a>
						<%}
					} %>
					</div>
				</div>
				<div style="width:1000px;border-top:1px solid #e2e2e2;margin-top:10px;">
				</div>
				<div>
					<span style="font-size:9pt;margin-top:20px;">최신 게시물</span>
				</div>
				<div class="main_body_header_new_board" style="width:1000px;height:400px;">
				<%
				ArrayList<Board> new_board = null;
				if(request.getAttribute("new_board")!=null){
					new_board = (ArrayList<Board>)request.getAttribute("new_board");
				}
				if(request.getAttribute("new_board")!=null){
				%>
					<div>
					
					</div>
					<div style="width:1000px;">
					<%for(int i = 0 ; i < 5 ; i ++){ %>
						<div style="float:left;width:180px;height:180px;margin-left:13px;">
						<a href="/buyer/test_showboard?focus=<%=new_board.get(i).getBoard_num() %>">
							<%if(new_board.get(i).getFile_name()==null|new_board.get(i).getFile_name().equals("")){%>
							
							<span title="[<%=new_board.get(i).getBoard_num() %>]][<%=new_board.get(i).getCategori() %>] <%=new_board.get(i).getTitle() %>"
							id="new_board<%=i%>"style="display:none;padding:5px;font-size:18pt;"><%=new_board.get(i).getTitle() %></span>
							
							<%//System.out.println("boardfile:"+new_board.get(i).getFile_name()); %>	
							<%//System.out.println("boardpath:"+new_board.get(i).getFile_path()); %>	
							<%} else{
								//System.out.println("boardfile:"+new_board.get(i).getFile_name());
							%>
							<img id="new_board<%=i%>"
							title="[<%=new_board.get(i).getBoard_num() %>]][<%=new_board.get(i).getCategori() %>] <%=new_board.get(i).getTitle() %>" 
							style="border-radius:15px;display:none;width:180px;height:180px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/board/<%=new_board.get(i).getBoard_num()%>/<%=new_board.get(i).getFile_name()%>">
								
							<%} %>
							<!-- 
							<img id="new_product<%=i%>"
							title="[<%=new_product.get(i).getProduct_num() %>]][<%=new_product.get(i).getCategori() %>] <%=new_product.get(i).getTitle() %>" 
							style="display:none;width:180px;height:180px;margin-left:10px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=new_product.get(i).getProduct_num()%>/<%=new_product.get(i).getFile_name()%>">
							 -->
							
						</a>
						</div>
					<%} %>
					</div>
					<div style="clear:both;"></div>
					<div style="margin-top:20px;">
					</div>
					
					<div style="width:1000px;">
					<%for(int i = 5 ; i < 10 ; i ++){ %>
						<div style="float:left;width:180px;height:180px;margin-left:13px;">
						<a href="/buyer/test_showboard?focus=<%=new_board.get(i).getBoard_num() %>">
							<%if(new_board.get(i).getFile_name()==null|new_board.get(i).getFile_name().equals("")){%>
							
							<span title="[<%=new_board.get(i).getBoard_num() %>]][<%=new_board.get(i).getCategori() %>] <%=new_board.get(i).getTitle() %>" 
							id="new_board<%=i%>"style="display:none;padding:5px;font-size:18pt;"><%=new_board.get(i).getTitle() %></span>
							
							<%//System.out.println("boardfile:"+new_board.get(i).getFile_name()); %>	
							<%//System.out.println("boardpath:"+new_board.get(i).getFile_path()); %>	
							<%} else{
								//System.out.println("boardfile:"+new_board.get(i).getFile_name());
							%>
							<img id="new_board<%=i%>"
							title="[<%=new_board.get(i).getBoard_num() %>]][<%=new_board.get(i).getCategori() %>] <%=new_board.get(i).getTitle() %>" 
							style="border-radius:15px;display:none;width:180px;height:180px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/board/<%=new_board.get(i).getBoard_num()%>/<%=new_board.get(i).getFile_name()%>">
								
							<%} %>
							<!-- 
							<img id="new_product<%=i%>"
							title="[<%=new_product.get(i).getProduct_num() %>]][<%=new_product.get(i).getCategori() %>] <%=new_product.get(i).getTitle() %>" 
							style="display:none;width:180px;height:180px;margin-left:10px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=new_product.get(i).getProduct_num()%>/<%=new_product.get(i).getFile_name()%>">
							 -->
							
						</a>
						</div>
					<%}} %>
					</div>
					<div style="clear:both;">
					</div>
					<div style="border-top:1px solid #e2e2e2;margin-top:20px;">
					</div>
				</div>
				
			</div>
			<div>
			
			</div>
			<div class="main_body_body" style="margin-left:140px;width:1000px;">
			<%
				ArrayList<Board> see_count_board = (ArrayList<Board>)request.getAttribute("see_count_board");
				if(see_count_board!=null){}
			%>
				<div style="padding-top:20px;">
					<span style="font-size:9pt;margin-top:20px;">조회수 베스트 게시판</span>
				</div>
				<div style="width:1000px;">
					<%for(int i = 0 ; i < see_count_board.size() ; i ++){ %>
						<div style="float:left;width:180px;height:180px;margin-left:13px;">
						<a href="/buyer/test_showboard?focus=<%=see_count_board.get(i).getBoard_num() %>">
							<%if(see_count_board.get(i).getFile_name()==null|see_count_board.get(i).getFile_name().equals("")){%>
							
							<span 
							title="[<%=see_count_board.get(i).getBoard_num() %>]][<%=see_count_board.get(i).getCategori() %>] <%=see_count_board.get(i).getTitle() %>"
							id="see_count_board<%=i%>"style="display:none;padding:5px;font-size:18pt;"><%=see_count_board.get(i).getTitle() %></span>
							
							<%//System.out.println("boardfile:"+new_board.get(i).getFile_name()); %>	
							<%//System.out.println("boardpath:"+new_board.get(i).getFile_path()); %>	
							<%} else{
								//System.out.println("boardfile:"+new_board.get(i).getFile_name());
							%>
							<img id="see_count_board<%=i%>"
							title="[<%=see_count_board.get(i).getBoard_num() %>]][<%=see_count_board.get(i).getCategori() %>] <%=see_count_board.get(i).getTitle() %>" 
							style="border-radius:15px;display:none;width:180px;height:180px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/board/<%=see_count_board.get(i).getBoard_num()%>/<%=see_count_board.get(i).getFile_name()%>">
								
							<%} %>
							<!-- 
							<img id="new_product<%=i%>"
							title="[<%=new_product.get(i).getProduct_num() %>]][<%=new_product.get(i).getCategori() %>] <%=new_product.get(i).getTitle() %>" 
							style="display:none;width:180px;height:180px;margin-left:10px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=new_product.get(i).getProduct_num()%>/<%=new_product.get(i).getFile_name()%>">
							 -->
							
						</a>
						</div>
					<%} %>
				</div>
				
				<%
				ArrayList<Board> recommend_board = (ArrayList<Board>)request.getAttribute("recommend_board");
				if(recommend_board!=null){}
				%>
				<div style="clear:both"></div>
				<div style="padding-top:20px;">
					<span  style="font-size:9pt;margin-top:20px;">추천수 베스트 게시판</span>
				</div>
				<div style="width:1000px;">
					<%for(int i = 0 ; i < recommend_board.size() ; i ++){ %>
						<div style="float:left;width:180px;height:180px;margin-left:13px;">
						<a href="/buyer/test_showboard?focus=<%=recommend_board.get(i).getBoard_num() %>">
							<%if(recommend_board.get(i).getFile_name()==null|recommend_board.get(i).getFile_name().equals("")){%>
							
							<span title="[<%=recommend_board.get(i).getBoard_num() %>]][<%=recommend_board.get(i).getCategori() %>] <%=recommend_board.get(i).getTitle() %>" 
							id="recommend_board<%=i%>"style="display:none;padding:5px;font-size:18pt;"><%=see_count_board.get(i).getTitle() %></span>
							
							<%//System.out.println("boardfile:"+new_board.get(i).getFile_name()); %>	
							<%//System.out.println("boardpath:"+new_board.get(i).getFile_path()); %>	
							<%} else{
								//System.out.println("boardfile:"+new_board.get(i).getFile_name());
							%>
							<img id="recommend_board<%=i%>"
							title="[<%=recommend_board.get(i).getBoard_num() %>]][<%=recommend_board.get(i).getCategori() %>] <%=recommend_board.get(i).getTitle() %>" 
							style="border-radius:15px;display:none;width:180px;height:180px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/board/<%=recommend_board.get(i).getBoard_num()%>/<%=recommend_board.get(i).getFile_name()%>">
								
							<%} %>
							<!-- 
							<img id="new_product<%=i%>"
							title="[<%=new_product.get(i).getProduct_num() %>]][<%=new_product.get(i).getCategori() %>] <%=new_product.get(i).getTitle() %>" 
							style="display:none;width:180px;height:180px;margin-left:10px;" 
							src="<%=ManagerStaticAttribute.dataUrl%>/product/<%=new_product.get(i).getProduct_num()%>/<%=new_product.get(i).getFile_name()%>">
							 -->
							
						</a>
						</div>
					<%} %>
				</div>
				<div>
				
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
			<div style="width:1000px;margin-left:140px;height:200px;">
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
					<!-- [1조] 이정헌 / 박동준 / 김정진 -->
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