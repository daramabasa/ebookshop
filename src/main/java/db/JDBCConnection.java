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
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 로드 성공 02");
			
			System.out.println("url: " + url);
			System.out.println("id: " + id);
			System.out.println("passwd: " + passwd);
			conn = DriverManager.getConnection(url, id, passwd);
			
			System.out.println("DB 연결 성공 02");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}