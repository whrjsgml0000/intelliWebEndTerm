package com.whrjsgml.dao;

import java.sql.SQLException;
import java.util.Optional;

import com.whrjsgml.dto.InsertUserDTO;
import com.whrjsgml.entity.User;

public class UserDAO extends DAO{
	private static final String TABLE = "users";
	
	public void insertUser(InsertUserDTO insertUserDTO) {
		con = getConnection();
		try {
			String query = "INSERT INTO " + TABLE + "(user_id,user_pass,user_nickname) VALUES (?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, insertUserDTO.getUserId());
			ps.setString(2,insertUserDTO.getUserPass());
			ps.setString(3, insertUserDTO.getUserNickname());
			ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		closeAll();
	}
	
	public Optional<User> findByUserId(String userId){
		con = getConnection();
		try {
			String query = "SELECT * FROM " + TABLE + " WHERE user_id = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			if(rs!=null) {
				rs.next();
				Long id = rs.getLong("id");
				String userPass = rs.getString("user_pass");
				String userNickName = rs.getString("user_nickname");
				User user = new User();
				user.setId(id);
				user.setUserId(userId);
				user.setUserNickname(userNickName);
				user.setUserPass(userPass);
				return Optional.ofNullable(user);
			}
			return Optional.ofNullable(null);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		closeAll();
		return Optional.ofNullable(null);
	}
	
}
