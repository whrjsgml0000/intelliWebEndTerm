<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.whrjsgml.dao.ImageDAO"%>
<%@page import="com.whrjsgml.dto.InsertImageDTO"%>
<%@page import="com.whrjsgml.dao.PostDAO"%>
<%@page import="com.whrjsgml.dto.InsertPostDTO"%>
<%@page import="com.whrjsgml.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
//String uploadPath = "C:\\Users\\CGH\\eclipse-workspace\\EndTerm\\src\\main\\webapp\\resources\\image"; //desktop
String uploadPath = "C:\\Users\\whrjs\\Desktop\\intelligent\\IntelliWebEndTerm\\src\\main\\webapp\\resources\\image";
int size = 1024 * 1024 * 15;
DiskFileUpload dUpload = new DiskFileUpload();
dUpload.setRepositoryPath(uploadPath);
List<FileItem> list= dUpload.parseRequest(request);
List<FileItem> formFieldItems = list.stream()
	.filter(FileItem::isFormField)
	.toList();
String title="";
String content="";
for(int i=0;i<formFieldItems.size();i++){
	String name = formFieldItems.get(i).getFieldName();
	if(name.equals("title")){
		title = formFieldItems.get(i).getString("utf-8");
	} else if (name.equals("content")){
		content = formFieldItems.get(i).getString("utf-8");
	}
}
Iterator<FileItem> itemIter = list.iterator();

User user = (User) session.getAttribute("UserInfo");

InsertPostDTO insertPostDTO = new InsertPostDTO();
insertPostDTO.setTitle(title);
insertPostDTO.setContent(content);
insertPostDTO.setUserId(user.getId());
PostDAO postDAO = new PostDAO();
ImageDAO imageDAO = new ImageDAO();

long generatedId = postDAO.insertPost(insertPostDTO);

while(itemIter.hasNext()){
	FileItem fileItem = itemIter.next();
	
	if(!fileItem.isFormField()){
		InsertImageDTO imageDTO = new InsertImageDTO();
		String storedName = fileItem.getName();
		// 파일 중복 이름 방지
		storedName = storedName.substring(storedName.indexOf("\\")+1, storedName.lastIndexOf(".")) 
				+ UUID.randomUUID().toString()
				+ storedName.substring(storedName.lastIndexOf("."));
		imageDTO.setStoredName(storedName);
		imageDTO.setPostId(generatedId);
		
		imageDAO.insertImage(imageDTO);
		
		File file = new File(uploadPath+"\\"+storedName);
		fileItem.write(file);
	}
}

response.sendRedirect("Post.jsp?post_id=" + generatedId);
%>
