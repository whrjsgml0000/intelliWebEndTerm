<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
	<jsp:include page="Navbar.jsp"/>
	
	<h2>회원가입 성공</h2>
	<%
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
	%>
	<a href="MainPage.jsp">메인으로 돌아가기</a>
	
	<jsp:include page="Footer.jsp"/>
	
</body>
</html>