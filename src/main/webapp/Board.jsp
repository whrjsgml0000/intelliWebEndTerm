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
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
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
	
	String search = request.getParameter("search");
	if(search==null||search.isBlank()){
		search="";
	}
	
	PostDAO postDAO = new PostDAO();
	int defalutPostViewCount = 15;
	List<Post> posts = postDAO.findPostWithSearchAndPaging(search, defalutPostViewCount, iPage);
	long count = postDAO.getPostCount(search);
	long maxPage = count % defalutPostViewCount == 0 ? count / defalutPostViewCount : count / defalutPostViewCount + 1;
	%>
	<fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE)%>' />
	<fmt:bundle basename="bundle.message">
		<jsp:include page="<%=Page.NAVBAR %>" />
		<div class="container mt-5">
			<h2><fmt:message key="board"/></h2>
	
			<main>
				<table class="table table-bordered table-striped text-center">
				<col style="width: 10%;">
    			<col style="width: 52%;">
    			<col style="width: 15%;">
    			<col style="width: 17%;">
    			<col style="width: 6%;">
				<thead>
				<tr>
					<th><fmt:message key="postId"/></th>
					<th><fmt:message key="title"/></th>
					<th><fmt:message key="writer"/></th>
					<th><fmt:message key="uploadTime"/></th>
					<th><fmt:message key="views"/></th>
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
						<td><%=post.getUploadDateTime().toLocalDateTime() %></td>
						<td><%=post.getViews() %></td>
					</tr>
				<% 
				}
				%>
				</tbody>
				</table>
				<div class="d-flex justify-content-between">
					<a href="?search=<%=search %>&page=<%=iPage-1%>" <%=iPage==1 ? "style=\"visibility: hidden;\"" : ""%> class="btn btn-primary"><fmt:message key="prevPage"/></a>
				<%
				if(iPage < maxPage){
				%>
					<a href="?search=<%=search %>&page=<%=iPage+1%>" class="btn btn-primary"><fmt:message key="nextPage"/></a>
				</div>
				<%
				}
				%>
			</main>
		</div>
		<jsp:include page="<%=Page.FOOTER %>" />
	</fmt:bundle>
</body>
</html>
