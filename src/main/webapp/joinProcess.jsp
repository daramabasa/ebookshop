<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String) request.getParameter("id");
	String passwd = (String) request.getParameter("passwd");
	String name = (String) request.getParameter("name");
	int level = 1;

	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultNum;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebookshop", "java", "java");
	} catch(Exception e) {
		out.println("데이터베이스 접속에 문제가 발생했습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	String sql = "INSERT INTO member VALUES(?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	pstmt.setString(3, name);
	pstmt.setInt(4, level);
	
	resultNum = pstmt.executeUpdate();
	
	if(resultNum > 0) {
		System.out.println("회원가입에 성공했습니다.");
		response.sendRedirect("login.jsp");
	} else {
		System.out.println("회원가입에 실패했습니다.");
		response.sendRedirect("join.jsp");
	}
	
	pstmt.close();
	conn.close();
%>