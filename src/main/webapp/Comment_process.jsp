<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.dto.InsertCommentDTO"%>
<%@page import="com.whrjsgml.dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User user = (User)session.getAttribute(Session.USERINFO);
if(user == null){
	response.sendRedirect(Page.MAIN);
	return;
}
String postId = request.getParameter("post_id");
long lPostId = Long.parseLong(postId);

CommentDAO commentDAO = new CommentDAO();

InsertCommentDTO insertCommentDTO = new InsertCommentDTO();
String comment = request.getParameter("comment");
insertCommentDTO.setComment(comment);
insertCommentDTO.setPostId(lPostId);
insertCommentDTO.setUserId(user.getId());

commentDAO.insertComment(insertCommentDTO);

response.sendRedirect(Page.POST+"?post_id="+lPostId);

%>