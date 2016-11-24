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

	String testname = "";
	String testmemo = "";
	Integer ucode = (Integer)session.getAttribute("s_usercode");
	Integer codenum = (Integer)session.getAttribute("s_mfnum");
	Boolean isLogin = ((String)session.getAttribute("s_username")== null || (String)session.getAttribute("s_username")=="")? false:true;
	String[] code= new String[3];
	
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	codenum = 3;
	
	try {
		Class.forName(driver);                                        
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();
		for(int i = 0; i<codenum;i++){
			String sql = "SELECT * FROM code WHERE uid = ? AND num = ?";
			PreparedStatement pst= conn.prepareStatement(sql);
			pst.setInt(1,ucode);
			pst.setInt(2,i+1);
			rs = pst.executeQuery();
			while(rs.next()){
				code[i]=rs.getNString("code");
			}
			session.setAttribute("s_code"+i+1,code[i]);
		}
		
		response.sendRedirect("test_set_sccontents.jsp");
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