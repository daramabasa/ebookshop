<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력</title>

<style>

	h3, form { text-align: center; margin: 10px auto; }
	
	table {
		text-align: center; margin: 0 auto;
		border-collapse: collapse;
	}
	
		table input, table textarea {
			width: 430px;
			
			border: none;
			text-decoration: none;
		}
		table input { height: 25px; }
		
		table input:focus, table textarea:focus {
			outline: none;
		}
			tr td:first-of-type {
				background-color: #eee;
				text-align: left;
				padding: 5px 7px;
			}
	input[type='submit'], input[type='reset'] {
		width: 180px; height: 30px;
	}
	
	a {
		display: block;
		
		text-align: center;
		font-size: small;
		color: black;
	}

</style>
</head>
<body>
	<h3>게시글 입력 화면</h3>
	<form action="insert.jsp" method="POST">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" size="60"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" size="60" readonly="readonly" value="<%=name %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="memo" cols="53" rows="5"></textarea></td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="게시글 등록">
		<input type="reset" value="다시 쓰기">
	</form>
	
	<a href="list.jsp">게시글 목록 보기</a>
	<br>
</body>
</html>