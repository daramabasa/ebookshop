<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 표시</title>
</head>
<body>
	<h3>게시글 내용</h3>
<%
	String subject = "", memo = "", name = "", time = "", email = "";
	int id = Integer.parseInt(request.getParameter("id"));
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board", "java", "java");
	} catch(Exception e) {
		out.println("데이터베이스 접속에 문제가 발생했습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	stmt = conn.createStatement();
	String sql = "SELECT * FROM message WHERE id=" + id;
	rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		subject = rs.getString("subject");
		memo = rs.getString("memo");
		name = rs.getString("name");
		time = rs.getString("time");
		email = rs.getString("email");
	}
%>
	<table border="2">
		<tr>
			<td>제목</td>
			<td><%=subject %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=memo %></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=time %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email %></td>
		</tr>
	</table>
	<br><br>
	<a href="list.jsp">게시글 목록 보기</a>
</body>
</html>