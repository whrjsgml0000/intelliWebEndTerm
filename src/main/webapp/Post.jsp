<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.entity.User"%>
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
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <title>게시물</title>
    <%
    User user = (User) session.getAttribute(Session.USERINFO);
    if(user == null){
    	response.sendRedirect(request.getHeader("Referer"));
    	return;
    }
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
    <div class="container mt-5">
		<jsp:include page="Post_top.jsp?post_id=<%=postId %>"/>
		<main>
			<h2><%=post.getTitle() %></h2>
			<hr>
			<p><%=post.getContent() %></p>
			<%
			for(int i=0;i<imagePath.size();i++){
				out.println("<img src=\"" + imagePath.get(i) + "\"/>");
			}
			%>
			<p>조회수 : <%=post.getViews() %></p>
			<p>수정 일시 : <%=post.getUpdateDateTime() %></p>
			<p>작성 일시 : <%=post.getUploadDateTime() %></p>
			<p>작성자 : <%=post.getUser().getUserNickname() %>
		</main>
		<hr>
		<jsp:include page="Post_bottom.jsp?post_id=<%=postId %>"/>
	</div>
    <jsp:include page="<%=Page.FOOTER %>"/>
</body>
</html>