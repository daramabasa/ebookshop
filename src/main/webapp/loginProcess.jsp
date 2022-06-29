<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="db.JDBCConnection" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String) request.getParameter("id");
	String passwd = (String) request.getParameter("passwd");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
	
	String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		session.setAttribute("id", id);
		session.setAttribute("name", rs.getString("name"));
		session.setAttribute("level", rs.getInt("level"));
		
		response.sendRedirect("index.jsp");
	} else {
		out.println("<h5>로그인에 실패했습니다.</h5>");
	}
	
	rs.close();
	pstmt.close();
	conn.close();
%>