package com.whrjsgml.dto;

public class InsertImageDTO {
	private String storedName;
	private Long postId;
	private String storedPath;
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public String getStoredPath() {
		return storedPath;
	}
	public void setStoredPath(String storedPath) {
		this.storedPath = storedPath;
	}
	
	
}
