<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>메인 페이지</title>
</head>
<body>
	<%
	String nowPage = request.getParameter("page");
	int iPage;
	if(nowPage == null || nowPage.isBlank()){
		iPage = 1;	
	} else {
		iPage = Integer.parseInt(nowPage);
	}
	
	PostDAO postDAO = new PostDAO();
	List<Post> posts = postDAO.findAllWithPaging(10, iPage);
	%>
	<fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE)%>' />
	<fmt:bundle basename="bundle.message">
		<jsp:include page="<%=Page.NAVBAR %>" />
		<h2><fmt:message key="main"/></h2>

		<main>
			
		<table>
		<thead>
		<tr>
			<th>글ID</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		</thead>
		
		<tbody>
		<%
			for(Post post:posts){
		%>
				<tr>
					<td><%=post.getPostId()%></td>
					<td><a href="<%=Page.POST%>?post_id=<%=post.getPostId()%>"><%=post.getTitle() %></a></td>
					<td><%=post.getUser().getUserNickname() %></td>
					<td><%=post.getUploadDateTime() %></td>
					<td><%=post.getViews() %></td>
				</tr>
		<% 
			}
		%>
		</tbody>
		
		</table>
			
		</main>

		<jsp:include page="<%=Page.FOOTER %>" />
	</fmt:bundle>
</body>
</html>
