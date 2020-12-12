package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.MemberDAO;
import dto.MemberDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String id, pw, name, age, email, insta_id, description, gender;
	private int idx;
	private String msg;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection)sc.getAttribute("DBconnection");
		
		String query = "select * from user where id='" + id + "'and passwd = '" + pw + "'";
		try {
			Statement stmt = conn.createStatement();
			ResultSet resultset = stmt.executeQuery(query);
			
			while(resultset.next()) {
				idx = resultset.getInt("idx");
				name = resultset.getString("name");
				id = resultset.getString("id");
				pw = resultset.getString("passwd");
				age = resultset.getString("age");
				email = resultset.getString("email");
				insta_id = resultset.getString("insta_id");
				description = resultset.getString("description");
				gender = resultset.getString("gender");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		ResultSet rs = MemberDAO.findUser(conn, id);
		
		if(rs != null) {
			try {			
				if(rs.next()) {					
					String checkpw = rs.getString(1);
					if(checkpw.equals(pw)) {
						
						HttpSession session = request.getSession();
						MemberDTO memDTO = new MemberDTO(idx, id, pw, name, gender, age, insta_id, email, description);
						session.setAttribute("idx", idx);
						session.setAttribute("member_info", memDTO);
						session.setAttribute("name", name);
						session.setAttribute("id", id);
						session.setAttribute("pw", pw);
						session.setAttribute("gender", gender);
						session.setAttribute("age", age);
						session.setAttribute("email", email);
						session.setAttribute("insta_id", insta_id);
						session.setAttribute("description", description);
						
						RequestDispatcher view = request.getRequestDispatcher("/startTest.jsp"); 
						view.forward(request, response);
					}
					else {
						out.println("<script>alert('잘못된 비밀번호 입니다.'); location.href='LoginPage.jsp'; </script>\n");
						
					}
				}
				else {
					out.println("<script>alert('잘못된 아이디나 비밀번호 입니다.');location.href='LoginPage.jsp'; </script>\n");

				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
