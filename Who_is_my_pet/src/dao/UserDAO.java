package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.UserDTO;

public class UserDAO {

	public static ArrayList<UserDTO> findMatchedUserList(Connection conn, int user_idx) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();

		try {
			pstmt = conn.prepareStatement(
					"select * from user where idx in (select A.other_idx from likes A where EXISTS(select * from likes B where A.user_idx = B.other_idx and A.other_idx = B.user_idx) and A.user_idx = ?)");
			System.out.println(user_idx);
			pstmt.setInt(1, user_idx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserDTO vo = new UserDTO(rs.getInt("idx"), rs.getString("id"), rs.getString("name"), rs.getString("age"),
						rs.getString("gender"), rs.getString("email"), rs.getString("insta_id"), rs.getString("img"),
						null);// rs.getString("description")
				list.add(vo);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static ArrayList<UserDTO> findYetMatchedUserList(Connection conn, int user_idx) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();

		try {
			pstmt = conn.prepareStatement(
					"select * from user where idx in (select A.user_idx from likes A where not EXISTS(select * from likes B where A.user_idx = B.other_idx and A.other_idx = B.user_idx) and A.other_idx = ?);");
			pstmt.setInt(1, user_idx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserDTO vo = new UserDTO(rs.getInt("idx"), rs.getString("id"), rs.getString("name"), rs.getString("age"),
						rs.getString("gender"), rs.getString("email"), rs.getString("insta_id"), rs.getString("img"),
						null);// rs.getString("description")
				list.add(vo);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static ArrayList<UserDTO> findInitUserList(Connection conn, int user_idx, int animal_idx) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();

		try {
			pstmt = conn.prepareStatement("select * from user "
					+ "where gender != (select gender from user where idx = ?) "
					+ "and idx in (select user_idx from user_has_animal where animal_idx = ? and not user_idx = ?) "
					+ "and idx not in (select other_idx from likes where user_idx = ?);");
			pstmt.setInt(1, user_idx);
			pstmt.setInt(2, animal_idx);
			pstmt.setInt(3, user_idx);
			pstmt.setInt(4, user_idx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserDTO dto = new UserDTO(rs.getInt("idx"), rs.getString("id"), rs.getString("name"), rs.getString("age"),
						rs.getString("gender"), rs.getString("email"), rs.getString("insta_id"), rs.getString("img"),
						rs.getString("description"));
				list.add(dto);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
