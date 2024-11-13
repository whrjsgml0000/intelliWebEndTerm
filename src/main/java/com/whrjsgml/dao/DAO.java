package com.whrjsgml.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class DAO {
	protected static final String CLASS_NAME = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3307/board";
	private static final String USER = "root";
	private static final String PASSWORD = "1234567890";
	protected ResultSet rs;
	protected PreparedStatement ps;
	protected Connection con;
	
	protected Connection getConnection() {
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
	
	protected void closeAll() {
		closeRS();
		closePS();
		closeCon();
	}
	
	private void closeRS() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void closePS() {
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void closeCon() {
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
