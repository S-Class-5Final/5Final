<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<title></title>

    <link type="text/css" href="resources/css/common.css" rel="stylesheet">
    <link type="text/css" href="resources/css/font.css" rel="stylesheet">
    <link type="text/css" href="resources/css/slick.css" rel="stylesheet">
    <link type="text/css" href="resources/css/style.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="resources/js/slick.js"></script>
    <script type="text/javascript" src="resources/js/jquery.bpop.js"></script>
    <script type="text/javascript" src="resources/js/delivery_hero.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
    <!-- 이메일 js -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script>
    <style>
.tImg {
	margin-left: 400px;
	margin-top: 300px;
	
}
#service {
	background: #e793f0;
}
#interview {
	background: blue;
}
/* 모달 css */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
	background-color: rgba(255, 255, 255, 0.9);
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.textbox {
	text-align: center;
}
#mainhr {
	border: 4px solid blue;
}
#infoView {
display: none;
}
#infoView1{
display: none;
}
#infoView2{
display: none;
}
#infoView3{
display: none;
}
#pwdCheckView{
display:none;
<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/master
}
</style>
</head>
<body>
<div class="wrap" id="wrap">
<div class="nav">
    <ul>
        <li class="active nav1"><a href="#visual" class="scroll"></a></li>
        <li class="nav2"><a href="#service" class="scroll"></a></li>
        <li class="nav3"><a href="#interview" class="scroll"></a></li>
        <li class="nav4"><a href="#notice" class="scroll"></a></li>
    </ul>
</div>

<div class="main container">
	<div class="section visual" id="visual">
		<div class="video_wrap">
			<video id="video" autoplay loop muted>
				<source src="resources/video/video.mp4" type="video/mp4">
			</video>
		</div>
		
		<div class="content">
			<div class="timg">					
				<img src="resources/images/mainImg.png" id = "myimg">
			</div>
	<!-- 모달창 연습 -->
			<div id="myModal" class="modal">
		<!-- Modal content -->
				<div class="modal-content">
					<div>
						<span class="close">&times;</span><br><br><br>
					</div>
			
					<div id="loginview">
					<form action="mlogin.do" method="post" id="loginviewform">
						<div class="textbox" id="divId">
							<input type="text" id ="loginId" name="loginId" data-rule-required="true" size="50px" placeholder="ex) OOOO@naver.com">
						</div>
						<br>
						<div class="textbox" id="divPassword">
							<input type="password" id="loginPwd" name="loginPwd" data-rule-required="true" size="65px" placeholder="비밀번호를 입력하세요">
						</div> 
						<br>
						<br>
						<div class="textbox" id="loginbtn">
							<button type="button" onclick="loginCheck()">Login</button>
						</div>
					</form>
						<br>
						<div class = "textbox" id="loginbtn">
							<button id="insertmemberview">회원가입</button> / <button type = "button" id="pwdCheck">비밀번호 찾기</button>
						</div>
					</div>
					
					<div id ="pwdCheckView">
					<form action="mSerchPwd.do" method = "post" id="SerchPwdForm">
 						<div class="textbox">
						<input type="text" id = "serchId" name="serchId" size="60px" placeholder="ex) OOOO@naver.com"> &nbsp;
						<input type="hidden" id="findPwd" name="findPwd">
						<button type="button" id="serchPwd" onclick="serchPwdbtn()">찾기</button>
					
						</div>
					</form>
					</div>
					
					<div id= "infoView">
					<form action="minsert.do" method="post" id="memberjoinForm" enctype="multipart/form-data" onsubmit = "toEnabled()">
						<div id="infoView1">
						<div id="checkId">
						아이디(ID) : <input type= "text" name = "user_id" id="user_id" oninput = "checkId()"> @
						<select id="email" name="email" style="width: 200">
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="1">직접입력</option>
						</select> &nbsp;&nbsp;
						<input type="text" name="user_email" id = "user_email" disabled> <br>
						<div id="checkIdtext">아이디를 입력 해주세요</div>
						</div><br>
						<div id="checkPwd">
						패스워드(PWD) : <input type = "password" name="user_pwd" id="user_pwd">&nbsp;&nbsp;
						패스워드 확인(PWD) : <input type = "password" name = "user_pwdC" id="user_pwdC"><br>
						<div id ="checkPwdtext">비밀번호를 입력하세요 </div>
						</div>
						<div id="checkNick">
						별명(Name) : <input type = "text" name="user_nick" id="user_nick"><br>
						<div id= "checkNicktext"></div>
						</div>
						성별 : 남 <input type="radio" name = "gender" class = "gender" value = "M" checked="checked"> &nbsp; 
						여 : <input type = "radio" name = "gender" class = "gender" value="F"><br>
						번호  : 
						<select id="phone1" name="phone1" style="width: 200">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
						</select> -
						<input type="text" name= "phone2" id="phone2"> - 
						<input type="text" name = "phone3" id="phone3"><br>
							<div class= "textbox" id="nextbtn">
								<button type="button" id="nextpage1">다음</button>
							</div>
						</div>
			
					<div id = "infoView2">
					키 : <input type="number" name="height" id= "height">&nbsp;
					나이 : <input type ="number" name="age" id = "age">&nbsp;
					사는곳 : <input type="text" name="address" id = "address"><br>
					
					동성 여부 : 예 : <input type="radio" name = "gay" class = "gay" value = "Y"> &nbsp; 
					아니오 : <input type = "radio" name = "gay" class = "gay" value="N" checked="checked"><br>
					한줄 소개 :  <input type= "text" name="user_into"><br>
						<div id = "hobby">
							취미 : 
							<input type="checkbox" id="movie" name = "movie" value = "Y">영화 &nbsp;
							<input type="checkbox" id="sing" name = "sing" value = "Y">노래 &nbsp;
							<input type="checkbox" id="game" name= "game" value = "Y">게임 &nbsp;<br>
							<input type="checkbox" id="jmt" name= "jmt" value = "Y">JMT &nbsp;
							<input type="checkbox" id="pet" name = "pet" value = "Y">애완동물 &nbsp;
							<input type="checkbox" id="cafe" name = "cafe" value = "Y">카페&nbsp;<br>
							<input type="checkbox" id="working" name = "working" value = "Y">산책&nbsp;
							<input type="checkbox" id="poto" name= "poto" value = "Y">사진&nbsp;
							<input type="checkbox" id="travel" name="travel" value = "Y">여행
						</div>
						<button type="button" id = "inforbtn">이전</button>
						<button type="button" id = "lastpage">다음</button>
					</div>
					
					<div id = "infoView3">
						<div id="Imglist"> 
							<div id="first">
								<img id = "firstImg" width="300" height="300">
							</div>
							<div id = "second">
								<img id= "secondImg" width ="300" height = "300">
							</div>
							<div id = "third">
								<img id= "thirdImg" width ="300" height = "300">
							</div>
						</div>
					<button type="button" id="nextpage">이전으로</button><br>
					<button type="button" id="minsertbtn" onclick="abc()">가입</button><br>
