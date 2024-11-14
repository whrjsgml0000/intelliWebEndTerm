<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@page import="java.util.Optional"%>
<%@page import="com.whrjsgml.dao.UserDAO"%>
<%@page import="com.whrjsgml.dto.InsertUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 성공</title>
</head>
<body>
	<jsp:include page="<%=Page.NAVBAR %>"/>
	
	<h2>회원가입 성공</h2>
	<%
		String userId = request.getParameter("id");
		String password = request.getParameter("passwd");
		String nickname = request.getParameter("nickname");
		InsertUserDTO insertUserDTO = new InsertUserDTO();
		insertUserDTO.setUserId(userId);
		insertUserDTO.setUserPass(password);
		insertUserDTO.setUserNickname(nickname);
		
		UserDAO userDAO = new UserDAO();
		userDAO.insertUser(insertUserDTO);
		
		Optional<User> userO = userDAO.findByUserId(userId);
		if(userO.isPresent()){
			User user = userO.get();
			out.println(user.getId());
			out.println(user.getUserId());
			out.println(user.getUserPass());
			out.println(user.getUserNickname());
		}
	%>
	
	<a href="<%=Page.MAIN%>">메인으로 돌아가기</a>
	
	<jsp:include page="<%=Page.FOOTER %>"/>
	
</body>
</html>