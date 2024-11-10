<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
</head>
<body>
	<jsp:include page="Navbar.jsp"/>
	
	<form id="signupForm" method="post" action="SignUp_process.jsp">
	    <label>아이디 : <input id="id" name="id" type="text"></label><br>
        <label>비밀번호 : <input id="passwd" name="passwd" type="password"></label><br>
        <label>비밀번호 확인 : <input id="passwdCheck" name="passwdCheck" type="password"></label><br>
        <input id="signup" type="button" value="회원가입" onclick="validate()">
    </form>
    
    <jsp:include page="Footer.jsp"/>
    
    <script src="resources/javascript/signup.js"></script>
</body>
</html>