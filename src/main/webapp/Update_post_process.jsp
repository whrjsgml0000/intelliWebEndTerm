<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.dto.UpdatePostDTO"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PostDAO postDAO = new PostDAO();

UpdatePostDTO dto = new UpdatePostDTO();

String postId = request.getParameter("post_id");
long lPostId = Long.parseLong(postId);

String title = request.getParameter("title");
String content = request.getParameter("content");

dto.setPostId(lPostId);
dto.setTitle(title);
dto.setContent(content);

postDAO.updatePostById(dto);

response.sendRedirect(Page.POST+"?post_id="+lPostId);
%>