<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String membername=(String)session.getAttribute("s_username");
	boolean isLogin = (membername ==null || membername =="")? false:true;
	
	int mfnum = 0;
	if(isLogin == true){
		System.out.println("mfnum : "+Integer.parseInt(String.valueOf(session.getAttribute("s_mfnum"))));
		mfnum = Integer.parseInt(String.valueOf(session.getAttribute("s_mfnum")));
	}
	String fname[] = new String[mfnum];
	String fmemo[] = new String[mfnum];
	String initfname = "['";
	String initfmemo = "['";
	if(isLogin == true){
		System.out.println("rownum :"+request.getParameter("rownum"));
		int rownum = 3;
		for(int i = 0; i<mfnum;i++){
			fname[i]=(String)session.getAttribute("s_mfname"+i+1);
			fmemo[i]=(String)session.getAttribute("s_mfmemo"+i+1);
			if(fname[i]==null){
				fname[i] = "";
			}
			if(fmemo[i]==null){
				fmemo[i] = "";
			}
			System.out.println("fname[] : "+fname[i]+", fmemo[] : "+fmemo[i]);
			initfname += fname[i];
			initfmemo += fmemo[i];
			if(i < mfnum-1){
				initfname += "','";
				initfmemo += "','";
			}
		}
		initfname += "']";
		initfmemo += "']";
	}
	System.out.println("initfname :"+ initfname);
	System.out.println("initfmemo :"+ initfmemo);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="style2div.css">
<link rel="stylesheet" type="text/css" href="SideNavi/sidenavi-right.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="SideNavi/SideNavi.js"></script>
<script type="text/javascript">
function set_contents(){
	var isLogin = <%=isLogin%>;
	var mfnum = <%=mfnum%>;
	var fname = <%=initfname%>;
	var fmemo = <%=initfmemo%>;

	if(isLogin == true){
		if(mfnum>0){
			for(var i=mfnum;i>3;i--){
				add_row();	
			}
			for(var i=0;i<mfnum;i++){
				var str = i+1;
				str = str.toString();
				document.getElementById('f'+str).value = fname[i];
				document.getElementById('m'+str).value = fmemo[i];
			}
		}
	}
}
</script>
<style>
	input[type=text]:-ms-clear { display:none; }
</style>
<title>C Navigation</title>
</head>
<body onload="set_contents()">
	<div class="logo">
		<a href="main.jsp"><img src="images/logo2.png" alt="To Main" height="130" width="400"></a>
	</div>
	<div class="main">
		<div class="left_box">
			<h1>계산기를 분석해보자!</h1><br /><br />
            <img src="images/calculater_120x160.jpg"><br /><br />
            <p>143+ 295*15=??? 어렵다</p>
            <p>계산기는 우리가 입력한값과 더하기 빼기와 같이 우리가 입력한 연산자를 통해 식을 계산해주고 그 과정과 결과를 보여줍니다.</p>
            <p>그렇다면 이런 계산기에 필요한 기능들은 어떤 것들이 있을까요??</p>
		</div>
		<div class="right_box" style="text-align:center">
			<h2>필요한 기능 적어보기</h2>

			<form action="func_jsp/user_mfinsert.jsp" method ="post">
			<table class="function_table" id="input_function_table">
				<thead>
					<tr>
						<th width="50"></th>
						<th width="150">기능</th>
						<th width="200">메모</th>
					</tr>
				</thead>
				<tbody>	
					<tr>
						<th>1.</th>
						<td><input type="text" name="f1" id="f1" class="function_in_table"></td>
						<td><textarea name="m1" id="m1" class="memo_in_table"></textarea></td>
					</tr>
					<tr>
						<th>2.</th>
						<td><input type="text" name="f2" id="f2" class="function_in_table"></td>
						<td><textarea name="m2" id="m2" class="memo_in_table"></textarea></td>
					</tr>
					<tr id = "myRow">
						<th>3.</th>
						<td><input type="text" name="f3" id="f3" class="function_in_table"></td>
						<td><textarea name="m3" id="m3" class="memo_in_table"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="rownum" name="rownum" value="3">
			<input type="submit" id="save" onclick="change_to_edit()" value="save">
			</form>
			<button onclick="add_row()">추가하기</button>
			<button onclick="delete_row()">삭제하기</button>
			<div id="sideNavi">
				<div class="side-navi-item item1"><div>
				예시 보기
				</div></div>
				<div class="side-navi-data">
					<div>
						<table class="function_table">
							<thead>
								<tr>
									<th></th>
									<th width="150">기능</th>
									<th width="300">메모</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>1.</th>
									<td>입력 기능</td>
									<td>계산에 이용할 값, 하고싶은 계산 입략(+ - % 등)</td>
								</tr>
								<tr>
									<th>2.</th>
									<td>계산 기능</td>
									<td>입력을 토대로 계산</td>
								</tr>
								<tr>
									<th>3.</th>
									<td>출력 기능</td>
									<td>지시사항, 결과값 출력</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<a href="coding.jsp" class="toNext" style="width: 200px; float:right;">기능 분석하러 가기</a>
		</div>
	</div>
<script>
	var rownum=3;
	var time = 1;
	function add_row() {
		var mytable = document.getElementById('input_function_table');
		rownum = mytable.rows.length;
    	var newRow = mytable.insertRow(rownum);
    	var header = document.createElement("th");
    	document.getElementById("rownum").value = rownum;
    	header.innerHTML=rownum+'.';
    	newRow.appendChild(header);
    	newRow.insertCell(1).innerHTML = '<input type="text" name="f'+rownum+'" id="f'+rownum+'" class="function_in_table">';
    	newRow.insertCell(2).innerHTML = '<textarea name="m'+rownum+'" id="m'+rownum+'" class="memo_in_table"></textarea>';
	}
	
	function delete_row() {
		var mytable = document.getElementById('input_function_table');
		var rownum = mytable.rows.length;
		document.getElementById("rownum").value = rownum-2;
	    if (rownum < 2) return;
	    	mytable.deleteRow(rownum-1);
	}
	function changeFunction(divName, divNameToChange) {
		var divObj = document.getElementById(divName);
		var divObj2 = document.getElementById(divNameToChange);
		
		divObj.style.display = "none";
		divObj2.style.display = "block";
	}
	function edit(id1, id2, tdid){
		var mytable = document.getElementById('input_function_table');
		var stAt1=document.getElementById(id1);
		var stAt2=document.getElementById(id2);
		rownum = mytable.rows.length;
		if (time==1){
			stAt1.setAttribute('disalbed',true);
			stAt2.disalbed = true;
		}
		else {
			stAt1.disalbed = false;
			stAt2.disalbed = false;
		}
	}
	</script>
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
	
	</script>
</body>
</html>