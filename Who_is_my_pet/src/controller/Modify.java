package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/Modify.do")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection connection;
	private Statement stmt;
	
	private String name, pw, gender, age, insta, email1, email2, description, id;
	
	HttpSession session;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		session = request.getSession();
		
		ServletContext sct = getServletContext();
		Connection conn = (Connection) sct.getAttribute("DBconnection");
		
		MemberDTO memDTO = (MemberDTO)session.getAttribute("memberDTO");

		name = request.getParameter("name");
		gender = request.getParameter("gender");
		age = request.getParameter("age");
		insta = request.getParameter("insta");
		email1 = request.getParameter("mail1");
		email2 = request.getParameter("mail2");
		description = request.getParameter("description");
		id = (String)session.getAttribute("id");

		try {
			MemberDAO.modifyMember(conn, name, age, insta, description, id);
			
			session.setAttribute("name", name);
			session.setAttribute("age", age);
			session.setAttribute("insta", insta);
			session.setAttribute("description", description);
			session.setAttribute("id", id);
			
			RequestDispatcher view = request.getRequestDispatcher("/MyPage.jsp"); 
			view.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