<!-- 						<div style="z-index: 100">
						<button type="button" id="nextpage">이전으로</button><br>
							<button type="button" id = "minsertbtn">회원 가입완료</button>
						</div> -->
						<div id = "fileArea" type ="hidden">
							<input type = "file" id="thumbnailImg1" multuple="multuple" name="thumbnailImg1" onchange="LoadImg(this,1)">
							<input type = "file" id="thumbnailImg2" multuple="multuple" name="thumbnailImg2" onchange="LoadImg(this,2)">
							<input type = "file" id="thumbnailImg3" multuple="multuple" name="thumbnailImg3" onchange="LoadImg(this,3)">
						</div>
						</div>
					</form>
				</div>
			</div>
		</div>
						<script>
<<<<<<< HEAD
=======



>>>>>>> refs/remotes/origin/master
				// Get the modal
		        var modal = document.getElementById('myModal');
		        var myimg = document.getElementById("myimg");
		        // Get the <span> element that closes the modal
		        var span = document.getElementsByClassName("close")[0];                                          
		        // When the user clicks on the button, open the modal 
		        
		        // 로그인 화면 
		        var loginview = document.getElementById('loginview');
		      	// 회원가입 화면
		        var infoView = document.getElementById('infoView');
		      
		        // 회원가입 버튼 눌렀을시
		        var insertmemberview = document.getElementById("insertmemberview");
		        // 비밀번호 찾기 
		        var pwdCheckView = document.getElementById("pwdCheckView");
		        
		        // 취미란
		        var nextpage1 = document.getElementById("nextpage1");
		        var nextpage = document.getElementById("nextpage");
		        
		        //회원가입처음 view
		        var infoView1 = document.getElementById('infoView1');
		        
		        // 회원가입취미 view
		        var infoView2 = document.getElementById('infoView2');
		        
		        // 회원가입 취미 view(이전)
		        var inforbtn = document.getElementById('inforbtn');
		    
		        
		        // 사진 넣는 곳 보내는 버튼
		        var lastpage = document.getElementById('lastpage');
		        //유효성 체크 var
		        var idUsable = false;
		        var pwdUsable = false;
		        var nickUsable = false;
		        var phoneUsable = false;
		        var heightUsable = false;
		        var ageUsable = false;
		        var addressUsable = false;
		        var imgtitle = false;
		        var imgsub = false;
		        var imgsp = false;
		        var imgcount = 0;
		        var Hobbycount = 0;
		        
		        myimg.onclick = function() {
		            modal.style.display = "block";
		            loginview.style.display = "block";
		        	infoView.style.display = "none";
		        }
		        
		        insertmemberview.onclick = function(){
		        	loginview.style.display = "none";
		        	infoView.style.display = "block";
		        	infoView1.style.display = "block";
		        	infoView2.style.display = "none";
		        	infoView3.style.display = "none";
		        }
		        
		        nextpage1.onclick=function(){
		        	if(idUsable ==true && pwdUsable ==true && nickUsable ==true && phoneUsable ==true){
		        	infoView1.style.display = "none";
		        	infoView2.style.display = "block";
		        	infoView3.style.display = "none";
		        	}else{
		        		if (idUsable == false) {
							alert('아이디를 확인해 주세요');
							insertmemberview.onclick();
							return false;
						}
<<<<<<< HEAD
						if (pwdUsable == false) {
							alert('비밀번호를 확인 해주세요');
							insertmemberview.onclick();
							return false;
						}
						if (nickUsable == false) {
							alert('닉네임을 확인해주세요');
							insertmemberview.onclick();
							return false;
						}
=======

						if (pwdUsable == false) {
							alert('비밀번호를 확인 해주세요');
							insertmemberview.onclick();
							return false;
						}

						if (nickUsable == false) {
							alert('닉네임을 확인해주세요');
							insertmemberview.onclick();
							return false;
						}

>>>>>>> refs/remotes/origin/master
						if (phoneUsable == false) {
							alert("휴대폰 확인");
							insertmemberview.onclick();
							return false;
						}
		        	}
		        } 
		        inforbtn.onclick=function(){
		        	infoView1.style.display = "block";
		        	infoView2.style.display = "none";
		        	infoView3.style.display = "none";
		        }
		        
		        lastpage.onclick=function(){
		        	if(phoneUsable ==true && heightUsable == true && ageUsable==true && addressUsable==true &&
		        			Hobbycount>=3)
		        	{
		        	infoView1.style.display = "none";
		        	infoView2.style.display = "none";
		        	infoView3.style.display = "block";
		        	}else{
<<<<<<< HEAD
						if (ageUsab == false) {
							alert("나이가 안써있어요!");
							return false;
							nextpage1.onclick();
						}
						if (heightUsable == false) {
							alert('키가 없어요 ㅠ');
							nextpage1.onclick();
							return false;
						}
=======


						if (ageUsab == false) {
							alert("나이가 안써있어요!");
							return false;
							nextpage1.onclick();
						}

						if (heightUsable == false) {
							alert('키가 없어요 ㅠ');
							nextpage1.onclick();
							return false;
						}

>>>>>>> refs/remotes/origin/master
						if (addressUsable == false) {
							alert('사는곳이 공백이네요');
							nextpage1.onclick();
							return false;
						}
						
		        		if (Hobbycount < 2) {
							alert("흥미는  3개 이상 눌러주시길 바랍니다.");
							nextpage1.onclick();
							return false;
						}
		        	}
		        }
		        
		        nextpage.onclick=function(){
		        	infoView1.style.display = "none";
		        	infoView2.style.display = "block";
		        	infoView3.style.display = "none";
		        }
		        pwdCheck.onclick=function(){
		        	loginview.style.display = "none";
		        	pwdCheckView.style.display = "block";
		        }
		        
		        // When the user clicks on <span> (x), close the modal
		        span.onclick = function() {
		            modal.style.display = "none";
		        }
		        // When the user clicks anywhere outside of the modal, close it
