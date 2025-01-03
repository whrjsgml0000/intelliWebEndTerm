package com.whrjsgml.dao;

import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import com.whrjsgml.dto.InsertPostDTO;
import com.whrjsgml.dto.UpdatePostDTO;
import com.whrjsgml.entity.Post;

public class PostDAO extends DAO {
	private static final String TABLE = "post";
	
	public List<Post> findPostWithSearchAndPaging(String search, int limit, int nowPage){
		con = getConnection();
		String query = "SELECT * FROM " + TABLE + " WHERE title LIKE ? OR content LIKE ? ORDER BY upload_date_time DESC LIMIT ? OFFSET ?";
		ArrayList<Post> posts = new ArrayList<Post>();
		int offset = (nowPage-1) * limit;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, "%"+search+"%");
			ps.setString(2, "%"+search+"%");
			ps.setInt(3, limit);
			ps.setInt(4, offset);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Post post = new Post();
				post.setPostId(rs.getLong("post_id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setUserId(rs.getLong("user_id"));
				post.setViews(rs.getLong("views"));
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
		String query = "SELECT * FROM " + TABLE + " WHERE post_id=?";
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				Post post = new Post();
				post.setPostId(rs.getLong("post_id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setUserId(rs.getLong("user_id"));
				post.setViews(rs.getLong("views"));
				post.setUpdateDateTime(rs.getTimestamp("update_date_time"));
				post.setUploadDateTime(rs.getTimestamp("upload_date_time"));
				return Optional.ofNullable(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return Optional.empty();
	}
	
	public long insertPost(InsertPostDTO insertPostDTO) {
		con = getConnection();
		String query = "INSERT INTO " + TABLE + "(title,content,user_id) VALUES(?,?,?)";
		long generatedId = 0;
		try {
			ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, insertPostDTO.getTitle());
			ps.setString(2, insertPostDTO.getContent());
			ps.setLong(3, insertPostDTO.getUserId());
			int updateResult = ps.executeUpdate();
			if(updateResult > 0) {
				rs = ps.getGeneratedKeys();
				if(rs.next())
					generatedId = rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
		return generatedId;
	}
	
	public void updatePostViews(Long postId) {
		con = getConnection();
		String query = "UPDATE " + TABLE + " SET views=views+1 WHERE post_id=?";
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, postId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}

	public void deletePostById(Long postId) {
		con = getConnection();
		String query = "DELETE FROM "+ TABLE + " WHERE post_id=?";
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, postId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}

	public List<Post> findPostByUserId(Long userId) {
		con = getConnection();
		String query = "SELECT * FROM " + TABLE + " WHERE user_id=? ORDER BY id DESC";
		LinkedList<Post> posts = new LinkedList<>();
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				Post post = new Post();
				post.setPostId(rs.getLong("post_id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setUserId(rs.getLong("user_id"));
				post.setViews(rs.getLong("views"));
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
	
	public Long getPostCount(String search) {
		con = getConnection();
		String query = "SELECT COUNT(*) FROM " + TABLE + " WHERE title LIKE ? OR content LIKE ?";
		Long count = 0L;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getLong("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return count;
	}
	
	public Optional<Post> findPostByHighestViewToday(){
		Timestamp t = Timestamp.valueOf(LocalDate.now().atStartOfDay());
		con = getConnection();
		String query = "SELECT * FROM " + TABLE + " WHERE upload_date_time > ? ORDER BY views DESC LIMIT 1";
		try {
			ps = con.prepareStatement(query);
			ps.setTimestamp(1, t);
			rs = ps.executeQuery();
			Post post = new Post();
			if(rs.next()) {
				post.setPostId(rs.getLong("post_id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setUserId(rs.getLong("user_id"));
				post.setViews(rs.getLong("views"));
				post.setUpdateDateTime(rs.getTimestamp("update_date_time"));
				post.setUploadDateTime(rs.getTimestamp("upload_date_time"));
				return Optional.ofNullable(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return Optional.empty();
	}
	
	public void updatePostById(UpdatePostDTO updatePostDTO) {
		con = getConnection();
		Timestamp t = Timestamp.valueOf(LocalDateTime.now());
		String query = "UPDATE " + TABLE + " SET title=?, content=?, update_date_time=? WHERE post_id=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, updatePostDTO.getTitle());
			ps.setString(2, updatePostDTO.getContent());
			ps.setTimestamp(3, t);
			ps.setLong(4, updatePostDTO.getPostId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
