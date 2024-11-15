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
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <title>Navbar</title>
</head>
<body>
	<%
	session.setMaxInactiveInterval(60*30);
	String language = (String) request.getParameter(Session.LANGUAGE);
	if(language != null)
		session.setAttribute(Session.LANGUAGE, language);
	%>
	<fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE) %>'/>
	<fmt:setBundle basename="bundle.message"/>
	<header class="p-3 text-bg-dark">
	    <div class="container">
	    	<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	    		<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
			    	<li><a href="Set_language.jsp?language=ko" class="nav-link px-2 text-white">한국어</a></li>
			    	<li><a href="Set_language.jsp?language=en" class="nav-link px-2 text-white">English</a></li>
			    	<li><a href="<%=Page.MAIN%>" class="nav-link px-2 text-white"><fmt:message key="main"/></a></li>
			    	<li><a href="<%=Page.UPLOAD%>" class="nav-link px-2 text-white"><fmt:message key="upload"/></a></li>
			    </ul>
		    	<%
		    	User user = (User)session.getAttribute(Session.USERINFO);
		    	if(user == null){
		    	%>
		        <a href="<%=Page.SIGNIN%>" class="btn btn-outline-light me-2"><fmt:message key="logIn"/></a>
		        <a href="<%=Page.SIGNUP%>" class="btn btn-warning"><fmt:message key="signUp"/></a>
		        <%
		        } else {
		        %>
		        <a href="<%=Page.LOGOUT%>" class="btn btn-outline-light me-2"><fmt:message key="logOut"/></a>
		        <a href="<%=Page.MY%>" class="btn btn-warning"><fmt:message key="myPage"/></a>
		        <%
		        }
		        %>
	        </div>
	    </div>
    </header>
</body>
</html>