package com.whrjsgml.entity;

import java.sql.Timestamp;
import java.util.List;
import com.whrjsgml.entity.Image;

public class Post {
	private Long id;
	private String title;
	private Long userId;
	private String content;
	private Timestamp uploadDateTime;
	private Timestamp updateDateTime;
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	
	
}
