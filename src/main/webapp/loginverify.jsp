<%@page import="dao.UserDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");

	pst = con.prepareStatement("select * from login");

	rs = pst.executeQuery();

	while (rs.next()) {
		String id =rs.getString("id");
		String email2 = rs.getString("email");
		String password2 = rs.getString("password");
		if(email.equals(email2)&& password.equals(password2)){
			 HttpSession ses = request.getSession();
			 ses.setAttribute("id", id);
			 ses.setAttribute("email", email2);
			response.sendRedirect("template/machines.jsp");
		}else {
			response.sendRedirect("error.jsp");
		}

	}
	%>
</body>
</html>