<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = "", name = "";
	int level = 0;
	
	if(session.getAttribute("id") != null) id = (String) session.getAttribute("id");
	if(session.getAttribute("name") != null) name = (String) session.getAttribute("name");
	if(session.getAttribute("level") != null) level = (int) session.getAttribute("level");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>

<style>

	h2, h5 {
		magin: 10px auto;
		text-align: center;
	}
	a {
		width: 150px; height: 30px; 
		padding: 5px 0;
		margin: 20px auto;
		
		display: block;
		
		color: black;
		background-color: #eee;
		border-radius: 5px;
		
		text-align: center;
		text-decoration: none;
		line-height: 30px;
	}
	
</style>

</head>
<body>
	<h2>온라인 서점 사이트</h2>
<% if (name != "") { %>
	<h5><%=name %>님 환영합니다.</h5>
<% } %>
<% if (id == "" || name == ""){ %>
	<a href="login.jsp">로그인</a>
<% } else { %>
	<a href="order.jsp">주문하기</a>
<% if (level > 1) { %>
	<a href="list.jsp">게시글 화면</a>
<% } %>
	<a href="logout.jsp">로그아웃</a>
<% } %>
</body>
</html>