<%@page import="com.whrjsgml.config.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String lang = request.getParameter("language");
if(lang == null || lang.isBlank()){
	lang = "ko";
}
session.setAttribute(Session.LANGUAGE, lang);
response.sendRedirect(request.getHeader("Referer"));
%>