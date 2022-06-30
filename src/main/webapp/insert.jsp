<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="java.text.* " %>
<%@ page import="db.JDBCConnection" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 상황</title>
	<style>
		h3 { text-align: center; }
	</style>
</head>
<body>
<%
	String name, email, subject, memo, time;
	name = request.getParameter("name");
	email = request.getParameter("email");
	subject = request.getParameter("subject");
	memo = request.getParameter("memo");
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	
	time = sf.format(now);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
	try {
		String driver = application.getInitParameter("MariaDBDriver");
		String url = application.getInitParameter("BoardURL");
		String DBid = application.getInitParameter("MariaDBId");
		String DBpasswd = application.getInitParameter("MariaDBPasswd");
		
		JDBCConnection jdbc = new JDBCConnection(driver, url, DBid, DBpasswd);
		conn = jdbc.conn;
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
	<script>
		setTimeout(() => {
			location.href="list.jsp";
		}, 1500);
	</script>
</body>
</html>