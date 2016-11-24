<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String membername=(String)session.getAttribute("s_username");
	boolean isLogin = (membername ==null || membername =="")? false:true;
	boolean isChecked = false;
	if(session.getAttribute("isChecked")!=null || session.getAttribute("isChecked")!=""){
		isChecked = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="style2div.css">
<link rel="stylesheet" type="text/css" href="SideNavi/sidenavi-right.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="SideNavi/SideNavi.js"></script>
<script>
function set_contents(){
	if(<%=isChecked%>==false && <%=isLogin%>==true){
		document.dfcheck.submit();
		System.out.println("isChecked : "+isChecked);
	}
<%
	int dfnum = 0;
	if(isLogin == true){
		System.out.println("dfnum : "+Integer.parseInt(String.valueOf(session.getAttribute("s_dfnum"))));
		dfnum = Integer.parseInt(String.valueOf(session.getAttribute("s_dfnum")));
	}
	String[] dfname= new String[dfnum];
	String[] dfmemo= new String[dfnum];
	if(isLogin == true){
		System.out.println("rownum :"+request.getParameter("rownum"));
		int rownum = 3;
		for(int i = 0; i<dfnum; i++){
			System.out.println("dfname[] : "+(String)session.getAttribute("s_dfname"+i+1)+", dfmemo[] : "+(String)session.getAttribute("s_dfmemo"+i+1));
		}
		for(int i = 0; i<dfnum;i++){
			dfname[i]=(String)session.getAttribute("s_dfname"+i+1);
			dfmemo[i]=(String)session.getAttribute("s_dfmemo"+i+1);
			System.out.println("dfname[] : "+dfname[i]+", dfmemo[] : "+dfmemo[i]);
		}
	}
%>
	if(<%=isLogin%> == true){
		var dfnum = <%=dfnum%>;
		if(dfnum>0){
			for(var i=dfnum;i>3;i--){
				add_row();	
			}
			<%for(int i=0;i<dfnum;i++){%>
				document.getElementById('f'+<%=i+1%>).value = <%=dfname[i]%>;
				document.getElementById('m'+<%=i+1%>).value = <%=dfmemo[i]%>;
			<%}%>
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
		<a href="test_main.jsp"><img src="images/logo2.png" alt="To Main" height="130" width="400"></a>
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
			<form action="test_set_dfcontents.jsp" method ="post" name="dfcheck"></form>
			<form action="test_user_dfinsert.jsp" method ="post">
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
						<td><input type="text" name="f2" class="function_in_table"></td>
						<td><textarea name="m2" class="memo_in_table"></textarea></td>
					</tr>
					<tr id = "myRow">
						<th>3.</th>
						<td><input type="text" name="f3" class="function_in_table"></td>
						<td><textarea name="m3" class="memo_in_table"></textarea></td>
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
									<td>수식 판단 기능</td>
									<td>입력된 값과 수식 판단 기능<br />조건문을 통해 판단</td>
								</tr>
								<tr>
									<th>2.</th>
									<td>결과 계산 기능</td>
									<td>수식 판단을 토대로 계산</td>
								</tr>
								<tr>
									<th>3.</th>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<a href="test_coding.jsp" class="toNext" style="width: 200px; float:right;">기능 분석하러 가기</a>
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
		document.getElementById("rownum").value = rownum;
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