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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="import" href="http://www.naver.com">
<style>

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="ibody" >
		<!-- header -->
		<div id="myheader">
			<div id="header_top_div">
				<div style="height:20px;text-align:right;padding:2px;">
					<a href="#"><span class="header_top_span" >로그인</span></a>
					<a href="#"><span class="header_top_span" >회원가입</span></a>
					<a href="#"><span class="header_top_span" >내정보</span></a>
					<a href="#"><span class="header_top_span" >1:1문의</span></a>
				</div>
			</div>
			<div id="header_center_div">
				<table id="header_center_table">
					<tr>
						<td style="width:100px;height:30px;border:1px red solid;">
							logo
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
						<td id="main_table_left" >
							<div id="body_left_div">
								<div id="categori_title">
									판매 카테고리
								</div>
								<div id="categori_show">
									<table>
										<tr>
											<td>
												<a href="#">book</a>
											</td>
										</tr>
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
									</table>
								</div>
								<div id="categori_title">
									메뉴
								</div>
								<div id="categori_show">
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
								<div style="float:left;">
										왼쪽
								</div>
								<div style="float:left;width:300px;text-align:center;">
									
								</div>
								<div style="float:left;width:300px;text-align:center;">
									
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