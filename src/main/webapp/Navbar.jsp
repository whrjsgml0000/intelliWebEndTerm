<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:setBundle basename="bundle.message"/>
	<header>
	    <div class="container">
	    	<a href="?language=ko">한국어</a>|<a href="?language=en">English</a>
	    	<a href="MainPage.jsp"><fmt:message key="main"/></a>
	    	<a href="Upload.jsp"><fmt:message key="upload"/></a>
	        <a href="SignIn.jsp"><fmt:message key="logIn"/></a>
	        <a href="SignUp.jsp"><fmt:message key="signUp"/></a>
	        <a href="MyPage.jsp"><fmt:message key="myPage"/></a>
	    </div>
    </header>
</body>
</html>