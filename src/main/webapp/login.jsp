<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<form action="loginProcess.jsp" method="POST">
		<label for="id">아이디 </label>
		<input type="text" name="id" id="id"><br>
		<label for="passwd">비밀번호 </label>
		<input type="password" name="passwd" id="passwd"><br>
		<input type="submit" value="로그인">
	</form>
	<br>
	<a href="join.jsp">회원가입</a>
</body>
</html>