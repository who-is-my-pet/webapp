package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.AnimalDTO;
import dto.UserDTO;
import util.DatabaseUtil;

public class AnimalDAO {
	public static ArrayList<AnimalDTO> getAnimalList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AnimalDTO> list = new ArrayList<AnimalDTO>();

		try {
			pstmt = conn.prepareStatement("SELECT * from animal");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AnimalDTO vo = new AnimalDTO(rs.getInt("idx"), rs.getString("name"), rs.getString("description"),
						rs.getString("celebs"), rs.getString("img"));
				list.add(vo);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<AnimalDTO> getAnimalInfo() {
		String SQL = "SELECT name, description, celebs from animal";
		// 조회 결과 여러개 담을 객체
		ArrayList<AnimalDTO> list = new ArrayList<AnimalDTO>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			Connection conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AnimalDTO animalDTO = new AnimalDTO();
				animalDTO.setName(rs.getString("name"));
				animalDTO.setDescription(rs.getString("description"));
				animalDTO.setCelebs(rs.getString("celebs"));
				list.add(animalDTO);
			}
			for (int i = 0; i < list.size(); i++) {
				AnimalDTO tmp = list.get(i);
				System.out.println(tmp.getName() + tmp.getDescription() + "\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
