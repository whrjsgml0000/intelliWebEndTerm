<%@page import="com.whrjsgml.config.Page"%>
<%@page import="com.whrjsgml.config.Session"%>
<%@page import="com.whrjsgml.config.FileSetting"%>
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
String basePath = request.getServletContext().getRealPath("/");
String imageUploadPath = basePath + "resources/image";
DiskFileUpload dUpload = new DiskFileUpload();
dUpload.setRepositoryPath(imageUploadPath);
dUpload.setFileSizeMax(FileSetting.UPLOAD_MAX_SIZE);
List<FileItem> list= dUpload.parseRequest(request);
List<FileItem> formFieldItems = list.stream()
	.filter(FileItem::isFormField)
	.toList();
String title = "";
String content = "";
for(int i=0; i<formFieldItems.size(); i++){
	String name = formFieldItems.get(i).getFieldName();
	if(name.equals("title")){
		title = formFieldItems.get(i).getString("utf-8");
	} else if (name.equals("content")){
		content = formFieldItems.get(i).getString("utf-8");
	}
}
Iterator<FileItem> itemIter = list.iterator();

User user = (User) session.getAttribute(Session.USERINFO);

InsertPostDTO insertPostDTO = new InsertPostDTO();
insertPostDTO.setTitle(title);
insertPostDTO.setContent(content);
insertPostDTO.setUserId(user.getId());

File f = new File(imageUploadPath);
f.mkdirs();

PostDAO postDAO = new PostDAO();
ImageDAO imageDAO = new ImageDAO();

long generatedId = postDAO.insertPost(insertPostDTO);

while(itemIter.hasNext()){
	FileItem fileItem = itemIter.next();
	
	if(!fileItem.isFormField()){
		InsertImageDTO imageDTO = new InsertImageDTO();
		String storedName = fileItem.getName();
		if(storedName.isBlank()){
			continue;
		}
		// 파일 중복 이름 방지
		storedName = storedName.substring(storedName.indexOf("/") + 1, storedName.lastIndexOf(".")) 
		+ UUID.randomUUID().toString()
		+ storedName.substring(storedName.lastIndexOf("."));
		imageDTO.setStoredName(storedName);
		imageDTO.setPostId(generatedId);
		imageDTO.setStoredPath(imageUploadPath);
		
		imageDAO.insertImage(imageDTO);
		File file = new File(imageUploadPath + "/" + storedName);
		fileItem.write(file);
	}
}

response.sendRedirect(Page.POST + "?post_id=" + generatedId);
%>
