<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.DateFormat"
	import="java.util.Calendar" import="java.text.SimpleDateFormat"
	import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	cal.add(Calendar.DATE, +7);
	String time = df.format(cal.getTime());

	Calendar cal1 = Calendar.getInstance();
	cal1.setTime(new Date());
	DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
	cal1.add(Calendar.DATE, +30);
	String time1 = df1.format(cal1.getTime());

	Calendar cal2 = Calendar.getInstance();
	cal2.setTime(new Date());
	DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
	cal2.add(Calendar.DATE, +365);
	String time2 = df2.format(cal2.getTime());
	
	Calendar cal3 = Calendar.getInstance();
	cal3.setTime(new Date());
	DateFormat df3 = new SimpleDateFormat("yyyy-MM-dd");
	cal3.add(Calendar.DATE, +0);
	String time3 = df3.format(cal3.getTime());

%>



<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>AMANDA - 결제 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
.Payment {
	border: 1px solid #e8e8e8;
	width: 930px;
	height: 662px;
	align: center;
	border-radius: 10px;
	margin-left: 37%;
	margin-top: 5%;
}

.infoList {
	border-right: 1px solid #e8e8e8;
	width: 605px;
	height: 659px;
	float: left;
	overflow: auto;
}

::-webkit-scrollbar {
	display: none;
}

.payList {
	border: 0px solid #e8e8e8;
	width: 305px;
	height: 655px;
	float: right;
	text-align: center;
}

.pays {
	width: 296px;
	height: 125px;
	text-align: center;
	border-radius: 10px;
	float: left;
}

#fontNo1:hover, #fontNo2:hover, #fontNo3:hover, #fontNo4:hover, #fontNo5:hover,
	#fontNo6:hover {
	cursor: pointer;
}

.paysLogo {
	width: 295px;
	height: 90px;
	text-align: center;
}

.infos {
	width: 605px;
	height: 140px;
	border-bottom: 1px solid #e8e8e8;
}

.paygo {
	width: 295px;
	height: 130px;
	text-align: center;
}

#popbutton {
	background: #e9aa43;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 500ms ease all;
	outline: none;
	font-family:
}

#popbutton:hover {
	background: #fff;
	color: #e9aa43;
}

#popbutton:before, #popbutton:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #e9aa43;
	transition: 400ms ease all;
}

#popbutton:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#popbutton:hover:before, #popbutton:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.go {
  background-color: white; color: black;
  border: none;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 15px;
  outline: 0;
  border: 1px solid #e7e7e7;
  width: 180px;
}
input[type="radio"]:not(old){
  width:24px;
  opacity: 0;
}

input[type="radio"]:not(old) + label {
  display:inline-block;
  background:url('check_off.png') no-repeat;
  width:24px;
  height:24px;
  margin-left:-24px;
  padding-left:24px;
}

