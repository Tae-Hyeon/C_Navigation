<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String memberid=(String)session.getAttribute("s_email");
	String membername=(String)session.getAttribute("s_username");
	System.out.println(memberid);
	System.out.println(membername);
	boolean isLogin = (membername ==null || membername=="") ? false:true;
	System.out.println(isLogin);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<style>
	#login
	{
		background-color:#D8D8D8; 
		border-radius:10px; 
		width:325px; 
		height:310px; 
		padding: 20px 30px 0px 30px;
	}
	#logout
	{
		background-color:#D8D8D8; 
		border-radius:10px; 
		width:325px; 
		height:250px; 
		padding: 20px 30px 0px 30px;
	}
	#contents_box, 	#list_box
	{
		width: 400px;
		padding: 10px 20px 10px 20px;
	}
	#input_information
	{
		margin: 20px 40px 20px 40px;
		text-align: right;

	}
	#login_button
	{
		width: 250px;
		height: 50px;
		margin: 0px 25px 5px 25px;
		font-size: 110%;
	}
	#logout_button
	{
		width: 240px;
		height: 50px;
		margin: 0px auto;
		margin-top: 5px;
		margin_bottom: 5px;
		font_size: 110%;
	}
	.left_box
	{
		gravity:right;
	}
</style>
<script type="text/javascript">
	function check_session() {
		var divLogin = document.getElementById('login');
		var divLogout = document.getElementById('logout');
		var isLogin = <%=isLogin%>;
		if (isLogin){
			divLogin.style.display = "none";
			divLogout.style.display = "block";
		}
		else{
			divLogin.style.display = "block";
			divLogout.style.display = "none";
		}
	}
</script>
<title>C Navigation</title>
</head>
<body onload="check_session()">
<div class="main">
	<div class="logo">
		<a href="test_main.jsp"><img src="images/logo2.png" alt="To Main" height="130" width="400"></a>
	</div>
	<div class="left_box">
		<h2><br />Let's make proud program<br /><br />I'll help you<br /> <br />
		<img src="images/logo.png" art="로고입니다. 프로그램을 만들러 가는 길을 표현했습니다." title="Logo" />
		</h2>
	</div>
	<div class="mid_box">
		<div id="contents_box">
			<h2><br />contents<br /></h2>
			<a href="selection.jsp" class="toNext">만들러가기 -></a>
			<br /><br />
		</div>
		<div id="list_box">
			<h3>    <strong>순서</strong><br /></h3>
			<ol>
				<li>프로그램 정하기</li>
				<li>메인 기능 분석</li>
				<li>새부 기능 분석</li>
				<li>코드 구현</li>
				<li>프로그램 구현</li>
			</ol>
		</div>
	</div>
	
	<div class="right_box" id="right">
		<div class="orange_memo">
			<p><em><strong>로그인을 하면 진행 기록이 저장됩니다!!!</strong></em></p>
		</div>
		<div id="login">
			<div id="facebook_login">
				/* facebook api 연동 */
			</div>
			<form onsubmit="return input_check_func()" action="loginout/test_login.jsp" method="post">
			<div id="input_information">
				<br /><br />
				<label for="email">Email:</label>
				<input type="text" name="email" id="email">
				<br /><br />
				<label for="Password" >Password:</label>
				<input type="password" name="password" id="password">
				<br /><br />
			</div> 
			<input type="submit" value="로  그  인" id="login_button">
			</form>
						<a href="loginout/test_sign_in.jsp"><button id="login_button">회 원 가 입</button></a>
			
		</div>
		<div id="logout" style="display:none;">
			<div id="facebook_login">
			
			</div>
			<div id="welcome_user">
				<h2>환영합니다. <br/><%=membername%>님! </h2>
			</div>
			<a href="loginout/test_logout.jsp"><input type="submit" value="로 그 아 웃" id="logout_button"></a>
		</div>
	</div>
		<script>
			function input_check_func() {
				var email = document.getElementById('email').value;
				var pwd = document.getElementById('password').value;
				
				if(email == null || pwd == null || email == "" || pwd == ""){
					alert("이메일과 비밀번호를 입력해주세요.")
					return false;
				}
				
				else {
					alert("로그인이 완료되었습니다.")
					return true;
				}
				
			}
		</script>
</div>
</body>
</html>