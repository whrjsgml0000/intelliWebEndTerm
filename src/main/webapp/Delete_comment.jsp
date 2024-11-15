<%@page import="com.whrjsgml.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String commentId = request.getParameter("comment_id");
if(commentId == null || commentId.isBlank()){
	response.sendRedirect(request.getHeader("Referer"));
	return;
}

long lCommentId = Long.parseLong(commentId);
CommentDAO commentDAO = new CommentDAO();
commentDAO.deleteCommentByCommentId(lCommentId);

response.sendRedirect(request.getHeader("Referer"));
%>