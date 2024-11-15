package com.whrjsgml.entity;

import java.sql.Timestamp;
import java.util.List;

import com.whrjsgml.dao.UserDAO;
import com.whrjsgml.entity.Image;

public class Post {
	private Long postId;
	private String title;
	private Long userId;
	private String content;
	private Timestamp uploadDateTime;
	private Timestamp updateDateTime;
	private Long views;
	
	
	public Long getViews() {
		return views;
	}
	public void setViews(Long views) {
		this.views = views;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getUploadDateTime() {
		return uploadDateTime;
	}
	public void setUploadDateTime(Timestamp uploadDateTime) {
		this.uploadDateTime = uploadDateTime;
	}
	public Timestamp getUpdateDateTime() {
		return updateDateTime;
	}
	public void setUpdateDateTime(Timestamp updateDateTime) {
		this.updateDateTime = updateDateTime;
	}
	public User getUser() {
		UserDAO userDAO = new UserDAO();
		//TODO 리팩토링 필요
		return userDAO.findById(userId).get();
	}
	
	
}
