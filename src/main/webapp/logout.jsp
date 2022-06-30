<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
	<title>로그아웃</title>
	
	<style>
		h3 { text-align: center; }
	</style>
</head>
<body>
	<h3>로그아웃 되었습니다.</h3>
	
	<script>
		setTimeout(() => {
			location.href="index.jsp";	
		}, 1500);
	</script>

</body>
</html>