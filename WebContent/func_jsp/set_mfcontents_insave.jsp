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
	Integer rownum = (Integer)session.getAttribute("s_mfnum");
	Boolean isLogin = ((String)session.getAttribute("s_username")== null || (String)session.getAttribute("s_username")=="")? false:true;
	Boolean isChecked = true;
	String[] mfname= new String[rownum];
	String[] mfmemo= new String[rownum];
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);                                        
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();
		for(int i = 0; i<rownum;i++){
			String sql = "SELECT * FROM main_func WHERE uid = ? AND num = ?";
			PreparedStatement pst= conn.prepareStatement(sql);
			pst.setInt(1,ucode);
			pst.setInt(2,i+1);
			rs = pst.executeQuery();
			while(rs.next()){
				mfname[i]=rs.getNString("name");
				mfmemo[i]=rs.getNString("memo");
			}
			for(int j=0;j<rownum;j++){
				session.setAttribute("s_mfname"+j+1,mfname[j]);
				session.setAttribute("s_mfmemo"+j+1,mfmemo[j]);
				session.setAttribute("isChecked",isChecked);
			}
		}
		response.sendRedirect("../mainfunc.jsp");
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