<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="signstyle.css">
<title>**회원가입**</title>
</head>
<body>
	<div class="logo">
		<a href="../test_main.jsp"><img src="../images/logo2.png" alt="To Main" height="130" width="400"></a>		
	</div>
	<div class="main">
		<div class="left_box">
			<img src="../images/logo.png">
		</div>
		<div class="right_box">
			<h1>회원가입</h1>
			<form onsubmit="return input_check_func()" action="test_user_insert.jsp" method="post">
			<input type="text" name="email" id="email" onFocus="this.className='input_focus'" onBlur="if ( this.value == '' ) { this.className='input_blur_Email' }" class="input_blur_Email" /><br /><br />
			<input type="text" name="Username" id="Username"onFocus="this.className='input_focus'" onBlur="if ( this.value == '' ) { this.className='input_blur_Username' }" class="input_blur_Username" /><br /><br />
			<input type="password" name="password" id="password" onFocus="this.className='input_focus'" onBlur="if ( this.value == '' ) { this.className='input_blur_password' }" class="input_blur_password" /><br /><br />
			<input type="password" name="Retype password" id="Retype password" onFocus="this.className='input_focus'" onBlur="if ( this.value == '' ) { this.className='input_blur_Rpassword' }" class="input_blur_Rpassword" /><br /><br />
			<input type="submit" class="Sign_in_button" value="회원가입" >
			</form>
			
			<script>
			function input_check_func() {
				var id = document.getElementById('email').value;
				var name = document.getElementById('Username').value;
				var pwd = document.getElementById('password').value;
				var retypepwd = document.getElementById("Retype password").value;
				
				if(id == null || name == null || pwd == null || retypepwd == null || id == "" || name == "" || pwd == "" || retypepwd == ""){
					alert("공백을 채워주세요.")
					return false;
				}
				else if (pwd != retypepwd){
					alert("비밀번호가 일치하지 않습니다.")
					return false;
				}
				else {
					alert("회원가입이 완료되었습니다.")
					return true;
				}
				
			}
			</script>
		</div>
	</div>
</body>
</html>