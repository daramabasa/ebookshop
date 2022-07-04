package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCConnection {
	
	public Connection conn;
	
	public JDBCConnection() {}
	
	public JDBCConnection(String driver, String url, String id, String passwd) {
		try {
			
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, id, passwd);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}