<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="db.JDBCConnection" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 서점 예제</title>

<style>
	h1, h3 {
		margin: 0 auto;
		text-align: center;
	}
	
	form {
		margin: 30px auto;
		text-align: center;
	}
	
		input[type='text']{
			width: 180px; height: 40px;
			margin-bottom: 15px;
			
			text-align: center;
		}
		
		input[type='submit'], input[type='reset']{
			width: 100px; height: 30px;
			padding: 0;
			
			text-align: center;
			line-height: 30px;
		}
	
	table {
		margin: 0 auto;
		text-align: center;
		
		border-collapse: collapse;
	}
	
	a {
		display: block;
		width: 300px; height: 25px;
		padding: 10px 20px;
		margin: 20px auto;
		
		background-color: #eee;
		border-radius: 10px;
		color: black;
		
		text-decoration: none;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>인터넷 프로그래머 문고</h1>
	<h3>제목을 입력하세요 </h3>
	<form method="POST">
		<input type="text" name="title"><br>
		<input type="submit" value="검색">
	</form>
	
<%
	String title = request.getParameter("title");

	if(title != null) {
		
		Connection conn = null;
		try {
			String driver = application.getInitParameter("MariaDBDriver");
			String url = application.getInitParameter("BookURL");
			String DBid = application.getInitParameter("MariaDBId");
			String DBpasswd = application.getInitParameter("MariaDBPasswd");
			
			JDBCConnection jdbc = new JDBCConnection(driver, url, DBid, DBpasswd);
			conn = jdbc.conn;
		} catch(Exception e) {
			out.println("데이터베이스 접속에 문제가 발생했습니다.<hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM books WHERE title LIKE '%" + title + "%'";
		sql += "ORDER BY title ASC";
		
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("검색 완료");
%>
	<hr>
	<form method="POST" action="orderproc.jsp">
		<table border=1 cellpadding=10>
			<tr>
				<th>주문</th>
				<th>저자</th>
				<th>제목</th>
				<th>가격</th>
				<th>남아있는 수량</th>
			</tr>
			<%
				while(rs.next()) {
					int id = rs.getInt("id");
				
			%>
			<tr>
				<td><input type="checkbox" name="id" value="<%=id %>"></td>
				<td><%=rs.getString("author") %></td>
				<td><%=rs.getString("title") %></td>
				<td><%=rs.getInt("price") %></td>
				<td><%=rs.getInt("qty") %></td>
			</tr>
			<% } %>
		</table>
		<br>
		<input type="submit" value="주문">
		<input type="reset" value="초기화">
	</form>
	<a href="<%=request.getRequestURI() %>"><h3>다시 주문하기</h3></a>
<%			
		rs.close();
		stmt.close();
		conn.close();
	}
%>

	<a href="index.jsp"><h3>돌아가기</h3></a>
</body>
</html>