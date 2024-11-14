package com.whrjsgml.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.whrjsgml.config.FileSetting;
import com.whrjsgml.dto.InsertImageDTO;
import com.whrjsgml.entity.Image;

public class ImageDAO extends DAO {
	private static final String TABLE = "image";
	
	public void insertImage(InsertImageDTO imageDTO) {
		con = getConnection();
		String query = "INSERT INTO " + TABLE + "(path,stored_name,post_id) VALUES(?,?,?)";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, FileSetting.IMAGE_UPLOAD_PATH);
			ps.setString(2, imageDTO.getStoredName());
			ps.setLong(3, imageDTO.getPostId());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public List<Image> findImageByPostId(Long postId) {
		con = getConnection();
		String query = "SELECT * FROM " + TABLE + " WHERE post_id=?";
		ArrayList<Image> images = new ArrayList<>();
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, postId);
			rs = ps.executeQuery();
			while(rs.next()) {
				Image image = new Image();
				image.setId(rs.getLong("image_id"));
				image.setImagePath(rs.getString("path"));
				image.setImageStoredName(rs.getString("stored_name"));
				image.setPostId(postId);
				
				images.add(image);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
		return images;
	}
	
}
