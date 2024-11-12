package com.whrjsgml.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import com.whrjsgml.dto.InsertUserDTO;
import com.whrjsgml.entity.User;

public class UserDAO {
	private static final String CLASS_NAME = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3307/board";
	private static final String USER = "root";
	private static final String PASSWORD = "1234567890";
	private static final String TABLE = "users";
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Connection getConnection() {
		Connection c = null;
		try {
			Class.forName(CLASS_NAME);
			c =  DriverManager.getConnection(URL, USER, PASSWORD);
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		System.out.println("get connection!");
		return c;
	}
	
	private void closeCon() {
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void closeRS() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private void closePS() {
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void insertUser(InsertUserDTO insertUserDTO) {
		conn = getConnection();
		try {
			String query = "INSERT INTO " + TABLE + "(user_id,user_pass,user_nickname) VALUES (?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, insertUserDTO.getUserId());
			ps.setString(2,insertUserDTO.getUserPass());
			ps.setString(3, insertUserDTO.getUserNickname());
			ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		closeRS();
		closePS();
		closeCon();
	}
	
	public Optional<User> findByUserId(String userId){
		conn = getConnection();
		try {
			String query = "SELECT * FROM " + TABLE + "WHERE user_id = ?";
			ps = conn.prepareStatement(query);
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
				return Optional.of(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeRS();
		closePS();
		closeCon();
		return Optional.of(null);
	}
	
}
