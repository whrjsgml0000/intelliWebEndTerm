<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 업로드</title>
</head>
<body>
    <fmt:setLocale value='<%=request.getParameter("language") %>'/>
    <fmt:bundle basename="bundle.message">
    <jsp:include page="Navbar.jsp"/>
    
    <form name="form" method="post" enctype="multipart/form-data">
        <input type="text" name="title" id="title" maxlength="30" placeholder="제목을 지어주세요."><br>
        <input type="file" name="file" id="file" placeholder="파일"><br>
        <input type="submit" value="업로드">
        
    </form>
    
    <jsp:include page="Footer.jsp"/>
    </fmt:bundle>
</body>
</html>