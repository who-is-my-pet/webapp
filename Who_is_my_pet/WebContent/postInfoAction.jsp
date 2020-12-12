<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp" %>
<%@ page import = "dto.PostDTO" %>
<%@ page import = "dao.PostDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = null;
	String email = null;
	String phoneNumber = null;
	String webSite = null;
	String description = null; 
	
	if(request.getParameter("name") != null){
		name = (String)request.getParameter("name");
	}
	if(request.getParameter("email") != null){
		email = (String)request.getParameter("email");
	}
	if(request.getParameter("phoneNumber") != null){
		phoneNumber = (String)request.getParameter("phoneNumber");
	}
	if(request.getParameter("webSite") != null){
		webSite = (String)request.getParameter("webSite");
	}
	if(request.getParameter("description") != null){
		description = (String)request.getParameter("description");
	}
	if(name == null || email == null || phoneNumber == null || webSite == null || description == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return; 
	}
	PostDAO postDAO = new PostDAO();
	int result = postDAO.postInfo(name, email, phoneNumber, webSite, description);
	System.out.println("result"+result);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB로 정보 보내기 성공');");
		script.println("location.href = 'postInfo.html';");
		script.println("</script>");
		script.close();
		return;
	}
%>