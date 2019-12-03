<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
</style>
</head>
<body>
<div class="wrap" id="wrap">
<div class="nav">
    <ul>
        <li class="active nav1"><a href="#visual" class="scroll"></a></li>
        <li class="nav2"><a href="#service" class="scroll"></a></li>
        <li class="nav3"><a href="#interview" class="scroll"></a></li>
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
					<!-- The Modal -->
					<div id="myModal" class="modal">

						<!-- Modal content -->
						<div class="modal-content">
							<div>
							<span class="close">&times;</span><br><br><br>
							</div>
							
							
							<div id="loginview">
							<form action="mlogin.do" method="post">
							<div class="textbox" id="divId">
								<input type="text" name="loginId" data-rule-required="true" size="50px" placeholder="ex) OOOO@naver.com">
							</div>
							<br>
							<div class="textbox" id="divPassword">
								<input type="password" name="loginPwd" data-rule-required="true" size="65px" placeholder="비밀번호를 입력하세요">
							</div>
							<br>
							<br>
							<div class="textbox" id="loginbtn">
							<button type="submit">Login</button>
							</div>
							</form>
							<br>
							<div class = "textbox" id="kakaobtn">
							
							</div>
							<div class = "textbox" id="loginbtn">
								<button id="insertmemberview">회원가입</button> / <button>비밀번호 찾기</button>
							</div>
						</div>
						
						<div id= "infoView">
							<form action="minsert.do" method="post" id="memberjoinForm" enctype="multipart/form-data">
							<div id="infoView1">
							아이디(ID) : <input type= "text" name = "user_id"><br>
							패스워드(PWD) : <input type = "password" name="user_pwd" ><br>
							별명(Name) : <input type = "text" name="user_nick"><br>
							성별 : 남 <input type="radio" name = "gender" class = "gender" value = "M"> &nbsp; 
							여 : <input type = "radio" name = "gender" class = "gender" value="F"><br>
							번호  : <input type="text" name = "phone1"> - 
							<input type="text" name= "phone2"> - 
							<input type="text" name = "phone3"><br>
							<div class= "textbox" id="nextbtn">
							<button type="button" id="nextpage1">다음</button>
							</div>
							</div>
							
							<div id = "infoView2">
							키 : <input type="number" name="height">&nbsp;
							나이 : <input type = "number" name="age">&nbsp;
							사는곳 : <input type="text" name="address"><br>
							
							동성 여부 : 예 : <input type="radio" name = "gay" class = "gay" value = "Y"> &nbsp; 
							아니오 : <input type = "radio" name = "gay" class = "gay" value="N"><br>
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
							<button type="button" id="nextpage">이전으로</button>
														<div>
							<button type="submit">회원 가입완료</button>
							</div>
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
						
						
					</div>
					
					
					
				</div>
				
				<script>
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
		        	infoView1.style.display = "none";
		        	infoView2.style.display = "block";
		        	infoView3.style.display = "none";
		        } 
		        inforbtn.onclick=function(){
		        	infoView1.style.display = "block";
		        	infoView2.style.display = "none";
		        	infoView3.style.display = "none";
		        }
		        
		        lastpage.onclick=function(){
		        	infoView1.style.display = "none";
		        	infoView2.style.display = "none";
		        	infoView3.style.display = "block";
		        }
		        
		        nextpage.onclick=function(){
		        	infoView1.style.display = "none";
		        	infoView2.style.display = "block";
		        	infoView3.style.display = "none";
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
							// value는 함수를 발동시킨 객체(file타입 input태그)이고
							// value.files[0]은 input태그로 파일을 선택 했으면 undefined가 아니고 선택 안했으면 undefined다.
							var reader = new FileReader();

							reader.onload = function(e) {
								switch (num) {
								case 1:
									$("#firstImg").attr("src", e.target.result);
									break;
								case 2:
									$("#secondImg").attr("src", e.target.result);
									break;
								case 3:
									$("#thirdImg").attr("src", e.target.result);
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
				

				</script>
				<!-- 끝 -->
				
				<!--content-->

				<div class="btn_scroll">
					<a href="#service" class="scroll">
					<img src="resources/images/btn_scroll_down.png" alt="스크롤다운" /></a>
				</div>
			</div>
			<!--//section-->

    <div class="section service" id="service">
        <ul class="slider">
                <li class="slide1">
                    <div class="slider_img"></div>
                    <div class="content">
                        <div class="text_wrap">
                            <p class="title_st1 eng">AMNADA</p>
                                <!-- <p class="f_logo">
                                <img src="/public/upload/20190322/f9e7af5a30ffecfa390f807566bd0fcd.jpg" /></p> -->
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
                            <p class="title_st1 eng">SERVICE</p>
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
                            <p class="title_st1 eng">SERVICE</p>
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
						<div class="slider_img"><img src="resources/face/G.jpg" />
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
							<img src="resources/face/t4.jpg" />
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
								src="/public/upload/20190321/2e27759e62d16022e53573ca61a0bd5f.jpg" />
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
								src="/public/upload/20190321/eeeb7692b21d537372290d2fef160dce.jpg" />
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
								src="/public/upload/20190321/78a6d987d636e1fa24973710c4c2b02b.jpg" />
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
								src="/public/upload/20190321/9e311d5d5f41683b6be895522262fbab.jpg" />
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
								src="/public/upload/20190321/8cf72b0e3736e028a9843fdd32982d6c.jpg" />
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
								src="/public/upload/20190321/afd1f7b6d0c41c168b6c1c44a13f65c7.jpg" />
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
								src="/public/upload/20190321/8b3f15b5e9c1b6a136bbab9a29268f5c.jpg" />
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
								src="/public/upload/20190321/b61761cb1cf120c1c0450e82b31fcd6b.jpg" />
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
    <!--//section-->
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
