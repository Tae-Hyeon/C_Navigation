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
	
	int rownum = Integer.parseInt(request.getParameter("rownum"));
	Integer ucode = (Integer)session.getAttribute("s_usercode");
	String uemail = (String)session.getAttribute("s_email");
	String[] fname= new String[rownum];
	String[] memo= new String[rownum];
	Boolean isExiste = false;
	for(int i = 0; i < rownum; i++){
		fname[i] = request.getParameter("f"+(i+1));
		memo[i] = request.getParameter("m"+(i+1));
	}
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();
		String sql = "SELECT * FROM user_info WHERE id = ?";
		
		PreparedStatement pst= conn.prepareStatement(sql);
		pst.setInt(1,ucode);
		rs = pst.executeQuery();
		rs.next();
		int mfnum = rs.getInt("mfnum");
		if((Integer)mfnum == null){
			session.setAttribute("s_mfnum",0);
			mfnum = 0;
		}
		else{
			session.setAttribute("s_mfnum",mfnum);
		}
		if( mfnum > 0){	
			isExiste = true;
		}
		
		for(int i = 0; i < rownum; i++){
			if(!isExiste){
				sql = "INSERT INTO main_func(uid, name, memo, num) value('"+ucode+"','"+fname[i]+"','"+memo[i]+"','"+(i+1)+"')";
				st.executeUpdate(sql);
			}
			else{
				sql = "UPDATE main_func SET name ='"+fname[i]+"',memo = '"+memo[i]+"' WHERE uid = "+ucode+" AND num = "+(i+1);
				st.executeUpdate(sql);
			}
		}
		sql = "UPDATE user_info SET mfnum= '"+rownum+"' WHERE email = '"+uemail+"'";
		st.executeUpdate(sql);
		if( mfnum == 0)
			session.setAttribute("s_mfnum",rownum);
		response.sendRedirect("set_mfcontents_insave.jsp");
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