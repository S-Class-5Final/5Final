<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Single+Day&display=swap&subset=korean" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AMANDA - 좋아요 리스트</title>
<style>
::-webkit-scrollbar {
	display: none;
}
.topList{
	border: 1px solid #e8e8e8;
	margin: auto;
	margin-top: 3%;
	width: 800px;
	height: 900px;
	overflow: auto;
	border-radius: 10px;
}

.Lists{
	border: 1px solid #e8e8e8;
	margin: auto;
	margin-top: 3%;
	width: 800px;
	height: 600px;
	overflow: auto;
	border-radius: 10px;
}
.Lists2{
	border: 1px solid #e8e8e8;
	margin: auto;
	margin-top: 3%;
	width: 800px;
	height: 900px;
	overflow: auto;
	border-radius: 10px;
}


.card {
	position: relative;
	width: 13rem; 
	height: 10rem;
	perspective: 30rem;
	display: inline-block;
	margin: 4%;
	margin-left: 8.5%;
	margin-bottom: 25%;
}

.front, .back {
	position: absolute;
	width: 200px; height: 300px;
	transition: transform 1.3s;
	backface-visibility:hidden;
	border-radius: 20px;
	text-align: center;
}
.front {
	background-color: #FBBFBF;
	opacity: 0.8;
}
.back {
	background-color: #FBBFBF;
	transform: rotateY(180deg); 
}
.card:hover .front{ transform: rotateY(180deg); }
.card:hover .back { transform: rotateY(360deg); }

.card2 {
	position: relative;
	width: 13rem; height: 10rem;
	perspective: 30rem;
	display: inline-block;
	margin: 4%;
	margin-left: 8.5%;
	margin-bottom: 25%;
}
.front2, .back2 {
	position: absolute;
	width: 200px; height: 300px;
	transition: transform 1.3s;
	backface-visibility:hidden;
	border-radius: 20px;
	text-align: center;
}
.front2 {
	/* background-image: url("resources/images/front.jpg"); */
	background-color: #5AAEFF;
	opacity: 0.8;
}
.back2 {
	/* background-image: url("resources/images/front.jpg"); */
	background-color: #5AAEFF;
	transform: rotateY(180deg); 
}
.card2:hover .front2{ 
	transform: rotateY(180deg); 
}
.card2:hover .back2 { 
	transform: rotateY(360deg); 
}

.card3 {
	position: relative;
	width: 13rem; height: 10rem;
	perspective: 30rem;
	display: inline-block;
	margin: 4%;
	margin-left: 8.5%;
	margin-bottom: 25%;
}
.front3, .back3 {
	position: absolute;
	width: 200px; height: 300px;
	transition: transform 1.3s;
	backface-visibility:hidden;
	border-radius: 20px;
	text-align: center;
}
.front3 {
	/* background-image: url("resources/images/front.jpg"); */
	background-color: #B95AFF;
	opacity: 0.8;
}
.back3 {
	/* background-image: url("resources/images/front.jpg"); */
	background-color: #B95AFF;
	transform: rotateY(180deg); 
}
.card3:hover .front3{ 
	transform: rotateY(180deg); 
}
.card3:hover .back3 { 
	transform: rotateY(360deg); 
}


.imgs{
	margin-top: 5%;
	width: 180px;
	height: 278px;
	border-radius: 10px;
}
::-webkit-scrollbar {
	display: none;
}
.allArea{
	width: 860px; 
	height: 700px; 
	margin-left:37%; 
	border: 1px solid #e8e8e8; 
	border-radius: 10px; 
	overflow: auto;
	margin-top: 5%;
}
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
	color: #FF7EFF;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
