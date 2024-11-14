<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.config.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute(Session.USERINFO);
response.sendRedirect(Page.MAIN);
%>