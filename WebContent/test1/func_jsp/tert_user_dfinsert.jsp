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
	System.out.println("jsp df rownum :"+rownum);
	Integer ucode = (Integer)session.getAttribute("s_usercode");
	String uemail = (String)session.getAttribute("s_email");
	String[] dfname= new String[rownum];
	String[] dfmemo= new String[rownum];
	Boolean isExiste = false;
	for(int i = 0; i < rownum; i++){
		dfname[i] = request.getParameter("f"+(i+1));
		dfmemo[i] = request.getParameter("m"+(i+1));
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
		int dfnum = rs.getInt("dfnum");
		if((Integer)dfnum == null){
			session.setAttribute("s_dfnum",0);
		}
		else{
			session.setAttribute("s_dfnum",dfnum);
		}
		System.out.println("jsp dfnum : "+dfnum);
		if( dfnum > 0){	
			isExiste = true;
		}
		
		for(int i = 0; i < rownum; i++){
			if(!isExiste){
				sql = "INSERT INTO detail_func(uid, name, memo, num) value('"+ucode+"','"+dfname[i]+"','"+dfmemo[i]+"','"+(i+1)+"')";
				st.executeUpdate(sql);
			}
			else{
				sql = "UPDATE detail_func SET name ='"+dfname[i]+"',memo = '"+dfmemo[i]+"' WHERE uid = "+ucode+" AND num = "+(i+1);
				st.executeUpdate(sql);
			}
		}
		sql = "UPDATE user_info SET dfnum= '"+rownum+"' WHERE email = '"+uemail+"'";
		st.executeUpdate(sql);
		response.sendRedirect("test_set_dfcontents.jsp");
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