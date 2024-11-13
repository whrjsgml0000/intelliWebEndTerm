<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String language = request.getParameter("language");
	if(language == null || language.isBlank()){
		language = "ko";
	}
	session.setAttribute("language", language);
%>