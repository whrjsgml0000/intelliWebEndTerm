<%@page import="com.whrjsgml.config.FileSetting"%>
<%@page import="com.whrjsgml.entity.Image"%>
<%@page import="java.util.List"%>
<%@page import="com.whrjsgml.dao.ImageDAO"%>
<%@page import="java.util.Optional"%>
<%@page import="com.whrjsgml.entity.Post"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@page import="com.whrjsgml.config.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<%
PostDAO postDAO = new PostDAO();
Optional<Post> opPost = postDAO.findPostByHighestViewToday();
%>
</head>
<body>
	<jsp:include page="<%=Page.NAVBAR %>"/>
	
	<div class="container">
		<main>
		<%
		if(opPost.isEmpty()){
		%>
			<a href="<%=Page.BOARD%>" class="btn btn-primary">오늘의 첫 게시글을 작성해보세요!</a>
		<%		
		}
		else {
			Post post = opPost.get();
			ImageDAO imageDAO = new ImageDAO();
			List<Image> images = imageDAO.findImageByPostId(post.getPostId());
			Image image = null;
			if(!images.isEmpty()){
				image = images.get(0);
			}
		%>
			<p>오늘의 인기 게시글 입니다.</p>
			<a href="<%=Page.POST%>?post_id=<%=post.getPostId()%>" class="btn btn-primary">
			<p>제목 : <%=post.getTitle() %></p>
			<img alt="이미지가 없는 게시글입니다." src="<%=FileSetting.IMAGE_RELATIVE_PATH %><%=image!=null ? image.getImageStoredName():""%>" width="500">
			</a>
		<%
		}
		%>
		</main>
	</div>
	
	<jsp:include page="<%=Page.FOOTER %>"/>
</body>
</html>