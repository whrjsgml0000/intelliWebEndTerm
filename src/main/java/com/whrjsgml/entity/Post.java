package com.whrjsgml.entity;

import java.sql.Timestamp;
import java.util.List;
import com.whrjsgml.entity.Image;

public class Post {
	private Long id;
	private String title;
	private String userNickname;
	private String content;
	private Timestamp uploadDateTime;
	private Timestamp updateDateTime;
}
