<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 처리 화면</title>
</head>
<body>
	<h1>인터넷 프로그래머 서점</h1>
	<h2>주문해주셔서 감사합니다.</h2>
	
	<%
		String[] ids = request.getParameterValues("id");
	
		if(ids != null) {
			
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebookshop", "java", "java");
			Statement stmt = conn.createStatement();
			
			String sql;
			int recordUpdated;
			ResultSet rs;
			
			System.out.println("연결 완료");
	%>
		<table border=2>
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
		<a href="order.jsp"><h3>주문 화면으로 돌아가기</h3></a>
</body>
</html>