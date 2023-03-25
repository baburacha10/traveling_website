<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="">
<%
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	
	String url = "jdbc:mysql://localhost:3306?user=root&password=shrivenubabu";
	String sql = "insert into login.info values(?,?)";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection(url);
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	
	preparedStatement.setString(1, user);
	preparedStatement.setString(2, pass);
	preparedStatement.executeUpdate();
	
	response.sendRedirect("login.html");
%>
</form>

</body>
</html>