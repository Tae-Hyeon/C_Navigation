<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<style>
	#button_box1{height:90px; width:150px; text-align:center; margin:30px 20px 60px 20px; padding:3px 5px 3px 5px; color:#ffffff; background-color: #3d94f6;}
	#button_box2{height:90px; width:150px; text-align:center; margin:30px 20px 30px 70px; padding:3px 5px 3px 5px; color:#ffffff; background-color: #3d94f6;}
	#button_box3{height:90px; width:150px; text-align:center; margin:60px 20px 30px 120px;padding:3px 5px 3px 5px; color:#ffffff; background-color: #3d94f6;}
	#theme_box{height:22px; width:140px; text-align:center; margin:0px 10px 40px 100px; background-color:#04B486; color:#FFFFFF; border-radius:7px 7px 7px 7px;}
	#making_list_box{height:130px; width:300px; text-align:center; margin:0px 10px 40px 10px; padding: 10px 20px 10px 20px; background-color:#A4A4A4; }
</style>
<title>C Navigation</title>
</head>
<body>
	<div class="logo">
		<a href="test_main.jsp"><img src="images/logo2.png" alt="To Main" height="130" width="400"></a>
	</div>
	<div class="main">
		<div class="left_box">
			<h2>C language</h2><br />
			<div>
				<button id="button_box1" onclick="changeDivDisplay('list1', 'list2', 'list3')">1단계<br /><br />조건문/반복문</button>>
			</div>
			<div>
				<button id="button_box2" onclick="changeDivDisplay('list2', 'list1', 'list3')">2단계<br /><br />배열/함수</button>>
			</div>
			<div>
				<button id="button_box3" onclick="changeDivDisplay('list3', 'list1', 'list2')">3단계<br /><br />포인터</button>>
			</div>
			<script>
			/* Div의 Display상태를 바꾼다.*/
			function changeDivDisplay(divName, divOtherName1 ,divOtherName2) 
			{
				var divObj = document.getElementById(divName);
				var divObj2 = document.getElementById(divOtherName1);
				var divObj3 = document.getElementById(divOtherName2);
				
				if(divObj.style.display == "none") {
					divObj.style.display = "block";
					divObj2.style.display = "none";
					divObj3.style.display = "none";
				}
				else if (divObj2.style.display == "none" && divObj3.style.display== "none"){
					divObj.style.display = "block";
				}
				else {
					divObj.style.display = "none";
				}
			}
			</script>
		</div>
		<div class="mid_box">
			<div class="orange_memo">
				<p>혹시 조건문/반복문을 알고있나요?<br /> 없다면, 이번에 공부해보도록 합시다!!!</p>
			</div>
			<a href="study.jsp" class="toNext" style="width: 200px;">공부하러 가기</a>
		</div>
		<div class="right_box">
			<div id="theme_box">
				<h4>만들 프로그램</h4>
			</div>
			<div id="list1">
				<a href="test_mainfunc.jsp"><div id="making_list_box">
					<h1>계산기</h1>
					<p>우리가 사용하는 계산기를 만들어 봅시다!</p>
				</div></a>
				<div id="making_list_box">
					<h2>coming soon</h2>
				</div>
			</div>
			<div id="list2" style="display:none;">
				<a href="mainfunc.jsp"><div id="making_list_box">
					<h2>coming soon</h2>
				</div></a>
				<div id="making_list_box">
					<h2>coming soon</h2>
				</div>
			</div>
			<div id="list3" style="display:none;">
				<a href="test_mainfunc.jsp"><div id="making_list_box">
					<h2>coming soon</h2>
				</div></a>
				<div id="making_list_box">
					<h2>coming soon</h2>
				</div>
			</div>
		</div>
	</div>
</body>
</html>