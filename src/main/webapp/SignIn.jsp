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
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="Navbar.jsp"/>
	
    <h2><fmt:message key="logIn"/></h2>
    <form method="post" action="MainPage.jsp">
        <label><fmt:message key="id"/> : <input id="id" name="id" type="text" placeholder="id"></label><br>
        <label><fmt:message key="password"/> : <input id="passwd" name="passwd" type="password" placeholder="password"></label><br>
        <input id="signIn" type="submit" value='<fmt:message key="logIn"/>'>
    </form>
    
    <jsp:include page="Footer.jsp"/>
    </fmt:bundle>
</body>
</html>