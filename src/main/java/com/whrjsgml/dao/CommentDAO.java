package com.whrjsgml.dao;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.whrjsgml.dto.InsertCommentDTO;
import com.whrjsgml.entity.Comment;

public class CommentDAO extends DAO{
	public static final String TABLE = "comment";
	
	public void insertComment(InsertCommentDTO insertCommentDTO) {
		con = getConnection();
		String query = "INSERT INTO " + TABLE + "(post_id,user_id,comment) VALUES(?,?,?)";
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, insertCommentDTO.getPostId());
			ps.setLong(2,insertCommentDTO.getUserId());
			ps.setString(3, insertCommentDTO.getComment());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public List<Comment> findCommentByPostId(Long postId){
		con = getConnection();
		String query = "SELECT * FROM " + TABLE + " WHERE post_id=?";
		LinkedList<Comment> comments = new LinkedList<Comment>();
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, postId);
			rs = ps.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setCommentId(rs.getLong("comment_id"));
				comment.setPostId(rs.getLong("post_id"));
				comment.setUserId(rs.getLong("user_id"));
				comment.setComment(rs.getString("comment"));
				comment.setCreatedAt(rs.getTimestamp("created_at"));
				comment.setUpdatedAt(rs.getTimestamp("updated_at"));
				comment.setIsDeleted(rs.getBoolean("is_deleted"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return comments;
	}
}
