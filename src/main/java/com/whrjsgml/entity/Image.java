package com.whrjsgml.entity;

public class Image {
	private Long id;
	private String imagePath;
	private String imageOriginalName;
	private String imageStoredName;
	private Long postId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImageOriginalName() {
		return imageOriginalName;
	}
	public void setImageOriginalName(String imageOriginalName) {
		this.imageOriginalName = imageOriginalName;
	}
	public String getImageStoredName() {
		return imageStoredName;
	}
	public void setImageStoredName(String imageStoredName) {
		this.imageStoredName = imageStoredName;
	}
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	
	
}
