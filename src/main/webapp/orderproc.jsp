<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="db.JDBCConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 처리 화면</title>
<style>
	h1, h2 {
		text-align: center;
	}
	
	table {
		margin: 0 auto;
		text-align: center;
		
		border-collapse: collapse;
	}
		th { background-color: #eee; }
		
	a {
		display: block;
		width: 200px; height: 25px;
		padding: 10px 20px;
		margin: 20px auto;
		
		background-color: #56BCCB;
		border-radius: 10px;
		color: white;
		
		text-decoration: none;
		text-align: center;
	}
		a > h4 { line-height: 25px; margin: 0; padding: 0; }
</style>
</head>
<body>
	<h1>인터넷 프로그래머 서점</h1>
	<h2>주문해주셔서 감사합니다.</h2>
	
	<%
		String[] ids = request.getParameterValues("id");
	
		if(ids != null) {
			
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
			
			String sql;
			int recordUpdated;
			ResultSet rs;
			
			System.out.println("연결 완료");
	%>
		<table border=1 cellpadding=5>
			<tr>
				<th>저자</th>
				<th>제목</th>
				<th>가격</th>
				<th>수량</th>
			</tr>
	<%
		for(int i = 0; i < ids.length; i++)
		{
			sql = "UPDATE books SET qty=qty-1 WHERE id=" + ids[i];
			recordUpdated = stmt.executeUpdate(sql);
			sql = "SELECT * FROM books WHERE id=" + ids[i];
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
	%>
			<tr>
				<td><%=rs.getString("author") %></td>
				<td><%=rs.getString("title") %></td>
				<td><%=rs.getInt("price") %></td>
				<td><%=rs.getInt("qty") %></td>
			</tr>
	<%
			}
			rs.close();
		}
			stmt.close();
			conn.close();
		}
	%>
		</table>
		<a href="order.jsp"><h4>주문 화면으로 돌아가기</h4></a>
</body>
</html>