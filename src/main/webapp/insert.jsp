<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="java.text.* " %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 상황</title>
</head>
<body>
<%
	String name, email, subject, memo, time;
	name = request.getParameter("name");
	email = request.getParameter("email");
	subject = request.getParameter("subject");
	memo = request.getParameter("memo");
	time = request.getParameter("time");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board", "java", "java");
	} catch(Exception e) {
		out.println("데이터베이스 접속에 문제가 발생했습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	sql = "INSERT INTO message(subject, name, time, memo, email) VALUES(?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, subject);
	pstmt.setString(2, name);
	pstmt.setString(3, time);
	pstmt.setString(4, memo);
	pstmt.setString(5, email);
	
	try {
		pstmt.executeUpdate();
	} catch(Exception e) {
		out.println("데이터 삽입에 문제가 발생했습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
%>

	<h3>게시글이 등록되었습니다.</h3>
	<a href="list.jsp">게시글 목록 보기</a>
</body>
</html>