<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap&subset=korean" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>AMANDA - 보낸 쪽지</title>
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
	<div class="infoArea">
		<table>
			<tr>
				<td style="width: 80px; text-align: right;"><p class="first">받는 사람 : </p></td>
				<td style="width: 120px;"><p class="second"> ${result.toUserId }</p></td>
			</tr>
			<tr>
				<td style="width: 80px; text-align: right; margin-top: 1%;"><p class="first">보낸 날짜 : </p> </td>
				<td style="width: 120px;"><p class="second"> ${result.mDate }</p></td>
			</tr>
		</table>
		<br>
		<textarea style="border:0px; border-radius:8px; outline:none; resize:none; width: 400px; height: 200px; margin-left: 3.5%;" readonly="readonly">${result.mContent }</textarea>
		<div style="width: 200px; margin-left: 45%;">
			<input class="btn" type="button" onclick="check()" value="확인">
		</div>
	</div>
	
	<script>
		function check() {
			window.close();
		};
	
	</script>
	
	
	
	
	
	
	
</body>
</html>