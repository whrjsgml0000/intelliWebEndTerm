<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
</head>
<body>
  <fmt:setLocale value='<%=request.getParameter("language") %>'/>
  <fmt:bundle basename="bundle.message">
  <jsp:include page="Navbar.jsp"/>
  
  <main>
	
  

  </main>
  
  <jsp:include page="Footer.jsp"/>
  </fmt:bundle>
</body>
</html>