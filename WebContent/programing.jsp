<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String membername=(String)session.getAttribute("s_username");
	boolean isLogin = (membername ==null || membername =="")? false:true;
	
	int mfnum = 0;
	if(isLogin == true){
		mfnum = Integer.parseInt(String.valueOf(session.getAttribute("s_mfnum")));
		System.out.println("codenum : "+mfnum);
		mfnum = 3;
	}
	String code[] = new String[mfnum];
	String fname[] = new String[mfnum];
	String source = (String)session.getAttribute("s_source");
	String initcode = "['";
	String initfname = "['";
	if(isLogin == true){
		if(isLogin == true){
			for(int i = 0; i<mfnum;i++){
				code[i]=(String)session.getAttribute("s_code"+i+1);
				fname[i]=(String)session.getAttribute("s_mfname"+i+1);
				if(code[i]==null){
					code[i] = "";
				}
				if(fname[i]==null){
					fname[i] = "";
				}
				initcode += code[i];
				initfname += fname[i];
				if(i < mfnum-1){
					initcode += "','";
					initfname += "','";
				}
			}
			initcode += "']";
			initfname += "']";
		}
	}
	System.out.println(initcode);
	System.out.println(initfname);
	System.out.println("source: "+source);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="styletwo.css">
<link rel="stylesheet" type="text/css" href="SideNavi/sidenavi-right.css">
<script>
function set_contents(){
	var isLogin = <%=isLogin%>;
	var codenum = <%=mfnum%>;
	var code = <%=initcode%>;
	var fname = <%=initfname%>;
	var source = "<%=source%>";
	
	if(isLogin == true){
		if(codenum>0){
			for(var i=0;i<codenum;i++){
				var str = i+1;
				str = str.toString();
				document.getElementById('c'+str).innerHTML = code[i];
				document.getElementById('f'+str).innerHTML = fname[i];
			}
		}
		document.getElementById('source').value = source;
	}
}
</script>
<title>C Navigation</title>
</head>
<body onload = "set_contents()">
	<div class="wrap_head">
		<a href="main.jsp"><img src="images/logo2.png" alt="To Main" height="130" width="400"></a>
	</div>
	<div class="main">
		<div class="left_box">
			<h2>코드를 합쳐봅시다.</h2>
			<div id = 'open1'><button onclick="memo_open_close('close1', 'open1')">기능 1 열기</button></div>
			<div id = 'close1' style = "display: none;">
			<button onclick="memo_open_close('open1','close1')" >기능 1 닫기</button>
			<h2 id = 'f1'></h2>
			<h4 id = 'c1'></h4>
			</div>
			<div id = 'open2'><button onclick="memo_open_close('close2', 'open2')">기능 2 열기</button></div>
			<div id = 'close2' style = "display: none;">
			<button onclick="memo_open_close('open2','close2')" >기능 2 닫기</button>
			<h2 id = 'f2'></h2>
			<h4 id = 'c2'></h4>
			</div>
			<div id = 'open3'><button onclick="memo_open_close('close3', 'open3')">기능 3 열기</button></div>
			<div id = 'close3' style = "display: none;">
			<button onclick="memo_open_close('open3','close3')" >기능 3 닫기</button>
			<h2 id = 'f3'></h2>
			<h4 id = 'c3'></h4>
			</div>
		</div>
		<form action="func_jsp/user_scinsert.jsp" method="post">
		<div class="mid_box" style = "width: 930px;">
			<ul>
			<li>완성 시키기</li>
			</ul>
			<textarea class="gray_input_area" id='source' name='source'></textarea><br />
			<button class="toSave">SAVE</button><br/>
			<a href="selection.jsp" class="toNext" style="float:right;">선택창가기</a>
		</div>
		</form>
		<div id="sideNavi">
			<div class="side-navi-item item1"><div>
			예시 보기
			</div></div>
			<div class="side-navi-data">
				<p>#include &#60;stdio.h&#62; <br/><br/>

int main(void)<br/>
{<br/>
&#09;char operater;<br/>
&#09;int num1, num2;<br/>
&#09;printf("사칙연산하는 프로그램입니다\n");<br/>
&#09;printf("계산하려는 수식(예: 10 + 20)을 입력하세요:");<br/>
&#09;scanf("%d%c%d", &num1, &operater, &num2);<br/>
<br/>
&#09;switch (operater)<br/>
&#09;{<br/>
&#09;case '+':<br/>
&#09;&#09;printf("더하기 결과는 %d입니다. \n\n", num1 + num2);<br/>
&#09;&#09;break;<br/>
&#09;case '-':<br/>
&#09;&#09;printf("빼기 결과는 %d입니다. \n\n", num1 - num2);<br/>
&#09;&#09;break;<br/>
&#09;case '/':<br/>
&#09;&#09;printf("나누기 결과는 %d입니다. \n\n", num1 / num2);<br/>
&#09;&#09;break;<br/>
&#09;case '%':<br/>
&#09;&#09;printf("나머지는 %d입니다. \n\n", num1 % num2);<br/>
&#09;&#09;break;<br/>
&#09;}<br/>
}<br/></p>
			</div>
		</div>
	</div>
</body>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="SideNavi/SideNavi.js"></script>
<script type="text/javascript">

        $(document).ready( function () {
            /**
             *  init sidenavi
             *  first param String direction left or right
             *  second param conf Object css data
             **/
            SideNavi.init('right', {
                container : '#sideNavi',
                item : '.side-navi-item',
                data : '.side-navi-data',
                tab : '.side-navi-tab',
                active : '.active'
            });

        });
        function memo_open_close(divO, divC) {
    		var divtoOpen = document.getElementById(divO);
    		var divtoClose = document.getElementById(divC);
    		if (divtoOpen.style.display == "none"){
    			divtoOpen.style.display = "block";
    			divtoClose.style.display = "none";
    		}
    		else{
    			divtoClose.style.display = "block";
    			divtoOpen.style.display = "none";
    		}
    	}
</script>
</html>