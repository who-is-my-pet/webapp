package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;


public class MemberDAO {
	
	public static ResultSet findUser(Connection con, String mid) {
		String sqlst = "SELECT passwd FROM user WHERE id=";
		
		Statement st;
		try {
			st = con.createStatement();
			
			if(st.execute(sqlst+"'"+mid+"'")) {
				return st.getResultSet();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static void addMember(Connection con, String newId, String newpasswd 
			,String newName, String gender, String age, String insta, String email1, String email2, String description) throws SQLException {
		
		PreparedStatement pstmt = null;
		try {
			con.setAutoCommit(false);
			pstmt = con.prepareStatement("INSERT INTO user(id, passwd, name, gender, age, insta_id, email, description) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, newId);
			pstmt.setString(2, newpasswd);
			pstmt.setString(3, newName);
			pstmt.setString(4, gender);
			pstmt.setString(5,  age);
			pstmt.setString(6, insta);
			pstmt.setString(7, email1+"@"+email2);
			pstmt.setString(8, description);
			//pstmt.setString(8, imgurl);
			//pstmt.setInt(9, animal_id);
			pstmt.executeUpdate();

			con.commit();
			con.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (pstmt != null) {pstmt.close();}

		}

	}
	
	public static int idDupCheck(Connection con, String id) {
		int result = -1;
		
		ResultSet rset = null;
		Statement st = null;
		
		String sql = "SELECT COUNT(*) FROM user WHERE id=";
		
		try {
			st = con.createStatement();
			
			rset = st.executeQuery(sql+"'"+id+"'");
			
			if(rset.next()) {
				result = rset.getInt(1);
				System.out.println(result);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int emailDupCheck(Connection con, String email) {
		int result = -1;
		
		ResultSet rset = null;
		Statement st = null;
		
		String sql = "SELECT COUNT(*) FROM user WHERE email=";
		
		try {
			st = con.createStatement();
			
			rset = st.executeQuery(sql+"'"+email+"'");
			
			if(rset.next()) {
				result = rset.getInt(1);
				System.out.println(result);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public static void modifyMember(Connection con, String newName, String age, String insta, String description, String id) throws SQLException {
		
		PreparedStatement pstmt = null;
		String query = "update user set name=?, age=?, insta_id=?, description=? where id=?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newName);
			pstmt.setString(2, age);
			pstmt.setString(3, insta);
			pstmt.setString(4, description);
			pstmt.setString(5,  id);
			
			int i = pstmt.executeUpdate();
			
			if (i == 1) {
				System.out.println("update success");
			}
			else {
				System.out.println("update fail");
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (pstmt != null) {pstmt.close();}

		}

	}
	
	public static void deleteMember(Connection con, String id) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from user where id = '" + id+"'";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			System.out.println("delete success");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}


