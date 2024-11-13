<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물</title>
    <%
    	String postId = request.getParameter("post_id");
    %>
</head>
<body>
    <jsp:include page="Navbar.jsp"/>
	<jsp:include page="Post_top.jsp?post_id=<%=postId %>"/>
	
	
	
	<jsp:include page="Post_bottom.jsp?post_id=<%=postId %>"/>
    <jsp:include page="Footer.jsp"/>
</body>
</html>