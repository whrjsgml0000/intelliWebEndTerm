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
import com.whrjsgml.entity.Post;

public class PostDAO extends DAO {
	private static final String TABLE = "post";
	
	public List<Post> findAllWithPaging(int limit, int nowPage){
		con = getConnection();
		String query = "SELECT * FROM "+ TABLE + " ORDER BY upload_date_time DESC LIMIT ? OFFSET ?";
		ArrayList<Post> posts = new ArrayList<Post>();
		int offset = (nowPage-1) * limit;
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, limit);
			ps.setInt(2, offset);
			
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
		return Optional.ofNullable(null);
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
	// TODO 본인이 작성한 글에 들어갔다면, session 에서 UserInfo 를 통해 user_id 를 비교하고 같을 경우 삭제 버튼이 추가 될 것임.
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
	// TODO 메인 페이지에서 글쓴이로 검색할 때 닉네임을 검색하면 그 닉네임의 user_id를 찾아서 이 안에 넣을 것임. 
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
	
	public Long getPostCount() {
		con = getConnection();
		String query = "SELECT COUNT(*) FROM "+TABLE;
		Long count = 0L;
		try {
			ps = con.prepareStatement(query);
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
			}
			return Optional.ofNullable(post);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return Optional.ofNullable(null);
	}
}
