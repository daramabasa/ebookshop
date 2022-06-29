<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
	<form action="joinProcess.jsp" method="POST">
		<label for="id">아이디: </label>
		<input type="text" name="id" id="id"><br>
		<label for="passwd">비밀번호: </label>
		<input type="password" name="passwd" id="passwd"><br>
		<label for="name">이름: </label>
		<input type="text" name="name" id="name"><br>
		<br><br>
		<input type="submit" value="회원가입">
		<input type="reset" value="초기화하기">
	</form>
	<br>
	<a href="login.jsp">로그인 화면으로 이동</a>
</body>
</html>