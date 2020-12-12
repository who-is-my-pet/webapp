package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class PostDAO {
	public int postInfo(String name, String email, String phoneNumber, String webSite, String description) {
		String SQL = "INSERT INTO post (name, email, contact, webSite, description) VALUES(?,?,?,?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phoneNumber);
			pstmt.setString(4, webSite);
			pstmt.setString(5, description);
			
			return pstmt.executeUpdate();  //반환값은 insert 된 개수 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
