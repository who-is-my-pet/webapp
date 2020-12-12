package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class UserAnimalDAO {
	public int faceInfo(int user_idx, int animal_idx) {
		String SQL = "INSERT INTO user_has_animal (user_idx, animal_idx) VALUES(?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_idx);
			pstmt.setInt(2, animal_idx);
			
			return pstmt.executeUpdate();  //반환값은 insert 된 개수 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
