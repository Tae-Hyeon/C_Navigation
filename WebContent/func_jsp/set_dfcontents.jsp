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
	Integer rownum = (Integer)session.getAttribute("s_dfnum");
	String[] dfname= new String[rownum];
	String[] dfmemo= new String[rownum];
	Boolean isLogin = ((String)session.getAttribute("s_username")== null)? false:true;
	Boolean isChecked = true;
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName(driver);                                        
		conn = DriverManager.getConnection(url, id, pwd);
		st = conn.createStatement();

		if(isLogin = true){
			for(int i = 0; i<rownum;i++){
				String sql = "SELECT * FROM detail_func WHERE uid = ? AND num = ?";
				PreparedStatement pst= conn.prepareStatement(sql);
				pst.setInt(1,ucode);
				pst.setInt(2,i+1);
				rs = pst.executeQuery();
				while(rs.next()){
					dfname[i]=rs.getNString("name");
					dfmemo[i]=rs.getNString("memo");
				}
				for(int j=0;j<rownum;j++){
					System.out.println("dfname"+j+" : "+dfname[j]);
					System.out.println("dfmemo"+j+" : "+dfmemo[j]);
					session.setAttribute("s_dfname"+j+1,dfname[j]);
					session.setAttribute("s_dfmemo"+j+1,dfmemo[j]);
					session.setAttribute("isChecked",isChecked);
				}
			}
			response.sendRedirect("detailfunc.jsp");
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