/* 		        window.onclick = function(event) {
		            if (event.target == modal) {
		                modal.style.display = "none";
		            }
		        } */
		        
		        // 로그인 처리
		        function loginCheck(){
		        	
		        	var loginId = $("#loginId");
		        	var loginPwd = $("#loginPwd");
		        	
		        	if(loginId.val().length ==''){
		        		alert("아이디 란이 비어있어요!");
		        	}else{
		        		if(loginPwd.val().length== 0){
		        			alert("비밀번호 란이 비어있어요!");
		        		}else{
 		        			$.ajax({
		              		  url:"mloginCheck.do",
		                	data:{
		              	  	user_id:loginId.val(),
		              	  	user_pwd:loginPwd.val()
		              	  	},
		                success:function(msg){
		                	switch(msg){
		                	case "0":{
		                		alert("아이디를 확인해 주세요");
		                		break;
		                	}
		                	case "1":{
		                		alert("비밀번호를 확인해주세요");
		                		break;
		                		}
		                	case "2":{
		                		$("#loginviewform").submit();
		                	}
		                	}
		                		
		                },
		                error:function(request, status, errorData){
		      				alert("error code: " + request.status + "\n"
		      						+"message: " + request.responseText
		      						+"error: " + errorData);
		      			}
		             });  
		        		}
		        		
		        	}
<<<<<<< HEAD
		        }
		        
		        //비밀번호 찾기
		        function serchPwdbtn(){
		        	var serchId = $("#serchId");
		        	
		        	
		        	if(serchId.val().length==''){
		        		alert("아이디를 필수로 입력하셔야 겠죠?");
		        	}else{
		        			$.ajax({
			              		  url:"minsertIdCheck.do",
			                	data:{
			              	  	user_id:serchId.val(),
			              	  	},
			                success:function(IDCheck){
							if(IDCheck =="false"){
								//임시 비밀번호
		            var text = "";
		            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!";
       		    	for (var i = 0; i < 7; i++) {
			               text += possible.charAt(Math.floor(Math.random()* possible.length));
			            }
       		    	
	        		    var data = {
	        		    	    service_id: 'jang_jun_ha',
	        		    	    template_id: 'template_ruYgHWzb',
	        		    	    user_id: 'user_bcxE963izU0XoV5jKMmvq',
	        		    	    template_params: {
	        		    	        'username': 'JunHa',
	        		    	        'g-recaptcha-response': '03AHJ_ASjnLA214KSNKFJAK12sfKASfehbmfd...',
	        		    	        'user_Email' : serchId.val() ,
	        		    	        'message_html' : text
	        		    	    }
	        		    	};
	        		    	 
	        		    	$.ajax('https://api.emailjs.com/api/v1.0/email/send', {
	        		    	    type: 'POST',
	        		    	    data: JSON.stringify(data),
	        		    	    contentType: 'application/json'
	        		    	}).done(function() {
	        		    	    alert('임시비밀번호가 전송이 되었습니다.');
	        		    	    $("#findPwd").val(text);
	        		    	    
	        		    	    $("#SerchPwdForm").submit();
	        		    	}).fail(function(error) {
	        		    	    alert('죄송합니다. 보내지 못하였습니다.');
	        		    	}); 
=======

		        }
		        
		        //비밀번호 찾기
		        function serchPwdbtn(){
		        	var serchId = $("#serchId");
		        	
		        	
		        	if(serchId.val().length==''){
		        		alert("아이디를 필수로 입력하셔야 겠죠?");
		        	}else{
		        			$.ajax({
			              		  url:"minsertIdCheck.do",
			                	data:{
			              	  	user_id:serchId.val(),
			              	  	},
			                success:function(IDCheck){
							if(IDCheck =="false"){
								//임시 비밀번호
		            var text = "";
		            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!";
       		    	for (var i = 0; i < 7; i++) {
			               text += possible.charAt(Math.floor(Math.random()* possible.length));
			            }
       		    	
	        		    var data = {
	        		    	    service_id: 'jang_jun_ha',
	        		    	    template_id: 'template_ruYgHWzb',
	        		    	    user_id: 'user_bcxE963izU0XoV5jKMmvq',
	        		    	    template_params: {
	        		    	        'username': 'JunHa',
	        		    	        'g-recaptcha-response': '03AHJ_ASjnLA214KSNKFJAK12sfKASfehbmfd...',
	        		    	        'user_Email' : serchId.val() ,
	        		    	        'message_html' : text
	        		    	    }
	        		    	};
	        		    	 
	        		    	$.ajax('https://api.emailjs.com/api/v1.0/email/send', {
	        		    	    type: 'POST',
	        		    	    data: JSON.stringify(data),
	        		    	    contentType: 'application/json'
	        		    	}).done(function() {
	        		    	    alert('임시비밀번호가 전송이 되었습니다.');
	        		    	    $("#findPwd").val(text);
	        		    	    
	        		    	    $("#SerchPwdForm").submit();
	        		    	}).fail(function(error) {
	        		    	    alert('죄송합니다. 보내지 못하였습니다.');
	        		    	}); 

>>>>>>> refs/remotes/origin/master
							}else{
								alert("가입이 되지 않은 아이디네요!");
							}
			                		
			                },
			                error:function(request, status, errorData){
			      				alert("error code: " + request.status + "\n"
			      						+"message: " + request.responseText
			      						+"error: " + errorData);
			      			}
			             });
		        	} 
		        }
		        
		         $(function(LoadImg){
   					$("#fileArea").hide(); 
   					
  					 $("#first").click(function(){
  						 $("#thumbnailImg1").click();
  					 });
				
  					 $("#second").click(function(){
				      $("#thumbnailImg2").click();
				      });
				   
  					 $("#third").click(function(){
				      $("#thumbnailImg3").click();
				      });
				   
				   });
   					// 이미지 업로드 
					function LoadImg(value, num) {
						if (value.files[0] != undefined) {
							var reader = new FileReader();
							reader.onload = function(e) {
								switch (num) {
								case 1:
									$("#firstImg").attr("src", e.target.result);
									imgtitle = true;
									alert(imgtitle);
									break;
								case 2:
									$("#secondImg").attr("src", e.target.result);
									imgsub = true;
									break;
								case 3:
									$("#thirdImg").attr("src", e.target.result);
									imgsp = true;
									break;
								}
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
   					
	
				$(function() {
						$("#Imglist").sortable(); // id가 "sortable" 인 태그의 내부에 포함된 태그를 사용해서 드래그 가능한 리스트를 만듦
						$("#Imglist").disableSelection(); // 상자 선택만 하도록 함 텍스트를 선택 취소 할 수있게하려는 경우 유용합니다.
						$("#Imglist").suffer();
					});
				//이메일 변경 및 전체 유효성 검사
				function toEnabled() {
		         $("#user_email").attr("disabled",false);   // 메일주소 제대로 넘어가게
		     	 }
<<<<<<< HEAD
				
		      $(function(){
	         	 $("#user_email").val($("#email option").eq(0).val());
		       });
				
		      $('#email').change(function(){
		          $("#email option:selected").each(function () {
		            if($(this).parent().val()== "1"){ // 직접입력일 경우
		               $("#user_email").val(""); // 값 초기화
		               $("#user_email").attr("disabled",false); // 활성화
		               checkId();
		            }else{ // 직접입력이 아닐경우
		               $("#user_email").val($(this).parent().val()); // 선택값 입력
		               $("#user_email").attr("disabled",true); // 비활성화
		               checkId();
		            }
		         }); 
		      });
		      
				//유효성 검사 실행 하자
 				
 				var engCheck = /^[a-zA-Z0-9]*$/;
    			function checkId(){
         		var user_id = $("#user_id");
				var checkIdtext = $("#checkIdtext");
         		
		         	if(!engCheck.test(user_id.val())){
		            	alert("영어 및 숫자만 입력가능합니다.");
		           		user_id.val('');
		           		$("#checkId").css('background','rgb(255,0,0,0.4)');
		           		$("#checkId").css('border-radius','20px 20px 20px 20px');
		           		checkIdtext.html('다시 입력 해주세요!')
		           		idUsable = false;
		       		  }else{
		       			  if(user_id.val().length==0){
		       				$("#checkId").css('background','');
		       				checkIdtext.html('아이디를 입력 해주세요');
		       				idUsable = false;
		       			  }
		       			  else{
		       				$('#checkId').focusout(function() {
				         		   var user_id = $("#user_id");
				            		var user_email = $("#user_email");
				         			$.ajax({
				              		  url:"minsertIdCheck.do",
				                	data:{
				              	  	user_id:user_id.val(),
				              	  	user_email:user_email.val()},
				                success:function(IDCheck){
				                   	if(IDCheck == "true"){
				                   	 if(user_id.val().length==0){
						       				$("#checkId").css('background','');
						       				checkIdtext.html('아이디를 입력 해주세요');
						       				idUsable = false;
						       			  }else{
						            	$("#checkId").css('background','rgb(0,255,0,0.4)');
						            	checkIdtext.html('가입 가능한 아이디 입니다.');
						            	idUsable = true;
						       			  }
				                   	}
				                   	else{
						           		$("#checkId").css('background','rgb(255,0,0,0.4)');
						           		$("#checkId").css('border-radius','20px 20px 20px 20px');
						           	
						           		user_id.focus();
						           		checkIdtext.html('이미 가입된 아이디 입니다.');
						           		idUsable = false;
				                   	}
				                },
				                error:function(request, status, errorData){
				      				alert("error code: " + request.status + "\n"
				      						+"message: " + request.responseText
				      						+"error: " + errorData);
				      			}
				             }); 
				         		});
		       			  }
		        		 }
		         	
		         	}; 
		         	
	//비밀번호 부분
$(function() {
         $('#user_pwd').keyup(function() {
        	 var pwdCheck = /^[a-zA-Z0-9]*$/;
        	 
        	 if(!pwdCheck.test($("#user_pwd").val())){
        		$("#checkPwd").css('background','rgb(255,0,0,0.4)');
	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
	           	$("#checkPwdtext").html("특수문자 및 공백을 쓰시면 안되요!");
	           	$("#user_pwd").val('');
	           	pwdUsable = false;
        	 }else{
        		 if($("#user_pwd").val().length==0){
        			$("#checkPwd").css('background','');
      	           	$("#checkPwdtext").html("비밀번호를 입력 해 주세요!");
      	          pwdUsable = false;
        		 }else{
        			 $("#checkPwd").css('background','rgb(0,255,0,0.4)');
      	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
      	           	$("#checkPwdtext").html("잘 입력 되고 있어요");	 
        		 }
        	 }
         });
		$('#user_pwd').focusout(function(){
			if($("#user_pwd").val().length==0){
				$("#checkPwd").css('background','rgb(255,0,0,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호칸이 비어있어요");
  	         pwdUsable = false;
			}else{
			if($("#user_pwd").val() != $("#user_pwdC").val()){
				$("#checkPwd").css('background','rgb(0,0,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 확인란을 작성해 주세요");	 
  	         pwdUsable = false;
			}else{
				$("#checkPwd").css('background','rgb(0,255,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 일치 합니다.");
  	          pwdUsable = true;
			}
			}
		});
		$('#user_pwdC').keyup(function() {
       	 var pwdCheck = /^[a-zA-Z0-9]*$/;
       	 
       	 if(!pwdCheck.test($("#user_pwdC").val())){
       		$("#checkPwd").css('background','rgb(255,0,0,0.4)');
	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
	           	$("#checkPwdtext").html("특수문자 및 공백을 쓰시면 안되요!");
	           	$("#user_pwdC").val('');
	           	pwdUsable = false;
       	 }else{
       		 if($("#user_pwdC").val().length==0){
       			$("#checkPwd").css('background','');
     	           	$("#checkPwdtext").html("비밀번호를 입력 해 주세요!");
     	           pwdUsable = false;
       		 }else{
       			 $("#checkPwdC").css('background','rgb(0,255,0,0.4)');
     	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
     	           	$("#checkPwdtext").html("잘 입력 되고 있어요");	 
       		 }
       	 }
        });
		
		$('#user_pwdC').focusout(function(){
			if($("#user_pwdC").val().length==0){
				$("#checkPwd").css('background','rgb(255,0,0,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 확인란이 비어있어요");
  	          pwdUsable = false;
			}else{
			if($("#user_pwd").val() != $("#user_pwdC").val()){
				$("#checkPwd").css('background','rgb(0,0,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호를 일치시켜주세요");	 
  	          pwdUsable = false;
			}else{
				$("#checkPwd").css('background','rgb(0,255,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 일치 합니다.");
  	          pwdUsable = true;
			}
			}
		});
      });
      
      
      //닉네임
      
      
      $(function(){
         $("#user_nick").focusout(function(){
            var user_nick = $("#user_nick");
            if(user_nick.val().length == 0){
                $("#checkNick").css('background','rgb(255,0,0,0.4)');
 	           	$("#checkNick").css('border-radius','20px 20px 20px 20px');
 	           	$("#checkNicktext").html("닉네임 창이 비어있어요");
 	           nickUsable = false;
            }else{
               $.ajax({
                  url:"minsertNickCheck.do",
                  data:{user_nick:user_nick.val()},
                  success:function(NickCheck){
                	  if(NickCheck == "true"){
		                   	 if(user_nick.val().length==0){
				       				$("#checkNick").css('background','');
				       				$("#checkNicktext").html("닉네임 창이 비어있어요");
				       				nickUsable = false;
				       			  }else{
				            	$("#checkNick").css('background','rgb(0,255,0,0.4)');
				            	$("#checkNicktext").html("사용가능한 닉네임이에요");
				            	nickUsable = true;
				       			  }
		                   	}else{
				           		$("#checkNick").css('background','rgb(255,0,0,0.4)');
				           		$("#checkNick").css('border-radius','20px 20px 20px 20px');
				           	
				           		 user_nick.focus();
				           		$("#checkNicktext").html("이미 사용된 닉네임이에요");
				           		nickUsable = false;
		                   	}
                  },
                  error:function(request, status, errorData){
	      				alert("error code: " + request.status + "\n"
	      						+"message: " + request.responseText
	      						+"error: " + errorData);
	      			}
               });
            }
         });
      });
      
      //휴대폰 유효성 검사
      
      $(function(){
    	 var phone2 = $("#phone2");
    	 var phone3 = $("#phone3");
    	 var intCheck = /^[0-9]*$/;
    	 
    	 phone2.keyup(function(){
    		 if(!intCheck.test(phone2.val())){
    			 alert("숫자만입력하세요");
    			 phone2.val('');
    			 phoneUsable = false;
    		 }else if(phone2.val().length==4){
    			 phone3.focus();
        	 }else{
        		 
        	 }	 
    		 
    	 });
    	 
    	 phone3.keyup(function(){
    		 if(phone3.val().length <4  && !intCheck.test(phone3.val())){
    			 alert("숫자만입력하세요");
    			 phone3.val('');
    			 phoneUsable = false;
    		 }else if(phone3.val().length==4){
    			 $("#nextpage1").focus();
    			 phoneUsable = true;
        	 }
    	 });
      });
      
      //키 / 나이 / 주소 입력 유효성 검사
      
      $(function(){
    	 var height = $("#height");
    	 
    	 var age = $("#age");
    	 var address = $("#address");
    	 
    	 var intCheck = /^[0-9]*$/;
    	 var korCheck = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]*$/;
    	 height.keyup(function(){
    		 if(height.val().length <3  && !intCheck.test(height.val())){
    			 alert("숫자만입력하세요");
    			 height.val('');
    			 heightUsable = false;
    		 }else if(height.val().length==3){
    			 age.focus();
    			 heightUsable = true;
    			 
        	 }
    	 });
    	 
    	 age.keyup(function(){
    		 if(age.val().length <2  && !intCheck.test(age.val())){
    			 alert("숫자만입력하세요");
    			 age.val('');
    			 ageUsable = false;
    		 }else if(age.val().length==2){
    			 address.focus();
    			 ageUsable = true;
        	 }
    	 });
    	 
    	 address.keyup(function(){
    		 if(!korCheck.test(address.val())){
    			 alert("문자 및 영문만 됩니다.");
    			 address.val('');
    			 addressUsable = false;
    		 }else{
    			 addressUsable = true;
    		 }
    	 });
      });
      
      //체크 박스 유효성 검사
      $(function(){
    	  $("#movie").change(function(){
        	  if($("#movie").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#movie").val('Y');
        		  alert($("#movie").val());
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#movie").val('N');
      			alert($("#movie").val());
      		}  
    	  });
    	  
    	  $("#sing").change(function(){
        	  if($("#sing").is(":checked")){
        		  $("#sing").val('Y');
        		  Hobbycount = Hobbycount +1;
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#sing").val('N');
      		}  
    	  });
    	  
    	  $("#game").change(function(){
        	  if($("#game").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#game").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#game").val('N');
      		}  
    	  });
    	  
    	  $("#jmt").change(function(){
        	  if($("#jmt").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#jmt").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#jmt").val('N');
      		}  
    	  });
    	  
    	  $("#pet").change(function(){
        	  if($("#pet").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#pet").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#pet").val('N');
      		}  
    	  });
    	  
    	  $("#cafe").change(function(){
        	  if($("#cafe").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#cafe").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#cafe").val('Y');
      		}  
    	  });
    	  
    	  $("#working").change(function(){
        	  if($("#working").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#working").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#working").val('N');
      		}  
    	  });
    	  
    	  $("#poto").change(function(){
        	  if($("#poto").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#poto").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#poto").val('N');
      		}  
    	  });
    	  
    	  $("#travel").change(function(){
        	  if($("#travel").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#travel").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#travel").val('N');
      		}  
    	  });
    	  
			
    	    	  
      });
/*       $(function(){
    	  
    	  $('#memberjoinForm').submit(function() {
   	     	
    	    });
    	  
    	  
      }); */
      
      
      // 버튼 minsertbtn gkatn
      function abc(){
			 				if (imgtitle == false) {
								alert("첫 사진 확인 해주세요");
								return false;
							}
							if (imgsub == false) {
								alert("두번째 사진 확인 해주세요");
								return false;
							}
							if (imgsp == false) {
								alert("세번째 사진 확인");
								return false;
							}
							 
							 alert("회원가입 완료");
							$("#memberjoinForm").submit();
														
		};
      
=======

				
		      $(function(){
	         	 $("#user_email").val($("#email option").eq(0).val());
		       });
				
		      $('#email').change(function(){
		          $("#email option:selected").each(function () {
		            if($(this).parent().val()== "1"){ // 직접입력일 경우
		               $("#user_email").val(""); // 값 초기화
		               $("#user_email").attr("disabled",false); // 활성화
		               checkId();
		            }else{ // 직접입력이 아닐경우
		               $("#user_email").val($(this).parent().val()); // 선택값 입력
		               $("#user_email").attr("disabled",true); // 비활성화
		               checkId();
		            }
		         }); 
		      });
		      
				//유효성 검사 실행 하자
 				
 				var engCheck = /^[a-zA-Z0-9]*$/;
    			function checkId(){
         		var user_id = $("#user_id");
				var checkIdtext = $("#checkIdtext");
         		
		         	if(!engCheck.test(user_id.val())){
		            	alert("영어 및 숫자만 입력가능합니다.");
		           		user_id.val('');
		           		$("#checkId").css('background','rgb(255,0,0,0.4)');
		           		$("#checkId").css('border-radius','20px 20px 20px 20px');
		           		checkIdtext.html('다시 입력 해주세요!')
		           		idUsable = false;
		       		  }else{
		       			  if(user_id.val().length==0){
		       				$("#checkId").css('background','');
		       				checkIdtext.html('아이디를 입력 해주세요');
		       				idUsable = false;
		       			  }
		       			  else{
		       				$('#checkId').focusout(function() {
				         		   var user_id = $("#user_id");
				            		var user_email = $("#user_email");
				         			$.ajax({
				              		  url:"minsertIdCheck.do",
				                	data:{
				              	  	user_id:user_id.val(),
				              	  	user_email:user_email.val()},
				                success:function(IDCheck){
				                   	if(IDCheck == "true"){
				                   	 if(user_id.val().length==0){
						       				$("#checkId").css('background','');
						       				checkIdtext.html('아이디를 입력 해주세요');
						       				idUsable = false;
						       			  }else{
						            	$("#checkId").css('background','rgb(0,255,0,0.4)');
						            	checkIdtext.html('가입 가능한 아이디 입니다.');
						            	idUsable = true;
						       			  }
				                   	}
				                   	else{
						           		$("#checkId").css('background','rgb(255,0,0,0.4)');
						           		$("#checkId").css('border-radius','20px 20px 20px 20px');
						           	
						           		user_id.focus();
						           		checkIdtext.html('이미 가입된 아이디 입니다.');
						           		idUsable = false;
				                   	}
				                },
				                error:function(request, status, errorData){
				      				alert("error code: " + request.status + "\n"
				      						+"message: " + request.responseText
				      						+"error: " + errorData);
				      			}
				             }); 
				         		});
		       			  }
		        		 }
		         	
		         	}; 
		         	
	//비밀번호 부분

$(function() {
         $('#user_pwd').keyup(function() {
        	 var pwdCheck = /^[a-zA-Z0-9]*$/;
        	 
        	 if(!pwdCheck.test($("#user_pwd").val())){
        		$("#checkPwd").css('background','rgb(255,0,0,0.4)');
	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
	           	$("#checkPwdtext").html("특수문자 및 공백을 쓰시면 안되요!");
	           	$("#user_pwd").val('');
	           	pwdUsable = false;
        	 }else{
        		 if($("#user_pwd").val().length==0){
        			$("#checkPwd").css('background','');
      	           	$("#checkPwdtext").html("비밀번호를 입력 해 주세요!");
      	          pwdUsable = false;
        		 }else{
        			 $("#checkPwd").css('background','rgb(0,255,0,0.4)');
      	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
      	           	$("#checkPwdtext").html("잘 입력 되고 있어요");	 
        		 }
        	 }
         });
		$('#user_pwd').focusout(function(){
			if($("#user_pwd").val().length==0){
				$("#checkPwd").css('background','rgb(255,0,0,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호칸이 비어있어요");
  	         pwdUsable = false;
			}else{
			if($("#user_pwd").val() != $("#user_pwdC").val()){
				$("#checkPwd").css('background','rgb(0,0,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 확인란을 작성해 주세요");	 
  	         pwdUsable = false;
			}else{
				$("#checkPwd").css('background','rgb(0,255,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 일치 합니다.");
  	          pwdUsable = true;
			}
			}
		});
		$('#user_pwdC').keyup(function() {
       	 var pwdCheck = /^[a-zA-Z0-9]*$/;
       	 
       	 if(!pwdCheck.test($("#user_pwdC").val())){
       		$("#checkPwd").css('background','rgb(255,0,0,0.4)');
	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
	           	$("#checkPwdtext").html("특수문자 및 공백을 쓰시면 안되요!");
	           	$("#user_pwdC").val('');
	           	pwdUsable = false;
       	 }else{
       		 if($("#user_pwdC").val().length==0){
       			$("#checkPwd").css('background','');
     	           	$("#checkPwdtext").html("비밀번호를 입력 해 주세요!");
     	           pwdUsable = false;
       		 }else{
       			 $("#checkPwdC").css('background','rgb(0,255,0,0.4)');
     	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
     	           	$("#checkPwdtext").html("잘 입력 되고 있어요");	 
       		 }
       	 }
        });
		
		$('#user_pwdC').focusout(function(){
			if($("#user_pwdC").val().length==0){
				$("#checkPwd").css('background','rgb(255,0,0,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 확인란이 비어있어요");
  	          pwdUsable = false;
			}else{
			if($("#user_pwd").val() != $("#user_pwdC").val()){
				$("#checkPwd").css('background','rgb(0,0,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호를 일치시켜주세요");	 
  	          pwdUsable = false;
			}else{
				$("#checkPwd").css('background','rgb(0,255,255,0.4)');
  	           	$("#checkPwd").css('border-radius','20px 20px 20px 20px');
  	           	$("#checkPwdtext").html("비밀번호 일치 합니다.");
  	          pwdUsable = true;
			}
			}
		});
      });
      
      
      //닉네임
      
      
      $(function(){
         $("#user_nick").focusout(function(){
            var user_nick = $("#user_nick");
            if(user_nick.val().length == 0){
                $("#checkNick").css('background','rgb(255,0,0,0.4)');
 	           	$("#checkNick").css('border-radius','20px 20px 20px 20px');
 	           	$("#checkNicktext").html("닉네임 창이 비어있어요");
 	           nickUsable = false;
            }else{
               $.ajax({
                  url:"minsertNickCheck.do",
                  data:{user_nick:user_nick.val()},
                  success:function(NickCheck){
                	  if(NickCheck == "true"){
		                   	 if(user_nick.val().length==0){
				       				$("#checkNick").css('background','');
				       				$("#checkNicktext").html("닉네임 창이 비어있어요");
				       				nickUsable = false;
				       			  }else{
				            	$("#checkNick").css('background','rgb(0,255,0,0.4)');
				            	$("#checkNicktext").html("사용가능한 닉네임이에요");
				            	nickUsable = true;
				       			  }
		                   	}else{
				           		$("#checkNick").css('background','rgb(255,0,0,0.4)');
				           		$("#checkNick").css('border-radius','20px 20px 20px 20px');
				           	
				           		 user_nick.focus();
				           		$("#checkNicktext").html("이미 사용된 닉네임이에요");
				           		nickUsable = false;
		                   	}
                  },
                  error:function(request, status, errorData){
	      				alert("error code: " + request.status + "\n"
	      						+"message: " + request.responseText
	      						+"error: " + errorData);
	      			}
               });
            }
         });
      });
      
      //휴대폰 유효성 검사
      
      $(function(){
    	 var phone2 = $("#phone2");
    	 var phone3 = $("#phone3");
    	 var intCheck = /^[0-9]*$/;
    	 
    	 phone2.keyup(function(){
    		 if(!intCheck.test(phone2.val())){
    			 alert("숫자만입력하세요");
    			 phone2.val('');
    			 phoneUsable = false;
    		 }else if(phone2.val().length==4){
    			 phone3.focus();
        	 }else{
        		 
        	 }	 
    		 
    	 });
    	 
    	 phone3.keyup(function(){
    		 if(phone3.val().length <4  && !intCheck.test(phone3.val())){
    			 alert("숫자만입력하세요");
    			 phone3.val('');
    			 phoneUsable = false;
    		 }else if(phone3.val().length==4){
    			 $("#nextpage1").focus();
    			 phoneUsable = true;
        	 }
    	 });
      });
      
      //키 / 나이 / 주소 입력 유효성 검사
      
      $(function(){
    	 var height = $("#height");
    	 
    	 var age = $("#age");
    	 var address = $("#address");
    	 
    	 var intCheck = /^[0-9]*$/;
    	 var korCheck = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]*$/;
    	 height.keyup(function(){
    		 if(height.val().length <3  && !intCheck.test(height.val())){
    			 alert("숫자만입력하세요");
    			 height.val('');
    			 heightUsable = false;
    		 }else if(height.val().length==3){
    			 age.focus();
    			 heightUsable = true;
    			 
        	 }
    	 });
    	 
    	 age.keyup(function(){
    		 if(age.val().length <2  && !intCheck.test(age.val())){
    			 alert("숫자만입력하세요");
    			 age.val('');
    			 ageUsable = false;
    		 }else if(age.val().length==2){
    			 address.focus();
    			 ageUsable = true;
        	 }
    	 });
    	 
    	 address.keyup(function(){
    		 if(!korCheck.test(address.val())){
    			 alert("문자 및 영문만 됩니다.");
    			 address.val('');
    			 addressUsable = false;
    		 }else{
    			 addressUsable = true;
    		 }
    	 });
      });
      
      //체크 박스 유효성 검사
      $(function(){
    	  $("#movie").change(function(){
        	  if($("#movie").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#movie").val('Y');
        		  alert($("#movie").val());
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#movie").val('N');
      			alert($("#movie").val());
      		}  
    	  });
    	  
    	  $("#sing").change(function(){
        	  if($("#sing").is(":checked")){
        		  $("#sing").val('Y');
        		  Hobbycount = Hobbycount +1;
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#sing").val('N');
      		}  
    	  });
    	  
    	  $("#game").change(function(){
        	  if($("#game").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#game").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#game").val('N');
      		}  
    	  });
    	  
    	  $("#jmt").change(function(){
        	  if($("#jmt").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#jmt").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#jmt").val('N');
      		}  
    	  });
    	  
    	  $("#pet").change(function(){
        	  if($("#pet").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#pet").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#pet").val('N');
      		}  
    	  });
    	  
    	  $("#cafe").change(function(){
        	  if($("#cafe").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#cafe").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#cafe").val('Y');
      		}  
    	  });
    	  
    	  $("#working").change(function(){
        	  if($("#working").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#working").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#working").val('N');
      		}  
    	  });
    	  
    	  $("#poto").change(function(){
        	  if($("#poto").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#poto").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#poto").val('N');
      		}  
    	  });
    	  
    	  $("#travel").change(function(){
        	  if($("#travel").is(":checked")){
        		  Hobbycount = Hobbycount +1;
        		  $("#travel").val('Y');
      		}else{
      			Hobbycount = Hobbycount -1;
      			$("#travel").val('N');
      		}  
    	  });
    	  
			
    	    	  
      });

/*       $(function(){
    	  
    	  $('#memberjoinForm').submit(function() {


   	     	
    	    });
    	  
    	  
      }); */
      
      
      // 버튼 minsertbtn gkatn
      function abc(){
			 				if (imgtitle == false) {
								alert("첫 사진 확인 해주세요");
								return false;
							}
							if (imgsub == false) {
								alert("두번째 사진 확인 해주세요");
								return false;
							}
							if (imgsp == false) {
								alert("세번째 사진 확인");
								return false;
							}
							 
							 alert("회원가입 완료");
							$("#memberjoinForm").submit();
														
		};
      

>>>>>>> refs/remotes/origin/master
						</script>	
	</div>
				
		<div class="btn_scroll">
			<a href="#service" class="scroll">
			<img src="resources/images/btn_scroll_down.png" alt="스크롤다운" /></a>
		</div>
	</div>

    <div class="section service" id="service">
        <ul class="slider">
                <li class="slide1">
                    <div class="slider_img"></div>
                    <div class="content">
                        <div class="text_wrap">
                            <p class="title_st1 eng">당신의 연예는</p>
                                 <p class="f_logo">
                                <img src="resources/face/G.JPG" /></p> 
                                <p class="f_name">아</p>
                                <p class="f_description">아무나</p>
                        </div>
                        <div class="img_wrap">
                        <img src="resources/face/G3.JPG" /></div>
                        <div class="slider_ar">
                            <div class="count count2">
                                <span class="idx">01</span>
                                <span class="dash"><img src="/public/images/slide_count_bar_g.png" alt="" /></span>
                                <span class="length">3</span>
                            </div>
                        </div>
                    </div>
                </li>
                 <li class="slide2">
                    <div class="slider_img"></div>
                    <div class="content">
                        <div class="text_wrap">
                            <p class="title_st1 eng">언제 어디서 든지 </p>
                                <!-- <p class="f_logo"><img src="/public/upload/20190403/e09687523ec0d37ee5e86882979561aa.png" /></p> -->
                                <p class="f_name">만</p>
                                <p class="f_description">만난</p>
                        </div>
                        <div class="img_wrap"></div>
                        <div class="slider_ar">
                            <div class="count count2">
                                <span class="idx">02</span>
                                <span class="dash"><img src="/public/images/slide_count_bar_g.png" alt="" /></span>
                                <span class="length">3</span>
                            </div>
                        </div>
                    </div>
                </li>
                            <li class="slide3">
                    <div class="slider_img"></div>
                    <div class="content">
                        <div class="text_wrap">
                            <p class="title_st1 eng">아만다에서 만나세요</p>
                                <!-- <p class="f_logo"><img src="/public/upload/20190322/49c3cc4c3f202dab5813136402dc48fe.jpg" /></p> -->
                                <p class="f_name">다</p>
                                <p class="f_description">다</p>
                            
                        </div>
                        <div class="img_wrap">
                        <img src="resources/face/t2.JPG" />
                        </div>
                        <div class="slider_ar">

                            <div class="count count2">
                                <span class="idx">03</span>
                                <span class="dash"><img src="/public/images/slide_count_bar_g.png" alt="" /></span>
                                <span class="length">3</span>
                            </div>
                        </div>
                    </div>
                </li>
                    </ul>
    </div>
    <!--//section-->

			<div class="section interview" id="interview">
				<ul class="slider">
					<li>
						<div class="slider_img">
						<img src="resources/face/G.jpg"/>
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									만족스런 주문 경험을 제공할 수 있는<br />서비스를 기획합니다. <span class="team">기술연구소,
										Consumer Product팀</span> <span class="name">박소희</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>
								<div class="count">
									<span class="idx">01</span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img src="resources/face/O.jpg"  width="100%"/>
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									데이터를 통해 우리 서비스가<br />올바른 방향으로 나아갈 수 있도록 돕습니다. <span
										class="team">Data, Business Intelligence팀</span> <span
										class="name">김은선</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 02 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> 
										<span class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									고객들에게 맛있는 즐거움을 선사할 수 있는<br />푸드테크를 고민합니다. <span class="team">기술연구소,
										ios 개발팀</span> <span class="name">백호근</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 03 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									딜리버리히어로 코리아를 이끌어 나갈<br />‘슈퍼히어로’를 찾습니다.<br /> <span
										class="team">인재문화본부, Talent팀</span> <span class="name">김지수</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 04 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									맛있는 이야기가 담긴 딜리버리 서비스를<br />끊임없이 고민합니다. <span class="team">푸드플라이,
										PB기획팀</span> <span class="name">김희제</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 05 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									더 맛있고 편리한 주문 경험을<br />선사할 수 있도록! 요기요 프렌차이즈<br />입점 및 동반 성장을
									고민합니다. <span class="team">세일즈본부, B2B영업실</span> <span
										class="name">김성회</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 06 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									고객의 목소리를 귀 기울여 듣고,<br />서비스를 개선해 나가고 있어요. <span class="team">서비스운영본부,
										고객경험향상팀</span> <span class="name">이제호</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 07 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									만족스런 주문 경험을 제공할 수 있는<br />서비스를 기획합니다. <span class="team">기술연구소,
										Consumer Product팀</span> <span class="name">박소희</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 08 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									맛있는 일상을 선물하는 일을 하고 있어요! <span class="team">셰플리 강남키친, 셰프</span>
									<span class="name">이예진</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 09 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									사장님들에게 가장 필요한 것은 무엇일까<br />항상 고민합니다. <span class="team">알뜰쇼핑사업기획실,
										판매전략팀</span> <span class="name">전다솜</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 10 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
					<li>
						<div class="slider_img">
							<img
								src="resources/face/O.jpg" />
						</div>
						<div class="content">
							<p class="title_st1 eng">INTERVIEW</p>
							<a href="/career#interview">
								<p class="cont">
									딜리버리히어로 코리아의 자금 업무를<br />맡고 있어요! <span class="team">Finance,
										Treasury팀</span> <span class="name">민병일</span>
								</p>
							</a>
							<div class="slider_ar">
								<a href="javascript:;" class="prev"></a> <a href="javascript:;"
									class="next"></a>

								<div class="count">
									<span class="idx"> 11 </span> <span class="dash"><img
										src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
										class="length">11</span>
								</div>
							</div>
						</div> <!--content-->
					</li>
				</ul>
			</div>
			<!--//section-->
			  <div class="section notice" id="notice">
        <div class="content">
            <div class="left">
                <p class="title_st1 eng">CAREER</p>
                <div class="notice_wrap">
                    <p class="title">채용 정보</p>

                    <ul>
                                                                                <li>
                                    <p class="left" style="width=100%">
                                        <span class="career">[경력]</span><a href="https://grnh.se/ec16cf522" target="_blank">Sr.Analyst - Business Analyst</a>
                                    </p>
                                </li>
                                                                                                        <li>
                                    <p class="left" style="width=100%">
                                        <span class="career">[경력]</span><a href="https://grnh.se/553afb922" target="_blank">Sr. Manager - 전략팀장</a>
                                    </p>
                                </li>
                                                                    </ul>
                    <a href="/career#recruitment" class="btn_employment_information"><img src="/public/images/btn_view_more.png" alt="더보기" /></a>
                </div>
            </div>
            <div class="center">
                <p class="title_st1 eng">CH. HERO</p>
                <a href="/pr#ch_hero" class="btn_ch_hero"><img src="/public/images/main_ad1.jpg" alt="채널히어로" /></a>
            </div>
            <div class="right">
                <p class="title_st1 eng">HERO BENEFIT</p>
                <a href="/career#dh_culture" class="btn_benefit"><img src="/public/images/main_ad2.jpg" alt="다양한문화" /></a>
            </div>
        </div>
        <!--content-->
    </div>
    <!--//section-->
</div>
</div>

    <script>
    $(document).ready(function() {
        scrollNav();
        $(window).scroll(function() {
            scrollNav();
        });
    });
    function scrollNav() {
        win_top = $(window).scrollTop();
        part1 = $("#visual").offset().top;
        part2 = $("#service").offset().top;
        part3 = $("#interview").offset().top;
        part4 = $("#notice").offset().top;
        if (win_top < part2) {
            $(".nav li").removeClass('active');
            $(".nav1").addClass('active');
        } else if (win_top >= part2 && win_top < part3) {
            $(".nav li").removeClass('active');
            $(".nav2").addClass('active');
        } else if (win_top >= part3 && win_top < part4) {
            $(".nav li").removeClass('active');
            $(".nav3").addClass('active');
        } else if (win_top >= part4) {
            $(".nav li").removeClass('active');
            $(".nav4").addClass('active');
        }
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            $(".nav li").removeClass('active');
            $(".nav4").addClass('active');
        }
    }
</script>
</body>
</html>