<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="exception.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	String url = "jdbc:mysql://localhost:3306?user=root&password=shrivenubabu";
	String sql1 = "select * from login.info where username=? && password=?";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url);
	PreparedStatement pstmt = con.prepareStatement(sql1);
	
	pstmt.setString(1, username);
	pstmt.setString(2, password);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next())
	{
		String user = rs.getString(1);
		String pass = rs.getString(2);
		response.sendRedirect("home.jsp");
	}
	else
	{
		out.println("<html><body>");
		out.println("<br>");
		out.println("<p> Sorry You Have Entered Wrong Password </p>");
		out.println("<br>");
		out.println("<a href='login.html'><p>Try Again!!</p></a>");
		out.println("</body></html>");
	}
%>

</body>
</html>