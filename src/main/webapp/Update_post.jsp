<%@page import="com.whrjsgml.config.Page"%>
<%@page import="java.util.Optional"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@page import="com.whrjsgml.entity.Post"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<%
// 유저 로그인 정보가 없으면 이전 페이지로 리다이렉트(아마도 게시글)
User user = (User)session.getAttribute(Session.USERINFO);
if(user==null){
	response.sendRedirect(request.getHeader("Referer"));
}
// postId 없이 온 경우 메인 페이지로 리다이렉트
String postId = request.getParameter("post_id");
if(postId == null || postId.isBlank()){
	response.sendRedirect(Page.MAIN);
}
long lPostId = Long.parseLong(postId);

// post_id 가 있는데 관련 게시글이 없는 경우 메인 페이지로 리다이렉트  
PostDAO postDAO = new PostDAO();
Optional<Post> opPost = postDAO.findPostById(lPostId);
if(opPost.isEmpty()){
	response.sendRedirect(Page.MAIN);
}

Post post = opPost.get();
%>
</head>
<body>
	<jsp:include page="Navbar.jsp"/>
	<fmt:setLocale value="<%=session.getAttribute(Session.LANGUAGE) %>"/>
	<fmt:bundle basename="bundle.message">
	<div class="container mt-5">
		<form action="Update_post_process.jsp?post_id=<%=lPostId%>" method="post" id="form">
			<label><fmt:message key="title"/> : <input type="text" name="title" id="title" maxlength="30" placeholder="Title..." class="form-control" value="<%=post.getTitle()%>"></label><br>
		    <label><fmt:message key="content"/> : <textarea name="content" id="content" placeholder="Content..." class="form-control"><%=post.getContent() %></textarea></label><br>
		    <input id="button" type="button" value='<fmt:message key="upload"/>' class="btn btn-primary" onclick="updateValidate()">
		</form>
	</div>
	</fmt:bundle>
	<jsp:include page="Footer.jsp"/>
	<script src="resources/javascript/update.js"></script>
</body>
</html>