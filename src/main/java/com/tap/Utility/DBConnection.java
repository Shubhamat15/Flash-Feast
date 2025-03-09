package com.tap.Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static final Connection getConnection(){
		
		String URL = "jdbc:mysql://localhost:3306/tap_foods";
		String USERNAME = "root";
		String PASSWORD ="root";
        Connection connection = null;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;

	}
}

