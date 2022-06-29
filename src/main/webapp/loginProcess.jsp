<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String) request.getParameter("id");
	String passwd = (String) request.getParameter("passwd");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebookshop", "java", "java");
	} catch(Exception e) {
		out.println("데이터베이스 접속에 문제가 발생했습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		session.setAttribute("id", id);
		session.setAttribute("name", rs.getString("name"));
		session.setAttribute("level", rs.getInt("level"));
		
		out.println("<h5>로그인에 성공했습니다.</h5>");
		out.println("<h3>" + rs.getString("name") + "님 반갑습니다.</h3>");
	} else {
		out.println("<h5>로그인에 실패했습니다.</h5>");
	}
	
	rs.close();
	pstmt.close();
	conn.close();
%>