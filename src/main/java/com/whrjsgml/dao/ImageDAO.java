package com.whrjsgml.dao;

import java.sql.SQLException;

import com.whrjsgml.dto.InsertImageDTO;

public class ImageDAO extends DAO {
	private static final String TABLE = "image";
	
	public void insertImage(InsertImageDTO imageDTO) {
		con = getConnection();
		String query = "INSERT INTO " + TABLE + "(path,original_name,stored_name,post_id) VALUES(?,?,?,?)";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, "D:\\upload");
			ps.setString(2, imageDTO.getOriginalName());
			ps.setString(3, imageDTO.getStoredName());
			ps.setLong(4, imageDTO.getPostId());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
}
