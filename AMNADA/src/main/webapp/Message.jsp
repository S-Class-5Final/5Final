<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>쪽지 보내기</title>
</head>
<body>
	<form action="messageSend.do" method="post" id="messagsSend">
		<input id="popbutton" value="쪽지 보내기" type="button">
		<div class="modal fade" id="layerpop">
			<div class="modal-dialog" style="margin: auto; margin-top: 10%">
				<div class="modal-content" style="width: 600px; height: 460px;">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<h4 class="modal-title" style="margin-left: 43%;">쪽지 보내기</h4>
						<input type="hidden" value="${sessionScope.loginUser.user_id}" name="userId"> <!-- 보낸사람 -->
						<input type="hidden" id="toUserId" value="test" name="toUserId"> <!-- 받는사람 -->
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
									<textarea style="width:420px; height: 150px;" name="mContent"></textarea>
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
		$(function() {
			$("#popbutton").click(function() {
				$('div.modal').modal();
			});
			
			$("#msgGo").click(function () {
				$("#messagsSend").submit();
			});
		});
	</script>


	
</body>
</html>