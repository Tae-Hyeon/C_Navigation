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
	String fmemo[] = new String[mfnum];
	String initcode = "['";
	String initfname = "['";
	String initfmemo = "['";
	if(isLogin == true){
		if(isLogin == true){
			for(int i = 0; i<mfnum;i++){
				code[i]=(String)session.getAttribute("s_code"+i+1);
				fname[i]=(String)session.getAttribute("s_mfname"+i+1);
				fmemo[i]=(String)session.getAttribute("s_mfmemo"+i+1);
				if(code[i]==null){
					code[i] = "";
				}
				if(fname[i]==null){
					fname[i] = "";
				}
				if(fmemo[i]==null){
					fmemo[i] = "";
				}
				initcode += code[i];
				initfname += fname[i];
				initfmemo += fmemo[i];
				if(i < mfnum-1){
					initcode += "','";
					initfname += "','";
					initfmemo += "','";
				}
			}
			initcode += "']";
			initfname += "']";
			initfmemo += "']";
		}
	}
	System.out.println(initcode);
	System.out.println(initfname);
	System.out.println(initfmemo);
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
	var fmemo = <%=initfmemo%>;
		
	if(isLogin == true){
		if(codenum>0){
			for(var i=0;i<codenum;i++){
				var str = i+1;
				str = str.toString();
				document.getElementById('c'+str).value = code[i];
				document.getElementById('f'+str).innerHTML = fname[i];
				document.getElementById('m'+str).innerHTML = fmemo[i];
			}
		}
	}
}
</script>
<title>C Navigation</title>
</head>
<body onload = "set_contents()">
	<div class="wrap_head">
		<a href="test_main.jsp"><img src="images/logo2.png" alt="To Main" height="130" width="400"></a>
	</div>
	<div class="main">
		<form action = "func_jsp/test_user_codeinsert.jsp" method="post">
		<div class="left_box">
			<input type="hidden" id="codenum" name="codenum" value="1">
			<ul>
			<li id = 'f1'></li>
			</ul>
			<div id = 'open1'><a href="#" onclick="memo_open_close('close1', 'open1')">메모 보기</a></div>
			<div id = 'close1' style = "display: none;">
			<a href="#" onclick="memo_open_close('open1','close1')" >메모 닫기</a>
			<h4 id = 'm1'></h4>
			</div>
			<textarea class="gray_input_area" id = "c1" name ="c1"></textarea>
			<input type="submit" class="toSave" value = "SAVE">
		</div>
		</form>
		<form action = "func_jsp/test_user_codeinsert.jsp" method="post">
		<div class="mid_box">
			<input type="hidden" id="codenum" name="codenum" value="2">
			<ul>
			<li id = 'f2'></li>
			</ul>
			<div id = 'open2'><a href="#" onclick="memo_open_close('close2', 'open2')">메모 보기</a></div>
			<div id = 'close2' style = "display: none;">
			<a href="#" onclick="memo_open_close('open2','close2')" >메모 닫기</a>
			<h4 id = 'm2'></h4>
			</div>
			<textarea class="gray_input_area" id = "c2" name ="c2"></textarea>
			<input type="submit" class="toSave" value = "SAVE">
		</div>
		</form>
		<form action = "func_jsp/test_user_codeinsert.jsp" method="post">
		<div class="right_box">
			<input type="hidden" id="codenum" name="codenum" value="3">
			<ul>
			<li id = 'f3'></li>
			</ul>
			<div id = 'open3'><a href="#" onclick="memo_open_close('close3', 'open3')">메모 보기</a></div>
			<div id = 'close3' style = "display: none;">
			<a href="#" onclick="memo_open_close('open3','close3')" >메모 닫기</a>
			<h4 id = 'm3'></h4>
			</div>
			<textarea class="gray_input_area" id = "c3" name ="c3"></textarea>
			<input type="submit" class="toSave" value = "SAVE">
			<br /><br />
			<a href="test_programing.jsp" class="toNext" style="float : right;">완성하러 가기</a>
		</div>
		</form>
		<div id="sideNavi">
			<div class="side-navi-item item1"><div>
			예시 보기
			</div></div>
			<div class="side-navi-data">
				<p>출력기능
				//이용자 입력 유도 출력<br/><br/><br>
					printf("사칙연산하는 프로그램입니다\n");<br/><br/>
					printf("계산하려는 수식(예: 10 + 20)을 입력하세요:");<br/><br/>
					scanf("%d%c%d", &num1, &operater, &num2);<br/><br/>
				</p>
			</div>
		</div>
	</div>
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
</body>
</html>
