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

	String uemail = request.getParameter("email");
	String upwd = request.getParameter("password");
	String username ="";
	String useremail = "";
	String userpwd = "";
	int usercode = 0;
	int mfrownum = 0;
	int codenum = 0;
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);                                        
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();
		String sql = "SELECT * FROM user_info WHERE email = ? AND pwd = ?";
		PreparedStatement pst= conn.prepareStatement(sql);
		pst.setString(1,uemail);
		pst.setString(2,upwd);
		rs = pst.executeQuery();
		
		Boolean isLogin = false;
		Boolean isExiste = false;
		
		while(rs.next()){
			username=rs.getNString("name");
			useremail=rs.getNString("email");
			userpwd=rs.getNString("pwd");
			usercode=rs.getInt("id");
			mfrownum=rs.getInt("mfnum");
			codenum=rs.getInt("codenum");
			if((useremail != null || useremail != "") || (userpwd != null || userpwd != "")){
				isLogin = true;
			}
			if(mfrownum>0){
				isExiste = true;
				System.out.println("mfnum is Existe"+isExiste);
			}
		}
		System.out.println(isLogin);
		System.out.println(uemail+"-"+useremail+"//"+upwd+"-"+userpwd);
		if(isLogin = true){
			session.setAttribute("s_usercode",usercode);
			session.setAttribute("s_email",uemail);
			session.setAttribute("s_password",upwd);
			session.setAttribute("s_username",username);
			session.setAttribute("s_mfnum",mfrownum);
			session.setAttribute("s_codenum",codenum);
			response.sendRedirect("../func_jsp/test_set_mfcontents.jsp");
		}
		else {
			%> <script> alert("Login failed.\n Try again."); history.go(-1);</script><%
		}
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