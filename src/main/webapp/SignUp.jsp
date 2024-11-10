<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="Navbar.jsp"/>
	
	<form id="signupForm" method="post" action="SignUp_process.jsp">
	    <label><fmt:message key="id"/> : <input id="id" name="id" type="text"></label><br>
        <label><fmt:message key="password"/> : <input id="passwd" name="passwd" type="password"></label><br>
        <label><fmt:message key="passwordCheck"/> : <input id="passwdCheck" name="passwdCheck" type="password"></label><br>
        <input id="signup" type="button" value='<fmt:message key="signUp"/>' onclick="validate()">
    </form>
    
    <jsp:include page="Footer.jsp"/>
    </fmt:bundle>
</body>
</html>