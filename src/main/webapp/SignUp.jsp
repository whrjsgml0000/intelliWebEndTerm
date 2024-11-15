<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <title>회원가입</title>
</head>
<body>
	<fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE) %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="<%=Page.NAVBAR %>"/>
	<div class="container">
		<div class="row g-5">
			<h2><fmt:message key="signUp"/></h2>
			
			<form id="signupForm" method="post" action="SignUp_process.jsp">
			    <label><fmt:message key="id"/> : <input id="id" name="id" type="text" maxlength="20" class="form-control"></label><br>
		        <label><fmt:message key="password"/> : <input id="passwd" name="passwd" type="password" maxlength="20" class="form-control"></label><br>
		        <label><fmt:message key="passwordCheck"/> : <input id="passwdCheck" name="passwdCheck" type="password" maxlength="20" class="form-control"></label><br>
		        <label><fmt:message key="nickname"/> : <input id="nickname" name="nickname" type="text" maxlength="20" class="form-control"></label><br>
		        <input id="signup" type="button" value='<fmt:message key="signUp"/>' onclick="validate()">
		    </form>
	    </div>
    </div>
    <jsp:include page="<%=Page.FOOTER %>"/>
    </fmt:bundle>
    <script src="resources/javascript/signup.js"></script>
</body>
</html>