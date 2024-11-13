package com.whrjsgml.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.whrjsgml.entity.Post;

public class PostDAO extends DAO {
	private static final String TABLE = "post";
	
	public List<Post> findAllWithPaging(int limit, int nowPage){
		con = getConnection();
		String query = "SELECT * FROM "+ TABLE + " LIMIT ? OFFSET ? ORDER BY DESC";
		ArrayList<Post> posts = new ArrayList<Post>();
		int offset = (nowPage-1) * limit;
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, limit);
			ps.setInt(2, offset);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Post post = new Post();
				post.setId(rs.getLong("post_id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setUserId(rs.getLong("user_id"));
				post.setUpdateDateTime(rs.getTimestamp("update_date_time"));
				post.setUploadDateTime(rs.getTimestamp("upload_date_time"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return posts;
	}
	
	public Optional<Post> findPostById(Long id){
		con = getConnection();
		String query = "SELECT * FROM " + TABLE + " WHERE id=?";
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				Post post = new Post();
				post.setId(rs.getLong("post_id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setUserId(rs.getLong("user_id"));
				post.setUpdateDateTime(rs.getTimestamp("update_date_time"));
				post.setUploadDateTime(rs.getTimestamp("upload_date_time"));
				return Optional.ofNullable(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return Optional.ofNullable(null);
	}
	
}
