<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AMANDA - 쪽지 답장</title>
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap&subset=korean" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	.infoArea{
		border: 1px dashed #D5D5D5;
		border-radius: 10px;
		width: 430px;
		height: 350px;
	}
	body{
		background: #E0F2FE;
	}
	.first{
		font-family: 'Yeon Sung', cursive;
		font-weight: bold;
		height: 1px;
	}
	.second{
		height: 2px;
	}
	.btn{
		border: 1px solid #BDBDBD;
		background: white;
		border-radius: 5px;
		width: 60px;
	}
	.btn:hover{
		background: #4978FF;
		cursor: pointer;
	}
</style>
</head>
<body>
<form action="goMsgRe.do" method="post" id="Remsg">
	<div class="infoArea">
		<table>
			<tr>
				<td style="width: 80px; text-align: right;"><p class="first">받는 사람 : </p></td>
				<td style="width: 120px;"><p class="first"><input type="text" value="${userId }" name="toUserId" style="outline:none; border: 0.8px solid #1559FF; border-radius: 3px;" readonly="readonly"></p></td>
			</tr>
			<tr>
				<td style="width: 80px; text-align: right; margin-top: 1%;"><p class="first">제목 : </p> </td>
				<td style="width: 120px;"><p class="first"><input type="text" name="mTitle" style="width: 330px; border-radius: 3px; border: 0.8px solid #1559FF; outline: none;"></p></td>
			</tr>
		</table>
		<br>
		<textarea name="mContent" style="border:0px; border-radius:8px; outline:none; resize:none; width: 400px; height: 200px; margin-left: 3.5%; border: 0.9px solid #1559FF;"></textarea>
		<div style="width: 200px; margin-left: 38%;">
			<button class="btn" type="button" onclick="Gosubmit()">보내기</button>
			<button class="btn" onclick="check()">취소</button>
			<input type="hidden" value="${sessionScope.loginUser.user_id}" name="userId">
			<input type="hidden" value="${sessionScope.loginUser.u_mid}" name="uMid">
		</div>
	</div>
</form>
	<script>
		function check() {
			window.close();
		};
		function Gosubmit() {
			$("#Remsg").submit();
			alert("답장을 보냈습니다.");
			window.close();
		};
	</script>
</body>
</html>