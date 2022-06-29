<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>

<style>

	form {
		width: 300px;
		margin: 0 auto;
		
		text-align: center;
	}
		
		label {
			width: 100px;
			
			float: left;
			text-align: left;
		}
		
		input[type='text'], input[type='password'] {
			width: 140px; height: 15px;
			padding: 5px 5px;
		}
			
			input[type='submit'], input[type='reset'] {
				width: 100px; height: 30px;
				
				text-align: center;
			}
			
	a {
		display: block;
		width: 200px; height: 25px;
		padding: 10px 20px;
		margin: 20px auto;
		
		background-color: #eee;
		border-radius: 10px;
		color: black;
		
		text-decoration: none;
		text-align: center;
	}
		h6 { margin: 0; line-height: 25px; }
			
</style>
</head>
<body>
	<form action="joinProcess.jsp" method="POST">
		<fieldset>
		<legend>회원가입</legend>
			<label for="id">아이디 </label>
			<input type="text" name="id" id="id" placeholder="id"><br>
			<label for="passwd">비밀번호 </label>
			<input type="password" name="passwd" id="passwd" placeholder="password"><br>
			<label for="name">이름 </label>
			<input type="text" name="name" id="name" placeholder="name"><br>
			<br><br>
			<input type="submit" value="회원가입">
			<input type="reset" value="초기화하기">
		</fieldset>
	</form>
	<br>
	<a href="login.jsp"><h6>로그인 화면으로 이동</h6></a>
</body>
</html>