.tabs:checked+.tabLa {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #FF7EFF;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, 
#tab2:checked ~ #content2,
#tab3:checked ~ #content3,
#tab4:checked ~ #content4 {
	display: block;
}
.tableInfo1{
	margin: auto;
	margin-top: 10%;
	margin-left: 5%;
}
.tdInfo{
	width: 65px;
	margin-top: 3%;
	text-align: right;
	font-family: 'Single Day', cursive;
	font-size: 20px;
}
.msgInput{
	margin-top: 65%;
	margin-left: 3%;
	border-radius: 5px;
	background: #FF4848;
	outline: none;
	border: 1px solid #FF4848;
}
.msgInput2{
	margin-top: 65%;
	margin-left: 3%;
	border-radius: 5px;
	background: #4978FF;
	outline: none;
	border: 1px solid #4978FF;
}
.tdInfo2{
	width: 120px;
	text-align: center;
	height: 25px;
	font-family: 'Single Day', cursive;
	font-size: 20px;
}
.indiv{
	border: 1xp solid red;
	width: 300px;
	height: 100px;
}
.topImg{
	width: 50px;
	height: 50px;
	position: absolute;
	margin-right: 100%;
	margin-top: 1%;
}
.topImg2{
	width: 48px;
	height: 48px;
	position: absolute;
	margin-right: 100%;
	margin-top: 3%;
}
.topImg3{
	width: 48px;
	height: 48px;
	position: absolute;
	margin-right: 100%;
	margin-top: 5%;
	margin-left: 3%;
}

