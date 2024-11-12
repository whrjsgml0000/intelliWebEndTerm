CREATE TABLE IF NOT EXISTS post(
	post_id BIGINT AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	content TEXT,
	user_nickname VARCHAR(20) NOT NULL,
	PRIMARY KEY(post_id)
);

--DROP TABLE post;--