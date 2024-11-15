<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>Insert title here</title>
<%
String postId = request.getParameter("post_id");
long lPostId = Long.parseLong(postId);
PostDAO postDAO = new PostDAO();
User user = (User) session.getAttribute(Session.USERINFO);

%>
</head>
<body>
<%
if(user.getId() == postDAO.findPostById(lPostId).get().getUserId()){
%>
	<a href="Delete_post.jsp?post_id=<%=lPostId%>">삭제</a>
<%
}
%>
</body>
</html>