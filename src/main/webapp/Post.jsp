<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.config.FileSetting"%>
<%@page import="com.whrjsgml.entity.Image"%>
<%@page import="java.util.List"%>
<%@page import="com.whrjsgml.dao.ImageDAO"%>
<%@page import="com.whrjsgml.entity.Post"%>
<%@page import="java.util.Optional"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
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
   	if(postId==null || postId.isBlank()){
   		response.sendRedirect(Page.MAIN);
   	}
   	long lPostId = Long.parseLong(postId);
   	PostDAO postDAO = new PostDAO();
   	Optional<Post> opPost = postDAO.findPostById(lPostId);
   	if(opPost.isEmpty()){
   		response.sendRedirect(Page.MAIN);
   		return;
   	}
   	Post post = opPost.get();
   	
   	ImageDAO imageDAO = new ImageDAO();
   	List<Image> images = imageDAO.findImageByPostId(lPostId);
   	List<String> imagePath = images.stream()
		.map(image->FileSetting.IMAGE_RELATIVE_PATH + image.getImageStoredName())
		.toList();
   	postDAO.updatePostViews(lPostId);
    %>
</head>
<body>
    <jsp:include page="<%=Page.NAVBAR %>"/>
	<jsp:include page="Post_top.jsp?post_id=<%=postId %>"/>
	
	<main>
		<h2><%=post.getTitle() %></h2>
		<p><%=post.getContent() %></p>
		<%
			for(int i=0;i<imagePath.size();i++){
				out.println("<img src=\"" + imagePath.get(i) + "\"/>");
			}
		%>
		<p><%=post.getViews() %></p>
		<p><%=post.getUpdateDateTime() %></p>
		<p><%=post.getUploadDateTime() %></p>
		<p><%=post.getUserId() %>
	</main>
	
	<jsp:include page="Post_bottom.jsp?post_id=<%=postId %>"/>
    <jsp:include page="<%=Page.FOOTER %>"/>
</body>
</html>