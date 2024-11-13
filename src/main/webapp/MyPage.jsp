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
	User user = (User)session.getAttribute("UserInfo");
	%>
	<fmt:setLocale value='<%=session.getAttribute("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="Navbar.jsp"/>
	<h2><fmt:message key="myPage"/></h2>

	<p><fmt:message key="id"/> : <%=user.getUserId() %></p>
	<p><fmt:message key="nickname"/> : <%=user.getUserNickname() %>
	<!-- 작성한 글 -->
	
	<jsp:include page="Footer.jsp"/>
	</fmt:bundle>
</body>
</html>