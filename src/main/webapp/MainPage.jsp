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
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<jsp:include page="Navbar.jsp" />
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
					<td><%=post.getId() %></td>
					<td><a href="Post.jsp?post_id=<%=post.getId()%>"><%=post.getTitle() %></a></td>
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

		<jsp:include page="Footer.jsp" />
	</fmt:bundle>
</body>
</html>
