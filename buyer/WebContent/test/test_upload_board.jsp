<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.common.Categori" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String buyer_id = (String)request.getSession().getAttribute("buyer_id");
//request.getSession().removeAttribute("buyer_id");
if(buyer_id==null)
	buyer_id="로그인";
Categori categori_list = new Categori();


%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
body{
width:600px;
height:500px;
margin:0px;
padding:0px;
overflow:hidden;
font-family: 'Nanum Pen Script', serif;
}
input{
font-family: 'Nanum Pen Script', serif;
}
</style>
</head>
<body>
<form action="/buyer/test_upload_board" enctype="multipart/form-data" method="post">
	<table style="font-size:14pt;">
		<tr>
			<td style="width:100px;text-align:center;">
				제목 : 
			</td>
			<td style="width:400px;">
				<div style="width:400px;text-align:left;margin-top:10px;">
					<input type="text" style="width:400px;" name="title">
				</div>
			</td>
		</tr>
		<tr>
			<td style="width:100px;text-align:center;margin-top:10px;">
				카테고리 : 
			</td>
			<td style="width:400px;">
				<div style="width:400px;text-align:left;margin-top:10px;">
				<%for(int i = 0 ; i < categori_list.getBoardList().size() ; i ++){%>
					<input type="radio" style="" value="<%=categori_list.getBoardList().get(i) %>" name="radio" 
					<%if(i==0){ %>checked<%} %>
						><%=categori_list.getBoardList().get(i) %>&nbsp&nbsp
					<%}%>
				</div>
			</td>
		</tr>
		<tr>
			<td style="width:100px;text-align:center;margin-top:10px;">
				파일 : 
			</td>
			<td style="width:400px;">
				<div style="width:400px;text-align:left;margin-top:10px;">
					<input type="file" style="width:200px;" name="file">
				</div>
			</td>
		</tr>
		<tr>
			<td style="width:100px;height:300px;text-align:center;margin-top:10px;">
				내용 : 
			</td>
			<td style="width:400px;">
				<div style="width:400px;text-align:left;margin-top:10px;">
					<textarea name="textarea" style="width:400px;height:200px;resize:none;"></textarea>
				</div>
			</td>
		</tr>
	</table>
	<div style="text-align:right;padding-right:50px;">
		<input type="submit" value="올리기" style="border:1px solid #e2e2e2;border-radius:5px;">
	</div>
</form>
</body>
</html>