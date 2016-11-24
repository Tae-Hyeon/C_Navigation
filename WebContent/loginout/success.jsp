<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%session.getAttribute("email");
out.println("email");%>
<html onload="check_success()"></html>
<body> <button onclick="check_success()">로그인 완료하기</button></body>
<script>
function login_failed() {
	if(confirm("Login failed\n Try again??")){		
		document.list.action="../main.jsp";
		document.list.submit();
	}
	else return;
}
function check_success() {
	if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")){	
		login_failed();
	}
	else {
		alert("Login Success!!");
		document.list.action="../main.jsp";
		document.list.submit();
	}
}
</script>