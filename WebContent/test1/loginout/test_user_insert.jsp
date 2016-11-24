<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	request.setCharacterEncoding("UTF-8"); 
	
	String uemail = request.getParameter("email");
	String uname = request.getParameter("Username");
	String upwd = request.getParameter("password");
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test1";
	String id = "root";
	String pwd = "";
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();
		String sql = "INSERT INTO user_info(email, name, pwd) VALUE ('" + uemail + "','" + uname + "','" + upwd + "')";
		st.executeUpdate(sql);
		response.sendRedirect("../test_main.jsp");
	}
	
	catch(ClassNotFoundException e) {
		out.println("Class Not FoundL mysql jdbc Driver");
		e.printStackTrace();
		return;
	}
	catch(SQLException e) {
		out.println("MySQL Connection Failed");
		e.printStackTrace();
		return;
	}
	finally {
		if(conn != null) conn.close();
		if(st != null) st.close();
		if(rs !=null) rs.close(); 
	}
%>

<title>Insert title here</title>
</head>
<body>

</body>
</html>