<%@page import="com.whrjsgml.dao.ImageDAO"%>
<%@page import="com.whrjsgml.dto.InsertImageDTO"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@page import="com.whrjsgml.dto.InsertPostDTO"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
String uploadPath = "C:\\Users\\CGH\\eclipse-workspace\\EndTerm\\src\\main\\webapp\\resources\\image";
int size = 1024 * 1024 * 15;
MultipartRequest mr = new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

String title = mr.getParameter("title");
String content = mr.getParameter("content");
Enumeration<String> names = mr.getFileNames();
User user = (User) session.getAttribute("UserInfo");

InsertPostDTO insertPostDTO = new InsertPostDTO();
insertPostDTO.setTitle(title);
insertPostDTO.setContent(content);
insertPostDTO.setUserId(user.getId());
PostDAO postDAO = new PostDAO();
ImageDAO imageDAO = new ImageDAO();

long generatedId = postDAO.insertPost(insertPostDTO);

while(names.hasMoreElements()){
	String name = names.nextElement();
	
	String storedName = mr.getFilesystemName(name);
	String originalName = mr.getOriginalFileName(name);
	
	InsertImageDTO imageDTO = new InsertImageDTO();
	imageDTO.setStoredName(storedName);
	imageDTO.setOriginalName(originalName);
	imageDTO.setPostId(generatedId);
	
	imageDAO.insertImage(imageDTO);
}

response.sendRedirect("Post.jsp?post_id=" + generatedId);
%>
