<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<style>
	form {
		margin: 0 auto;
		text-align: center;
	}
	
		input {
			width: 180px; height: 30px;
			margin-bottom: 5px;
		}
		
		input[type='submit'] {
			margin-top: 10px;
		}
	
	#aArea {
		text-align: center;
		margin: 0 auto;
	}
		a {
			margin: 0 auto;
			text-align: center;
			
			color: black;
		} 
			a > h5 { display: inline; }
</style>
</head>
<body>
	<form action="loginProcess.jsp" method="POST">
		<input type="text" name="id" id="id" placeholder="아이디"><br>
		<input type="password" name="passwd" id="passwd" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
	</form>
	<br>
	<div id="aArea">
		<a href="join.jsp"><h5>회원가입</h5></a>
		<a href="index.jsp"><h5>돌아가기</h5></a>
	</div>
</body>
</html>