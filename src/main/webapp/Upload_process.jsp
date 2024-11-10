<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업로드 성공!</title>
</head>
<body>
    <%
    	String uploadPath = "D:\\upload";
    	int size = 1024 * 1024 * 15;
    	MultipartRequest mr = new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
    	
    	String title = mr.getParameter("title");
    	String content = mr.getParameter("content");
    	Enumeration<String> names = mr.getFileNames();
    	out.println(title);
    	out.println(content);
    	while(names.hasMoreElements()){
    		String name = names.nextElement();
    		String fileName = mr.getFilesystemName(name);
    		String originalName = mr.getOriginalFileName(name);
    		String contentType = mr.getContentType(name);
    		File file = mr.getFile(name);
    		
    		out.println(fileName);
    		out.println(originalName);
    		out.println(contentType);
    	}
    	
    %>
</body>
</html>