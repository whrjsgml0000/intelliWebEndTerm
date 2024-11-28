<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@page import="java.util.Optional"%>
<%@page import="com.whrjsgml.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	UserDAO userDAO = new UserDAO();
	Optional<User> opUser = userDAO.findByUserId(id);
	if(opUser.isEmpty()){
		response.sendRedirect(Page.SIGNIN);
		return;
	}
	User user = opUser.get();
	
	if(!user.getUserPass().equals(passwd)){
		response.sendRedirect(Page.SIGNIN);
		return;
	}
	
	session.setAttribute(Session.USERINFO, user);
	session.setMaxInactiveInterval(30 * 60);
	response.sendRedirect(Page.MAIN);
%>