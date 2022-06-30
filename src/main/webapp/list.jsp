<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.JDBCConnection" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
	* { padding: 0; margin: 0; }
	
	h3 {
		text-align: center;
		margin: 20px 0;
	}
	
	table {
		margin: 0 auto;
		border-collapse: collapse;
	}
	
	table a {
		color: #56BCCB;
	}
		table a:visited {
			color: #444;
			font-weight: bold;
		}
		
		td, th {
			padding: 3px 8px;
			
			text-align: center;
		}
		th { background-color: #eee; }
		
	.aArea { text-align: center; margin: 0 auto; }
	.aArea > a {
		width: 130px; height: 25px; 
		padding: 5px 0;
		margin: 20px auto;
		
		display: inline-block;
		
		color: white;
		background-color: #56BCCB;
		border-radius: 5px;
		
		text-align: center;
		text-decoration: none;
		line-height: 25px;
	} 
</style>
</head>
<body>
	<h3>게시판 리스트</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>이메일</th>
		</tr>
	<%
		Connection conn = null;
		Statement stmt = null;
		
		try {
			String driver = application.getInitParameter("MariaDBDriver");
			String url = application.getInitParameter("BoardURL");
			String id = application.getInitParameter("MariaDBId");
			String passwd = application.getInitParameter("MariaDBPasswd");
			
			JDBCConnection jdbc = new JDBCConnection(driver, url, id, passwd);
			conn = jdbc.conn;
		} catch(Exception e) {
			out.println("데이터베이스 접속에 문제가 발생했습니다.<hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		
		stmt = conn.createStatement();
		String sql = "SELECT * FROM message ORDER BY id ASC";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs != null){
			while(rs.next()) {
				int id = Integer.parseInt(rs.getString("id"));
	%>
		<tr>
			<td><%=id %></td>
			<td><a href="display.jsp?id=<%=id %>"><%=rs.getString("subject") %></a></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("time") %></td>
			<td><%=rs.getString("email") %></td>
		</tr>
	<%
			}
			rs.close();
		}
	%>
	</table>
	<div class="aArea">
	<% if ( (int) session.getAttribute("level") > 2){ %>
		<a href="write.jsp">게시글 쓰기</a>
	<% } %>
		<a href="index.jsp">돌아가기</a>
	</div>
	<%
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	%>
</body>
</html>