input[type="radio"]:not(old):checked + label {
  display:inline-block;
  background:url('check_on.png') no-repeat;
  width:24px;
  height:24px;
  margin-left:-24px;
  padding-left:24px;
}
</style>
</head>
<body>
<!-- <a href="SuccessReturn.do">메인이동</a> -->
<jsp:include page="../common/matchingMenu.jsp"/>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">☰ AMANDA</span>
<br>
	<form action="payment.do" method="post" id="payForm">
		<div class="Payment">
			<div class="infoList">
				<div style="text-align: center; border-bottom: 1px solid #e8e8e8;">
					<h3 style="font-size: 1.6rem; color: #757575; margin-bottom: 1%; margin-top: 2%; font-family: ProximaNova, sans-serif;">
						결제 회원 혜택 리스트
					</h3>
				</div>
				<div class="infos">
					<table style="width: 600px; height: 100px; margin-top: 3%;">
						<tr>
							<td style="width: 100px; height: 100px; text-align: center;">
								<img src="resources/images/undo.png"
								style="width: 50px; height: 50px; margin-left: 0.8%; margin-top: 5%">
							</td>
							<td>
								<table>
									<tr>
										<td style="width: 600px;">
											<h3
												style="height: 0px; font-size: 2.3rem; color: #ff7c30; font-weight: 600;">무제한
												되돌리기</h3>
											<br>
										</td>
									</tr>
									<tr>
										<td><font size="2em" color="#757575">누군가를 잘못
												스와이프하셨나요? 되감고 다시 스와이프하세요 !</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="infos">
					<table style="width: 600px; height: 100px; margin-top: 3%;">
						<tr>
							<td style="width: 100px; height: 100px; text-align: center;">
								<img src="resources/images/thunder.png"
								style="width: 70px; height: 70px; margin-top: 5%">
							</td>
							<td>
								<table>
									<tr>
										<td style="width: 600px;">
											<h3
												style="height: 0px; font-size: 2.3rem; color: #EFCC00; font-weight: 600;">슈퍼
												채팅</h3>
											<br>
										</td>
									</tr>
									<tr>
										<td><font size="2em" color="#757575">지금 바로 원하는
												상대에게 말을 걸어보세요 !</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="infos">
					<table style="width: 600px; height: 100px; margin-top: 3%;">
						<tr>
							<td style="width: 100px; height: 100px; text-align: center;">
								<img src="resources/images/star.png"
								style="width: 65px; height: 65px; margin-top: 5%">
							</td>
							<td>
								<table>
									<tr>
										<td style="width: 600px;">
											<h3
												style="height: 0px; font-size: 2.3rem; color: #3ca4ff; font-weight: 600;">나를
												'좋아요' 누른 회원 보기</h3>
											<br>
										</td>
									</tr>
									<tr>
										<td><font size="2em" color="#757575">나에게 '좋아요' 누른
												회원을 확인하세요 !</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="infos">
					<table style="width: 600px; height: 100px; margin-top: 3%;">
						<tr>
							<td style="width: 100px; height: 100px; text-align: center;">
								<img src="resources/images/heart.png"
								style="width: 65px; height: 65px; margin-top: 5%">
							</td>
							<td>
								<table>
									<tr>
										<td style="width: 600px;">
											<h3
												style="height: 0px; font-size: 2.3rem; color: #FF69B4; font-weight: 600;">내가
												'좋아요' 누른 회원 보기</h3>
											<br>
										</td>
									</tr>
									<tr>
										<td><font size="2em" color="#757575">내가 '좋아요' 누른 회원을 확인하세요 !</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="infos">
					<table style="width: 600px; height: 100px; margin-top: 3%;">
						<tr>
							<td style="width: 100px; height: 100px; text-align: center;">
								<img src="resources/images/photo.png"
								style="width: 55px; height: 55px; margin-left: 1.2%; margin-top: 5%">
							</td>
							<td>
								<table>
									<tr>
										<td style="width: 600px;">
											<h3
												style="height: 0px; font-size: 2.3rem; color: #22e5a6; font-weight: 600;">사진
												더보기</h3>
											<br>
										</td>
									</tr>
									<tr>
										<td><font size="2em" color="#757575">마음의 드는 상대의
												프로필 사진을 더 많이 감상하세요 !</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="infos">
					<table style="width: 600px; height: 100px; margin-top: 3%;">
						<tr>
							<td style="width: 100px; height: 100px; text-align: center;">
								<img src="resources/images/messageicon.png"
								style="width: 55px; height: 55px; margin-top: 5%">
							</td>
							<td>
								<table>
									<tr>
										<td style="width: 600px;">
											<h3 style="height: 0px; font-size: 2.3rem; color: #FF5A5A; font-weight: 600;">
												쪽지 보내기
											</h3>
											<br>
										</td>
									</tr>
									<tr>
										<td><font size="2em" color="#757575">원하는 상대에게 쪽지를 보내보세요 !</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="payList">
				<div class="paysLogo" style="text-align: center">
					<br> <font size="5em" style="color: #e9aa43;">AMANDA 결제</font>
					<br> <font size="2.5em" color="#757575">최고의 혜택과 기능을 이용해보세요</font>
				</div>
				<div
					style="border: 1px solid #dadfe6; border-radius: 12px; height: 374px; width: 297px;">
					<div class="pays" id="pay1" style="border: 3px solid #e9aa43">
						<label><input type="radio" name="pay" class="payRadio"
							onclick="changeBg1()" style="margin-top: 20%" checked="checked">
							<font size="5em" style="color: #e9aa43;" id="fontNo1">일주일
								정액제(7일)</font><br>
						<font size="4em" id="fontNo2" style="color: #e9aa43;">￦10,000원</font></label>

					</div>
					<div class="pays" id="pay2">
						<label><input type="radio" name="pay" class="payRadio"
							onclick="changeBg2()" style="margin-top: 20%"><font
							size="5em" id="fontNo3" style="color: #dadfe6;">1개월
								정액제(30일)</font><br>
						<font size="4em" id="fontNo4" style="color: #dadfe6;">￦40,000원</font></label>
					</div>
					<div class="pays" id="pay3">
						<label><input type="radio" name="pay" class="payRadio"
							onclick="changeBg3()" style="margin-top: 20%"><font
							size="5em" id="fontNo5" style="color: #dadfe6;">1년
								정액제(365일)</font><br>
						<font size="4em" id="fontNo6" style="color: #dadfe6;">￦450,000원</font></label>
					</div>
					<!-- 현재시간 -->
					<input id="hjDay" type="hidden" name="hjDay" value="<%=time3%>">
					
					<input id="data1" type="hidden" value="<%=time%>" name="seven">
					<!-- 7일 -->
					<input id="data2" type="hidden" value="<%=time1%>" name="th">
					<!-- 30일 -->
					<input id="data3" type="hidden" value="<%=time2%>" name="year">
					<!-- 365일 -->
					
					<input id="payDay" type="hidden" name="payDay" value="<%=time%>"> <!-- 결제 마감일 -->
					<input id="userId" type="hidden" name="userId" value="${sessionScope.loginUser.user_id}">	  <!-- 유저 아이디 -->
					<input type="hidden" name="price" id="price" value=10000>		  <!-- 결제 가격 -->
					<input type="hidden" name="pName" id="pName" value="일주일정액제">    <!-- 결제상품 -->
					<input type="hidden" name="goyou" id="goyou"> 					  <!-- 고유번호 -->
					<input type="hidden" name="sudanKor" id="sudaenKor"> 			  <!-- 결제수단 한국어 -->
					<input type="hidden" name="uMid" id="uMid" value="${sessionScope.loginUser.u_mid}"> 	 <!-- uMid -->
				</div>
				<div class="paygo">
					<button class="btn btn-default" id="popbutton" type="button"
						style="margin-top: 15%; width: 200px; height: 40px;">결제하기</button>
				</div>
			</div>
		</div>
		<div class="modal fade" id="layerpop">
			<div class="modal-dialog" style="margin: auto; margin-top: 10%">
				<div class="modal-content" style="width: 700px; height: 360px;">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title" style="margin-left: 43%;">결제수단 선택</h4>
					</div>

					<!-- body -->
					<div class="modal-body" id="modal">
						<table style="margin-left: 10%">
							<tr>
								<td style="width: 200px" ; height="100px">
									<input class="go" type="button" value="신용카드 결제" id="card">
								</td>
								<td style="width: 200px"><input type="button" class="go"
									value="무통장 입금" id="vbank"></td>
								<td style="width: 200px"><input type="button" class="go"
									value="실시간 계좌이체" id="trans"></td>
							</tr>
							<tr>
								<td style="width: 200px"><input type="button" class="go"
									value="휴대폰 결제" id="phone"></td>
								<td style="width: 200px"><input type="button" class="go"
									value="삼성페이 결제" id="samsung"></td>
							</tr>
							<tr>
								<td style="width: 150px" ; height="50px"></td>
							</tr>
						</table>

						<input type="hidden" name="paySudan" id="paySudan" value="card">
						<input type="hidden" name="split" id="split" value="${sessionScope.loginUser.phone}">
						<input type="hidden" name="phone" id="phone2" value="">
						
					</div>

					<!-- Footer -->
					<div class="modal-footer">
						<input type="hidden" value="${sessionScope.loginUser.pay_status}" id="statuss">
						<button type="button" class="btn btn-default"
							style="margin-right:" id="paySubmit">결제하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="margin-right: ">취소하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		var status = $("#statuss").val()
		$("#paySubmit").click(function() {
			$.ajax({
				url:"payCheck.do",
				dataType:"json",
				data:{user_id: "${sessionScope.loginUser.user_id}"},
				success:function(data){
					if(data== "Y"){
						alert("이미 결제한 회원입니다.");
					}else if (confirm("결제를 진행 하시겠습니까?") == true){
							var payDay = $("#payDay").val();
							var userId = $("#userId").val();
							var price = $("#price").val();
							var pName = $("#pName").val();
							var paySudan = $("#paySudan").val();
							
							var IMP = window.IMP; // 생략가능
							IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
							IMP.request_pay({
							    pg : 'inicis', // version 1.1.0부터 지원.
							    pay_method : paySudan,
							    merchant_uid : 'merchant_' + new Date().getTime(),
							    name : pName,
							    amount : price,
							    buyer_email : 'iamport@siot.do',
							    buyer_name : '구매자이름',
							    buyer_tel : '010-1234-5678',
							    buyer_addr : '서울특별시 강남구 삼성동',
							    buyer_postcode : '123-456',
							    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
							}, function(rsp) {
							    if ( rsp.success ) {
							    	$("#goyou").val(rsp.imp_uid);
							    	$("#payForm").submit();
							    } else {
							    	alert(rsp.error_msg);
							    }
							});
					}else{
						return;
					}
				}
					
				});
			});
	</script>
	
	<script>
	
		$(function() {
			$("#popbutton").click(function() {
				$('div.modal').modal();
			});
			
			var split = $("#split").val();
			var phone = split.replace(/-/g,"");
			$("#phone2").val(phone);
		});
		$(function() {
			$("#card").css("background-color","#4D5D7B");
			$("#card").css("color","white");
			$("#card").click(function() {
				$("#card").css("background-color","#4D5D7B");
				$("#card").css("color","white");
				
				$("#samsung").css("background-color","white");
				$("#samsung").css("color","black");
				$("#trans").css("background-color","white");
				$("#trans").css("color","black");
				$("#vbank").css("background-color","white");
				$("#vbank").css("color","black");
				$("#phone").css("background-color","white");
				$("#phone").css("color","black");
				
				$("#paySudan").val("card");
				$("#sudaenKor").val("신용카드");
			});
			$("#samsung").click(function() {
				$("#samsung").css("background-color","#4D5D7B");
				$("#samsung").css("color","white");
				
				$("#card").css("background-color","white");
				$("#card").css("color","black");
				$("#trans").css("background-color","white");
				$("#trans").css("color","black");
				$("#vbank").css("background-color","white");
				$("#vbank").css("color","black");
				$("#phone").css("background-color","white");
				$("#phone").css("color","black");
				$("#paySudan").val("samsung");
				
				$("#paySudan").val("samsung");
				$("#sudaenKor").val("삼성페이");
			});
			$("#trans").click(function() {
				$("#trans").css("background-color","#4D5D7B");
				$("#trans").css("color","white");
				
				$("#card").css("background-color","white");
				$("#card").css("color","black");
				$("#samsung").css("background-color","white");
				$("#samsung").css("color","black");
				$("#vbank").css("background-color","white");
				$("#vbank").css("color","black");
				$("#phone").css("background-color","white");
				$("#phone").css("color","black");
				$("#paySudan").val("samsung");
				
				$("#paySudan").val("trans");
				$("#sudaenKor").val("실시간 계좌이체");
			});
			$("#vbank").click(function() {
				$("#vbank").css("background-color","#4D5D7B");
				$("#vbank").css("color","white");
				
				$("#card").css("background-color","white");
				$("#card").css("color","black");
				$("#samsung").css("background-color","white");
				$("#samsung").css("color","black");
				$("#trans").css("background-color","white");
				$("#trans").css("color","black");
				$("#phone").css("background-color","white");
				$("#phone").css("color","black");
				$("#paySudan").val("samsung");
				
				$("#paySudan").val("vbank");
				$("#sudaenKor").val("무통장 입금");
			});
			$("#phone").click(function() {
				$("#phone").css("background-color","#4D5D7B");
				$("#phone").css("color","white");
				
				$("#card").css("background-color","white");
				$("#card").css("color","black");
				$("#samsung").css("background-color","white");
				$("#samsung").css("color","black");
				$("#trans").css("background-color","white");
				$("#trans").css("color","black");
				$("#vbank").css("background-color","white");
				$("#vbank").css("color","black");
				$("#paySudan").val("samsung");
				
				$("#paySudan").val("phone");
				$("#sudaenKor").val("휴대폰 결제");
			});
		});
	</script>

	<script>
		function changeBg1() {
			document.getElementById("pay2").style.border = "0px";
			document.getElementById("pay3").style.border = "0px";
			document.getElementById("pay1").style.border = "4px solid #e9aa43";
			document.getElementById("fontNo1").style.color = "#e9aa43";
			document.getElementById("fontNo2").style.color = "#e9aa43";

			document.getElementById("fontNo3").style.color = "#dadfe6";
			document.getElementById("fontNo4").style.color = "#dadfe6";
			document.getElementById("fontNo5").style.color = "#dadfe6";
			document.getElementById("fontNo6").style.color = "#dadfe6";

			document.getElementById("payDay").value = document.getElementById("data1").value
			document.getElementById("price").value = 10000;
			document.getElementById("pName").value = "일주일정액제(7일)";

		}
		function changeBg2() {
			document.getElementById("pay1").style.border = "0px";
			document.getElementById("pay3").style.border = "0px";
			document.getElementById("pay2").style.border = "4px solid #e9aa43";
			document.getElementById("pay2").style.border = "4px solid #e9aa43";
			document.getElementById("fontNo3").style.color = "#e9aa43";
			document.getElementById("fontNo4").style.color = "#e9aa43";

			document.getElementById("fontNo1").style.color = "#dadfe6";
			document.getElementById("fontNo2").style.color = "#dadfe6";
			document.getElementById("fontNo5").style.color = "#dadfe6";
			document.getElementById("fontNo6").style.color = "#dadfe6";

			document.getElementById("payDay").value = document
					.getElementById("data2").value
			document.getElementById("price").value = 40000;
			document.getElementById("pName").value = "1개월정액제(30일)";
		}
		function changeBg3() {
			document.getElementById("pay1").style.border = "0px";
			document.getElementById("pay2").style.border = "0px";
			document.getElementById("pay3").style.border = "4px solid #e9aa43";
			document.getElementById("fontNo5").style.color = "#e9aa43";
			document.getElementById("fontNo6").style.color = "#e9aa43";

			document.getElementById("fontNo1").style.color = "#dadfe6";
			document.getElementById("fontNo2").style.color = "#dadfe6";
			document.getElementById("fontNo3").style.color = "#dadfe6";
			document.getElementById("fontNo4").style.color = "#dadfe6";

			document.getElementById("payDay").value = document
					.getElementById("data3").value
			document.getElementById("price").value = 450000;
			document.getElementById("pName").value = "1년정액제(365일)";
		}
	</script>
	<br><br><br>
</body>
</html>