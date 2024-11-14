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
    <title>로그인</title>
</head>
<body>
	<%
	if(session.getAttribute(Session.USERINFO) != null){
		response.sendRedirect(Page.MAIN);
		return;
	}
	%>
	
	<fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE) %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="<%=Page.NAVBAR %>"/>
	
    <h2><fmt:message key="logIn"/></h2>
    <form method="post" action="SignIn_process.jsp">
        <label><fmt:message key="id"/> : <input id="id" name="id" type="text" placeholder="id"></label><br>
        <label><fmt:message key="password"/> : <input id="passwd" name="passwd" type="password" placeholder="password"></label><br>
        <input id="signIn" type="submit" value='<fmt:message key="logIn"/>'>
    </form>
    
    <jsp:include page="<%=Page.FOOTER %>"/>
    </fmt:bundle>
</body>
</html>