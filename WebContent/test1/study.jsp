<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<style>
	#left_box{float:left; width:24%; padding:10px 20px 10px 40px;}
	#right_box{float:left; width:66%; padding:10px 20px 10px 20px;}
	#background_of_menu{width:180px; text-align:center; margin:20px 0px 20px 10px; padding: 10px 15px 10px 15px; background-color:#A9E2F3;}
	.menu_box{height:60px; width:110px; text-align:center; margin:10px 20px 10px 20px; padding:3px 5px 3px 5px; color:#ffffff; background-color: #3d94f6;}
	#sb1, #sb2, #sb3, #sb4, #sb5{width:800px; float:left; text-align:left; margin:20px 20px 20px 20px; padding:10px 15px 10px 15px; background-color:#bdbdbd; display: none;}
	#theme_box{height:22px; width:140px; text-align:center; margin:0px 10px 40px 20px; background-color:#F5A9E1; color:#FFFFFF; border-radius:7px 7px 7px 7px;}
</style>
<title>C Navigation</title>
</head>
<body>
	<div class="logo">
		<a href="main.jsp"><img src="images/logo2.png" alt="To Main" height="130" width="400"></a>
	</div>
	<div class="main">
		<div id="left_box">
			<h2>공부해 봅시다!!</h2><br />
			<div id="background_of_menu">
				<div id="theme_box">
					<h4>공부 리스트</h4>
				</div>
				<button class="menu_box" onclick="changeDivDisplay('sb1','sb2','sb3','sb4','sb5')">if else</button>
				<button class="menu_box" onclick="changeDivDisplay('sb2','sb1','sb3','sb4','sb5')">while</button>
				<button class="menu_box" onclick="changeDivDisplay('sb3','sb1','sb2','sb4','sb5')">do ~while</button>
				<button class="menu_box" onclick="changeDivDisplay('sb4','sb1','sb2','sb3','sb5')">for</button>
				<button class="menu_box" onclick="changeDivDisplay('sb5','sb1','sb2','sb3','sb4')">switch</button>
			</div>
			<script>
				function changeDivDisplay(divName, divOtherName1 ,divOtherName2 ,divOtherName3 ,divOtherName4) 
				{
					var divObj = document.getElementById(divName);
					var divObj2 = document.getElementById(divOtherName1);
					var divObj3 = document.getElementById(divOtherName2);
					var divObj4 = document.getElementById(divOtherName3);
					var divObj5 = document.getElementById(divOtherName4);
					
					if(divObj.style.display == "none") {
						divObj.style.display = "block";
						divObj2.style.display = "none";
						divObj3.style.display = "none";
						divObj4.style.display = "none";
						divObj5.style.display = "none";
					}
					else if (divObj2.style.display == "none" && divObj3.style.display== "none" && divObj4.style.display == "none" && divObj5.style.display== "none"){
						divObj.style.display = "block";
					}
					else {
						divObj.style.display = "none";
					}
				}
			</script>
		</div>
		<div id="right_box">
			<div class="pink_memo">
				<p>파란 버튼을 누르면 설명이 나옵니다.</p>
			</div>
			<span>
				<a href="selection.jsp" class="toNext" style="float:right; height:80px;">선택 화면 가기</a>
			</span>
			<div id="sb1">
				<p>if else 란 무엇인가?</p>
				<p>
				조건문<br/> 말 그대로 특정 조건에 대해서 참과 거짓에 대한 기능을 정할 수 있는 문법이다. C에서는 if와 switch, goto 등으로 할 수 있으며, goto는 사용하는 것을 권장하지 않는다.<br/>
				if()<br/>구조는 if(조건식){함수들}으로 구성되며, 조건식이 참일때에만 함수들이 실행된다.<br/>if(num>=5)<br/>{<br/><br/>	printf("%d",num);<br/>}<br/>
				if문의 예시이다. 조건문이 true이면, 즉 변수 num이 값이 5 이상이면 중괄호 내의 printf함수가 실행된다.<br/>보면 알겠지만 if에는 세미콜론이 붙지 않는다.<br/>if(num>=5)<br/>{<br/>
				<br/>	printf("%d",num);<br/>}<br/><br/>else<br/>{<br/>	num+= 5;<br/>	printf("%d",num);<br/>}<br/><br/>if else 문이다.<br/>else는 if의 조건이 false일 경우 실행된다.<br/>
				if와 마찬가지로 세미콜론은 붙지 않는다.<br/>	</p>
			</div>
			<div id="sb2">
				<p>while 란 무엇인가?</p>
			</div>
			<div id="sb3">
				<p>do ~while 란 무엇인가?</p>
			</div>
			<div id="sb4">
				<p>for 란 무엇인가?</p>
				<p>for()<br/>
				for도 while처럼 ~하는 동안이라는 의미가 있다. 이것 또한 조건이 참인 동안 반복하는 반복문이다.<br/>
				for과 while중 어느것이 더 좋다고는 할 수 없지만, 상황에 따라 for이 더 좋을때도 있으므로 둘 다 알아두면 좋다.<br/><br/>
				for문의 구조는<br/>
				for(초기값;조건값;증감값){함수내용}이다.<br/>
				int sum = 0;<br/><br/>
				for(int i = 0; i<5; i++)<br/>
				{<br/>
					sum+=i;<br/>
				}<br/>
				// 반복하고싶은 코드가 한줄이라면 {}는 생략이 가능하다.<br/><br/>
				
				중복 for<br/>
				for문도 while문과 마찬가지로 중복이 가능하다.<br/>
				가장 간단한 예로 9X9단이 있다.<br/>
				<br/>
				break;<br/>
				반복문이 특정 조건을 맞췄을 경우 종료하고 싶다면 break;를 쓰면 된다.<br/>
				while과 마찬가지로 for에서도 break는 가장 가까운 자신을 둘러싼 반복문을 종료한다.</p>
				
				
			</div>
			<div id="sb5">
				<p>switch 란 무엇인가?</p>
			</div>
		</div>
	</div>
</body>
</html>
