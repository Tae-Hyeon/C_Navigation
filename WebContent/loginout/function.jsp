<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- event.html -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event</title>
<script type="text/javascript">
	window.onload = function() {
		var header = document.getElementById('header');
		boolean isLogin = true;
		
		// header 객체에 onclick 이벤트 속성을 연결
		header.onclick = function {
			System.out.println(isLogin);
			var divLogin = document.getElementById(header);
			var divLogout = document.getElementById(header);
			if (isLogin){
				divLogin.style.display = "none";
			}
			else{
				divLogout.syle.display = "block";
			}
		}
};
		}
	};
</script>
</head>
<body>
	<h1 id="header">Click</h1>
</body>
</html>