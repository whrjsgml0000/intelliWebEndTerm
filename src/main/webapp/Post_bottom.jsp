<%@page import="com.whrjsgml.entity.User"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.entity.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.whrjsgml.dao.CommentDAO"%>
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
	CommentDAO commentDAO = new CommentDAO();
	List<Comment> comments = commentDAO.findCommentByPostId(lPostId);
	User user = (User)session.getAttribute(Session.USERINFO);
%>
</head>
<body>
<div class="container mt-5">

	<form id="commentForm" name="commentForm" action="Comment_process.jsp?post_id=<%=lPostId %>" method="post">
		<p>댓글 작성</p>
		<textarea name="comment" class="form-control"></textarea>
		<input type="submit" value="작성" class="btn btn-primary">
	</form>
	<hr>
	
	<p>댓글</p>
	<table class="table table-bordered table-striped">
	<colgroup>
	    <col style="width: 65%;"> <!-- 첫 번째 열 40% -->
	    <col style="width: 15%;"> <!-- 두 번째 열 30% -->
	    <col style="width: 15%;"> <!-- 세 번째 열 30% -->
	    <col style="width: 5%;">
  </colgroup>
	<thead>
	<tr>
		<th>내용</th>
		<th>작성자</th>
		<th>작성 시간</th>
		<th>비고</th>
	</tr>
	</thead>
	<tBody>
	<%
	for(Comment comment : comments){
	%>
		<tr>
			<td><%=comment.getComment() %></td>
			<td><%=comment.getUser().getUserNickname() %></td>
			<td><%=comment.getCreatedAt() %></td>
			<td><%=comment.getUser().getId() == user.getId() ? "<a href=\"\">삭제</a>":"" %></td>
		</tr>
	<%
	}
	%>
	</tBody>
	</table>

</div>
</body>
</html>