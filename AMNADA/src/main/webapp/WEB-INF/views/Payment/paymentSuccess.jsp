<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Jua|Yeon+Sung&display=swap&subset=korean" rel="stylesheet">
<title>AMANDA - 결제 완료</title>
<style>
	.mainInfo{
		border: 1px solid #BDBDBD; 
		width: 800px; 
		height: 660px; 
		margin: auto; 
		margin-top: 5%;
		border-radius: 30px;
		text-align: center;
	}
	.success{
		font-family: 'Jua', sans-serif;
		font-size: 40px;
		color: #2180E8;
		margin-top: 11%;
	}
	.infoList{
		height: 3px; 
		text-align: right;
		font-family: 'Jua', sans-serif;
		color: #757575;
	
	}
	.mainTb{
		margin: auto; 
		border: 0px solid #BDBDBD;
		border-radius: 20px;
	}
	.sudan{
		font-family: 'Yeon Sung', cursive;
		font-size: 20px;
	}
	.pjump{
		width: 200px;
		height: 40px;
		background: white;
		border: 2px solid #BDBDBD; 
		border-radius: 25px;
		outline: none;
		color: black;
	}
	#pj1:hover{
		border: 2px solid #5386FF; 
		cursor: pointer;
		color: #5386FF;
		font-weight: bold;
	}
	
	#pj2:hover{
		border: 2px solid #5386FF; 
		cursor: pointer;
		color: #5386FF;
		font-weight: bold;
	}
	.mini{
		font-family: 'Jua', sans-serif;
		font-size: 17px;
		margin-top: 4%;
	}
</style>


</head>
<body>
	<div class="mainInfo">
		<table style="margin: auto;">
			<tr>
				<td>
					<img src="resources/images/paysuccess.png"style="width: 85px; height: 85px; margin-top: 5%">
				</td>
				<td>
					<p class="success"> 결제가 완료되었습니다.</p>
				</td>
			</tr>
		</table>
		
		<table class="mainTb">
			<tr style="height:35px;">
				<td style="width: 150px;">
					
				</td>
				<td style="width: 480px; font-family: 'Jua', sans-serif; color: #757575; font-size: 19px;">
					결제내역 상세보기
				</td>
			</tr>
			
			<tr>
				<td class="infoList">
					주문자 아이디 :
				</td>
				<td>
					<p class="sudan">${userId} &nbsp;</p>
					<hr style="border: 1px dashed #BDBDBD; width: 350px;">
				</td>
			</tr>
			
			<tr>
				<td class="infoList">
					결제한 상품명 :
				</td>
				<td>
					<p class="sudan">${pName} &nbsp;</p>
					<hr style="border: 1px dashed #BDBDBD; width: 350px;">
				</td>	
			</tr>
			
			<tr>
				<td class="infoList">
					결제 일시 :
				</td>
				<td>
					<p class="sudan">${hDay} &nbsp;</p>
					<hr style="border: 1px dashed #BDBDBD; width: 350px;">
				</td>	
			</tr>
			
			<tr>
				<td class="infoList">
					상품 사용기한 :
				</td>
				<td>
					<p class="sudan">${pDay} &nbsp;</p>
					<hr style="border: 1px dashed #BDBDBD; width: 350px;">
				</td>
			</tr>
			<tr>
				<td class="infoList">
					결제 수단 :
				</td>
				<td>
					<p class="sudan">${sudanKor} &nbsp;</p>
					<hr style="border: 1px dashed #BDBDBD; width: 350px;">
				</td>
			</tr>
		</table>
		
		<table style="margin: auto; margin-top: 3%">
			<tr>
				<td style="width: 160px; ">
					<button class="pjump" id="pj1" onclick="location.href='SuccessReturn.do'"><p class="mini">매칭하러 가기</p></button>
				</td>
			</tr>
		</table>
	</div>
	<script>
	
	</script>
	
	<br><br>
</body>
</html>

