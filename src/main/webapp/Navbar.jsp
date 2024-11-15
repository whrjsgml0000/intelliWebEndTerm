<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.entity.User"%>
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
	<%
	session.setMaxInactiveInterval(60*30);
	String language = (String) request.getParameter(Session.LANGUAGE);
	if(language !=null)
		session.setAttribute(Session.LANGUAGE, language);
	%>
	<fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE) %>'/>
	<fmt:setBundle basename="bundle.message"/>
	<header>
	    <div class="container">
	    	<a href="Set_language.jsp?language=ko">한국어</a>|<a href="Set_language.jsp?language=en">English</a>
	    	<a href="<%=Page.MAIN%>"><fmt:message key="main"/></a>
	    	<a href="<%=Page.UPLOAD%>"><fmt:message key="upload"/></a>
	    	<%
	    	User user = (User)session.getAttribute(Session.USERINFO);
	    	if(user == null){
	    	%>
	        <a href="<%=Page.SIGNIN%>"><fmt:message key="logIn"/></a>
	        <a href="<%=Page.SIGNUP%>"><fmt:message key="signUp"/></a>
	        <%
	        return;
	        } 
	        %>
	        <a href="<%=Page.LOGOUT%>"><fmt:message key="logOut"/></a>
	        <a href="<%=Page.MY%>"><fmt:message key="myPage"/></a>
	    </div>
    </header>
</body>
</html>