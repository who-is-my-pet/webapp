package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/Delete.do")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String id, pw;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection)sc.getAttribute("DBconnection");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		id = (String)session.getAttribute("id");
		pw = (String)session.getAttribute("pw");
		
		ResultSet rs = MemberDAO.findUser(conn, id);
		
		if(rs != null) {
			try {			
				if(rs.next()) {					
					String checkpw = rs.getString(1);
					if(checkpw.equals(pw)) {
						MemberDAO.deleteMember(conn, id);
						
						out.println("<script>alert('탈퇴되었습니다.'); location.href='LoginPage.jsp'; </script>\n");
						}
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
