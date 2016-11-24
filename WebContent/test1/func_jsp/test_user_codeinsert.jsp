<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%
	request.setCharacterEncoding("UTF-8"); 
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test1";
	String id = "root";
	String pwd = "";
	
	int codenum = Integer.parseInt(request.getParameter("codenum"));
	
	Integer mfnum = (Integer)session.getAttribute("s_mfnum");
	Integer dbcodenum = (Integer)session.getAttribute("s_codenum");
	Integer ucode = (Integer)session.getAttribute("s_usercode");
	String uemail = (String)session.getAttribute("s_email");
	Boolean isExiste = false;
	String dbcode = "";
	String[] code= new String [3];
	code[codenum-1] = request.getParameter("c"+codenum);
	
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();
		
		
		String sql = "SELECT * FROM code WHERE uid = ? AND num = ?";
		
		PreparedStatement pst= conn.prepareStatement(sql);
		pst.setInt(1,ucode);
		pst.setInt(2,codenum);
		rs = pst.executeQuery();
		while(rs.next()){
			dbcode = rs.getString("code");
		}
		if((Integer)dbcodenum == null){
			session.setAttribute("s_codenum",0);
		}
		else{
			session.setAttribute("s_codenum",dbcodenum);
		}
		
		if( dbcode != ""){	
			isExiste = true;
			System.out.println("code : "+dbcode);
			System.out.println("isExiste : "+isExiste);
		}
		
		if(isExiste){
			sql = "UPDATE code SET code ='"+code[codenum-1]+"' WHERE uid = "+ucode+" AND num = "+codenum;
			st.executeUpdate(sql);
		}
		else{
			sql = "INSERT INTO code(uid, num, code) value("+ucode+","+codenum+",'"+code[codenum-1]+"')";
			st.executeUpdate(sql);
		}
		sql = "UPDATE user_info SET codenum = "+codenum+" WHERE email = '"+uemail+"'";
		st.executeUpdate(sql);
		response.sendRedirect("test_set_codecontents_insave.jsp");
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