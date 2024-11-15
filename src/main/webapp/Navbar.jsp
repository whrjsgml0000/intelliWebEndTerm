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
	    		<a href="<%=Page.MAIN%>"><svg xmlns="http://www.w3.org/2000/svg" 
	    		width="32" height="32" fill="currentColor" class="bi bi-clipboard-fill" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-5 
  				0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm-2 0h1v1A2.5 2.5 0 0 0 6.5 
  				5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
				</svg></a>
	    		<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
			    	<li><a href="Set_language.jsp?language=ko" class="nav-link px-2 text-white">한국어</a></li>
			    	<li><a href="Set_language.jsp?language=en" class="nav-link px-2 text-white">English</a></li>
			    	<li><a href="<%=Page.BOARD%>" class="nav-link px-2 text-white"><fmt:message key="board"/></a></li>
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