<%@page import="com.whrjsgml.entity.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.whrjsgml.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String postId = request.getParameter("post_id");
	long lPostId = Long.parseLong(postId);
	CommentDAO commentDAO = new CommentDAO();
	List<Comment> comments = commentDAO.findCommentByPostId(lPostId);
%>
</head>
<body>

<form id="commentForm" name="commentForm" action="Comment_process.jsp?post_id=<%=lPostId %>" method="post">
	<p>댓글 작성</p>
	<textarea rows="5" cols="50" name="comment"></textarea>
	<input type="submit" value="작성">
</form>

<p>댓글</p>
<table>
<thead>
<tr>
	<th>내용</th>
	<th>작성자</th>
	<th>작성 시간</th>
</tr>
</thead>
<tBody>
<%
	for(Comment comment : comments){
%>
		<tr>
			<td><%=comment.getComment() %></td>
			<td><%=comment.getUser().getUserNickname() %>
			<td><%=comment.getCreatedAt() %>
		</tr>
<%
	}
%>
</tBody>
</table>


</body>
</html>