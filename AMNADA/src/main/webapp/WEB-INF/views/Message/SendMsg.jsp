<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>AMANDA - 쪽지함</title>
<style>

.tabInfo {
	min-width: 280px;
	max-width: 800px;
	background: #ffffff;
	margin: auto;
	margin-top: 3%;
}

.tabList {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
.tabs {
	display: none;
}

.tabLa {
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

.tabLa:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
.tabs:checked+.tabLa {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2 {
	display: block;
}
.userIds{
	height: 30px;
	margin-top: 3%;
}

.headList{
	border-bottom: 1px solid #E0F2FE;
}
.trInfo:hover{
	background: #E0F2FE;
	cursor: pointer;
}
.con{
	border: 1px solid #E0F2FE;
	border-radius: 5px;
}
::-webkit-scrollbar {
	display: none;
}
.allArea{
	width: 860px; 
	height: 500px; 
	margin-left:37%; 
	border: 1px solid #e8e8e8; 
	border-radius: 10px; 
	overflow: auto;
	margin-top: 5%;
}

</style>
</head>
<body>
<jsp:include page="../common/matchingMenu.jsp"/>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">☰ AMANDA</span>
	<div class ="allArea">
		<div class="tabInfo">
	    <input class="tabs" id="tab1" type="radio" name="tabs" checked>
	    <label class="tabLa" for="tab1">받은 쪽지</label>
	
	    <input class="tabs" id="tab2" type="radio" name="tabs">
	    <label class="tabLa" for="tab2">보낸 쪽지</label>
	
	
	    <section id="content1" class="tabList">
				<table align="center" id="sendList" cellspacing="0" width="800" class="con">
					<thead>
						<tr>
							<th class="headList">보낸 사람</th>
							<th class="headList">쪽지 제목</th>
							<th class="headList">받은 날짜</th>
							<th class="headList">수신 여부</th>
						</tr>
					</thead>
					
					<tbody style="text-align: center">
					
					
					</tbody>
				</table>
	    </section>
	
	    <section id="content2" class="tabList">
				<table align="center" id="sendFromList" cellspacing="0" width="800" class="con">
					<thead>
						<tr>
							<th class="headList">받는 사람</th>
							<th class="headList">쪽지 제목</th>
							<th class="headList">보낸 날짜</th>
							<th class="headList">수신 여부</th>
						</tr>
					</thead>
					<tbody style="text-align: center">
					
					
					</tbody>
				</table>
	    </section>
		</div>
	</div>


	<script>
	
		$(function (){
			selectMsg();
			selectMsg2();
		});
		setInterval(function(){
			selectMsg();
		}, 1000);
		
		setInterval(function(){
			selectMsg2();
		}, 1000);
		
	</script>
	
	<script>
	function selectMsg(){
		$.ajax({
			url:"sendMsg.do",
			dataType:"json",
			data:{userId:"${sessionScope.loginUser.user_id}"},
			type:"post",
			success:function(data){
				$tableBody = $("#sendList tbody");
				$tableBody.html("");
				
				var $td;
				var $mUserId;
				var $mTilte;
				var $mContent;
				var $mDate;
				
				if(data.length > 0){
					for(var i in data){
							$tr=$("<tr class='trInfo' onclick='Details(" + data[i].mNo + ")'>");
							$mUserId=$("<td class='userIds' width='100'>").text(data[i].userId);
							$mTilte=$("<td class='titevo' width='250'>").text(decodeURIComponent(data[i].mTitle.replace(/\+/g," ")));
							$mDate=$("<td class='datavo' width='100'>").text(data[i].mDate);
							$mRead=$("<td width='100'>").text(decodeURIComponent(data[i].mSusin.replace(/\+/g," ")));
							
							$tr.append($mUserId);
							$tr.append($mTilte);
							$tr.append($mDate);
							$tr.append($mRead);
							
							$tableBody.append($tr);
					}
					}else{
						
					}
				},
				error:function(request, status, errorData){
					/* alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData); */
				}
			});
		};
	</script>
	<script>
	function selectMsg2(){
		$.ajax({
			url:"sendFromMsg.do",
			dataType:"json",
			data:{userId:"${sessionScope.loginUser.user_id}"},
			type:"post",
			success:function(data){
				$tableBody = $("#sendFromList tbody");
				$tableBody.html("");
				
				var $td;
				var $mUserId;
				var $mTilte;
				var $mContent;
				var $mDate;
				
				if(data.length > 0){
					for(var i in data){
							$tr=$("<tr class='trInfo' onclick='DetailsTwo(" + data[i].mNo + ")'>");
							$mUserId=$("<td class='userIds' width='100'>").text(data[i].toUserId);
							$mTilte=$("<td class='titevo' width='250'>").text(decodeURIComponent(data[i].mTitle.replace(/\+/g," ")));
							$mDate=$("<td class='datavo' width='100'>").text(data[i].mDate);
							$mRead=$("<td width='100'>").text(decodeURIComponent(data[i].mSusin.replace(/\+/g," ")));
							
							$tr.append($mUserId);
							$tr.append($mTilte);
							$tr.append($mDate);
							$tr.append($mRead);
							
							$tableBody.append($tr);
					}
					}else{
						
					}
			},
			error:function(request, status, errorData){
				/* alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData); */
			}
		});
	};
	</script>
	
	<script type="text/javascript">
		function Details(mNo) {
			var mm = mNo
			window.open("susinone.do?mNo="+mm, "PopupWin", "width=450, height=370, menubar=no, status=no, toolbar=no, resizable=no, top=100, left=500");
		};
	</script>
	<script type="text/javascript">
		function DetailsTwo(mNo) {
			var mm = mNo
			window.open("susintwo.do?mNo="+mm, "PopupWin", "width=450, height=370, menubar=no, status=no, toolbar=no, resizable=no, top=100, left=500");
		};
	</script>
</body>
</html>