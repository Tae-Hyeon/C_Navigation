<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test1";
	String id = "root";
	String pwd = "";
	
	Integer ucode = (Integer)session.getAttribute("s_usercode");
	Boolean isLogin = ((String)session.getAttribute("s_username")== null || (String)session.getAttribute("s_username")=="")? false:true;
	String source="";
	
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);                                        
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();
		
		String sql = "SELECT * FROM source WHERE uid = ?";
		PreparedStatement pst= conn.prepareStatement(sql);
		pst.setInt(1,ucode);
		rs = pst.executeQuery();
		while(rs.next()){
			source = rs.getNString("sourcecode");
		}
		
		session.setAttribute("s_source",source);
		
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