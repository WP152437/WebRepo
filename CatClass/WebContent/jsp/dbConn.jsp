<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Test</title>
</head>
<body>
<h1>JDBC Connection Test</h1>
<%
	Connection conn = null;
	Statement stmt = null;
	
	try{
		String url = "jdbc:mysql://localhost:3306/webclass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,"root","root");
		stmt = conn.createStatement();
		
		out.println("Database successfully opened");
		
	}catch(Exception e) {
		out.println(e.getMessage());
	}finally {
		stmt.close();
		conn.close();
	}
%>
</body>
</html>