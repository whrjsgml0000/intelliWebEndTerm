<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.dao.UserDAO"%>
<%@page import="com.whrjsgml.config.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
if(id == null || id.isBlank()){
	response.sendRedirect(Page.MAIN);
	return;
}

long lId = Long.parseLong(id);

UserDAO userDAO = new UserDAO();
userDAO.deleteUserById(lId);
session.removeAttribute(Session.USERINFO);

response.sendRedirect(Page.MAIN);
%>