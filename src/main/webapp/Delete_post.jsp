<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@page import="com.whrjsgml.config.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String postId = request.getParameter("post_id");
if(postId == null || postId.isBlank()){
	response.sendRedirect(request.getHeader("Referer"));
	return;
}
long lPostId = Long.parseLong(postId);
PostDAO postDAO = new PostDAO();
postDAO.deletePostById(lPostId);

response.sendRedirect(Page.MAIN);
%>