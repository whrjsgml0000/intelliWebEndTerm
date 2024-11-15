<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <title>파일 업로드</title>
</head>
<body>
	<%
	User user = (User)session.getAttribute(Session.USERINFO);
	if(user == null){
		response.sendRedirect(Page.MAIN);
		return;
	}
	%>
    <fmt:setLocale value='<%=session.getAttribute(Session.LANGUAGE) %>'/>
    <fmt:bundle basename="bundle.message">
    <jsp:include page="<%=Page.NAVBAR %>"/>
    <div class="container mt-5">
    
	    <form id="form" name="form" method="post" enctype="multipart/form-data" action="Upload_process.jsp" accept-charset="UTF-8">
	        <label>제목 : <input type="text" name="title" id="title" maxlength="30" placeholder="Title..." class="form-control"></label><br>
	        <label>내용 : <textarea name="content" id="content" placeholder="Content..." class="form-control"></textarea></label><br>
	        <label>이미지 : <input type="file" name="file" id="file" multiple accept="image/*" class="form-control"></label><br>
	        <input id="button" type="button" value='<fmt:message key="upload"/>' class="btn btn-primary" onclick="uploadValidate()">
	    </form>
    </div>
    <jsp:include page="<%=Page.FOOTER %>"/>
    </fmt:bundle>
    <script src="resources/javascript/upload.js"></script>
</body>
</html>