package dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LikesDTO {

	public static void insertLikes(Connection conn, int user_idx, int other_idx) {
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("INSERT INTO likes (user_idx, other_idx) VALUES (?,?)");
			pstmt.setInt(1, user_idx);
			pstmt.setInt(2, other_idx);
			System.out.print(pstmt);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}

	public static void deleteLikes(Connection conn, int user_idx, int other_idx) {
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("DELETE FROM likes WHERE user_idx=? and other_idx=?");
			pstmt.setInt(1, user_idx);
			pstmt.setInt(2, other_idx);
			System.out.print(pstmt);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}
}