.oneline{
	font-family: 'Single Day', cursive;
	font-size: 20px;
}
.oneline2{
	font-family: 'Single Day', cursive;
	font-size: 18px;
}
</style>
</head>
<body>
<jsp:include page="../common/matchingMenu.jsp"/>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">☰ AMANDA</span>
	<div class ="allArea">
		<div class="tabInfo">
	    <input class="tabs" id="tab1" type="radio" name="tabs" checked>
	    <label class="tabLa" for="tab1">받은 좋아요</label>
	
	    <input class="tabs" id="tab2" type="radio" name="tabs">
	    <label class="tabLa" for="tab2">보낸 좋아요</label>
	    
	    <input class="tabs" id="tab3" type="radio" name="tabs">
	    <label class="tabLa" for="tab3">나의 매칭</label>
	
	    <section id="content1" class="tabList">
			<div id="List" class="Lists">
				
			</div>
	    </section>
	
	    <section id="content2" class="tabList">
			<div id="List2" class="Lists">
			
			</div>
	    </section>
	    	
	    <section id="content3" class="tabList">
			<div class="topList" id="matchList">
				
			</div>
	    </section>
		</div>
	</div>

	<form action="messageSend.do" method="post" id="messagsSend">
		<div class="modal fade" id="layerpop">
			<div class="modal-dialog" style="margin: auto; margin-top: 10%">
				<div class="modal-content" style="width: 600px; height: 460px;">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title" style="margin-left: 43%;">쪽지 보내기</h4>
						<input type="hidden" value="${sessionScope.loginUser.user_id}" name="userId" id="userId"> <!-- 보낸사람 -->
						<input type="hidden" id="toUserId" value="" name="toUserId"> <!-- 받는사람 -->
						<input type="hidden" id="uMid" value="${sessionScope.loginUser.u_mid}" name="uMid"> <!-- uMid -->
					</div>

					<!-- body -->
				
					<div class="modal-body" id="modal">
						<table>
							<tr>
								<td style="width: 200px; text-align: center">
									제목 &nbsp;
								</td>
								<td>
									<input type="text" style="width: 420px; margin-top: 3%;" name="mTitle"> <br><br>
								</td>
							</tr>
							<tr>
								<td style="width: 200px; text-align: center">
									내용 &nbsp;
								</td>
								<td>
									<textarea style="width:420px; height: 150px; resize: none;" name="mContent"></textarea>
								</td>
							</tr>
						</table>
						
					</div>
					
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
						<button type="button" class="btn btn-default" id="msgGo">전송하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<script>
		function likeList(){
			$.ajax({
				url:"likeTo.do",
				data:{user_id: "${sessionScope.loginUser.user_id}"},
				success:function(data){
					$div = $("#List");
					$div.html("");
				
					for(var i in data.info){
							$("<div class='card' id='card'>"
							+"<div class='front' id='front' onclick='front()'>"
							+"<img class='topImg' src='resources/images/heart.png'>"							
							+"<img class='imgs'src='resources/userface/"+data.image[i].renameFileName+"'>"
							+"</div>"
							+"<div class='back' id='back()'>"
							+"<div class='indiv'>"
							+"<table class='tableInfo1'>"
							+"<tr class='trInfo'>"
							+"<td class='tdInfo'>닉네임 : </td>"
							+"<td class='tdInfo2'>"+ data.info[i].user_nick  +"</td>"
							+"</tr>"
							+"<tr class='trInfo'>"
							+"<td class='tdInfo'>성별 : </td>"
							+"<td class='tdInfo2'>"+ data.info[i].gender  +"</td>"
							+"</tr>"
							+"<tr class='trInfo'>"
							+"<td class='tdInfo'>나이 : </td>"
							+"<td class='tdInfo2'>"+ data.info[i].age  +"</td>"
							+"</tr>"
							+"<tr class='trInfo'>"
							+"<td class='tdInfo'>키 : </td>"
							+"<td class='tdInfo2'>"+ data.info[i].height  +"</td>"
							+"</tr>"
							+"</table>"
							+"<br>"
							+"<p class='oneline' style='margin-right:30%; margin-bottom:1%'>＊ 한줄 소개 ＊</p> <br>" 
							+"<p class='oneline2' style='margin-right:30%; margin-top:1%'>"
							+ data.info[i].user_into
							+"</p>"
							+"</div>"
							+"<input id='gogo' value='쪽지 보내기' class='msgInput' type='button' onclick='messageGo("+'"'+data.info[i].user_id+'"'+")'>"
							+"<input id='gogo' value='좋아요' class='msgInput' type='button' onclick='LikeGo("+'"'+data.info[i].user_id+'"'+")'>"
							+"</div>"
							+"</div>").prependTo("#List");
					}
				},
			});
		}
	
		 $(function(){
			likeList();
			likeList2();
			matchList();
			 setInterval(function(){
				likeList();
			}, 5000);
		});
	</script>
	<script>
		function likeList2(){
			$.ajax({
				url:"likeListTwo.do",
				dataType:"json",
				data:{user_id: "${sessionScope.loginUser.user_id}"},
				success:function(data){
					$div = $("#List2");
					$div.html("");
					for(var i in data.info1){
						$("<div class='card2'>"
						+"<div class='front2'>"
						+"<img class='topImg2' src='resources/images/blueheart.png'>"							
						+"<img class='imgs'src='resources/userface/"+data.image1[i].renameFileName+"'>"
						+"</div>"
						+"<div class='back2'>"
						+"<div class='indiv'>"
						+"<table class='tableInfo1'>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>닉네임 : </td>"
						+"<td class='tdInfo2'>"+ data.info1[i].user_nick  +"</td>"
						+"</tr>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>성별 : </td>"
						+"<td class='tdInfo2'>"+ data.info1[i].gender  +"</td>"
						+"</tr>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>나이 : </td>"
						+"<td class='tdInfo2'>"+ data.info1[i].age  +"</td>"
						+"</tr>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>키 : </td>"
						+"<td class='tdInfo2'>"+ data.info1[i].height  +"</td>"
						+"</tr>"
						+"</table>"
						+"<br>"
						+"<p class='oneline' style='margin-right:30%; margin-bottom:1%'>＊ 한줄 소개 ＊</p> <br>" 
						+"<p class='oneline2' style='margin-right:30%; margin-top:1%'>"
						+ data.info1[i].user_into
						+"</p>"
						+"</div>"
						+"<input id='gogo' value='쪽지 보내기' class='msgInput2' type='button' onclick='messageGo("+'"'+data.info1[i].user_id+'"'+")'>"
						+"<input id='gogo' value='좋아요 취소' class='msgInput2' type='button' onclick='LikeBack("+'"'+data.info1[i].user_id+'"'+")'>"
						+"</div>"
						+"</div>").prependTo("#List2");
				}
				},
			});
		}
		  $(function(){
			 setInterval(function(){
				likeList2();
			}, 5000);
		});
	</script>
	
	<script>
		function messageGo(userid) {
			var test = userid;
			$("#toUserId").val(test);
			$('div.modal').modal();
		};
	</script>
		<script>
		$(function() {
			$("#msgGo").click(function () {
				$("#messagsSend").submit();
			});
		});
	</script>
	
	<script>
		function LikeGo(goLike) {
			var go = goLike;
			var sender = $("#userId").val();
			var uMid = $("#uMid").val();
			$.ajax({
				url:"LikeGo.do",
				type:"post",
				data:{receiver:go, uMid:uMid, sender:sender},
				success:function(data){
					if(data == "success"){
						likeList2();
						alert("좋아요를 눌렀습니다.");
						matchList()
					}else{
						alert("이미 좋아요를 누른 회원입니다.");
					}
				},
			});
		}
		
		function LikeBack(backLike) {
			var back = backLike;
			var sender = $("#userId").val();
			$.ajax({
				url:"LikeBack.do",
				type:"post",
				data:{receiver:back, sender:sender},
				success:function(data){
					if(data=="ok"){
						likeList2();
						alert("좋아요가 취소되었습니다.");
						matchList();
					}
				}
			});
		};
	</script>
	
	<script>
		function matchList(){
			$.ajax({
				url:"matchList.do",
				dataType:"json",
				data:{user_id: "${sessionScope.loginUser.user_id}"},
				success:function(data){
					$div = $("#matchList");
					$div.html("");
					
					for(var i in data.match){
						$("<div class='card3'>"
						+"<div class='front3'>"
						+"<img class='topImg3' src='resources/images/couple.png'>"							
						+"<img class='imgs'src='resources/userface/"+data.matchImg[i].renameFileName+"'>"
						+"</div>"
						+"<div class='back3'>"
						+"<div class='indiv'>"
						+"<table class='tableInfo1'>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>닉네임 : </td>"
						+"<td class='tdInfo2'>"+ data.match[i].user_nick  +"</td>"
						+"</tr>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>성별 : </td>"
						+"<td class='tdInfo2'>"+ data.match[i].gender  +"</td>"
						+"</tr>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>나이 : </td>"
						+"<td class='tdInfo2'>"+ data.match[i].age  +"</td>"
						+"</tr>"
						+"<tr class='trInfo'>"
						+"<td class='tdInfo'>키 : </td>"
						+"<td class='tdInfo2'>"+ data.match[i].height  +"</td>"
						+"</tr>"
						+"</table>"
						+"<br>"
						+"<p class='oneline' style='margin-right:30%; margin-bottom:1%'>＊ 한줄 소개 ＊</p> <br>" 
						+"<p class='oneline2' style='margin-right:30%; margin-top:1%'>"
						+ data.match[i].user_into
						+"</p>"
						+"</div>"
						+"<input id='gogo' value='쪽지 보내기' class='msgInput2' type='button' onclick='messageGo("+'"'+data.match[i].user_id+'"'+")'>"
						+"<input id='gogo' value='매칭 끊기' class='msgInput2' type='button' onclick='LikeBack("+'"'+data.match[i].user_id+'"'+")'>"
						+"</div>"
						+"</div>").appendTo("#matchList");
				}
				},
			});
		}
		
		  $(function(){
			 setInterval(function(){
				matchList()
			}, 5000);
		});
	</script>
	<script>
		
	
	</script>
	
</body>
</html>