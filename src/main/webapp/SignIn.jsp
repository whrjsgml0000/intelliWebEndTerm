<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form method="post" action="MainPage.jsp">
        <label>아이디 : <input id="id" name="id" type="text" placeholder="id"></label><br>
        <label>비밀번호 : <input id="passwd" name="passwd" type="password" placeholder="passwd"></label><br>
        <input id="signIn" type="submit" value="로그인">
    </form>
</body>
</html>