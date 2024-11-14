<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<%
	User user = (User)session.getAttribute(Session.USERINFO);
	if(user == null){
		response.sendRedirect(Page.MAIN);
	}
	%>
	<fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE) %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="<%=Page.NAVBAR %>"/>
	<h2><fmt:message key="<%=Page.MY %>"/></h2>

	<p><fmt:message key="id"/> : <%=user.getUserId() %></p>
	<p><fmt:message key="nickname"/> : <%=user.getUserNickname() %>
	<!-- 작성한 글 -->
	<!-- 회원 탈퇴 -->
	
	<jsp:include page="<%=Page.FOOTER %>"/>
	</fmt:bundle>
</body>
</html>