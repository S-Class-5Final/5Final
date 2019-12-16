// 변수에 모듈에 대한 정의
// express변수에 express 모듈 정의
var express = require('express');

var app = express();
// http모듈에 server을 express의 속성을 가진고 정의
var http = require('http').Server(app);
// socket.io 모듈을 io 변수에 정의 또한 이 socket.io는 http의 속성을 가진다
var io = require('socket.io')(http);
// body-parser 모듈 정의
var bodyParser = require('body-parser');

// app 변수에  body-parser 모듈을 세팅
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());


// 접속 유저 리스트 (나중에 구현)
var connUser = new Array();

// socket.io를 작동하여 양방향 통신을 시작
io.on('connection', function (socket) {
    console.log('한명의 유저가 접속을 했습니다.');
    // socket.io를 통해 접속한 유저를 판별
    socket.on('disconnect', () => {
        console.log('한명의 유저가 접속해제를 했습니다.');
    });
    
    // roomNum을 통해 해당 이름을 가진 방을 만들어 방안에 접속한 사람들간에 통신 ( 채팅 시작 )
    socket.on('joinRoom', (roomNum, name) => {
    	socket.join(roomNum, () =>{
    		console.log(name + '님이  참가하였습니다.');
    		io.to(roomNum).emit('joinRoom', roomNum, name);
    	});
    });
    
    // roomNum에서 나간다. ( 채팅 종료 )
    socket.on('leaveRoom', (roomNum, name) =>{
    	socket.leave(roomNum, () =>{
    		console.log(name + '님이 나가셨습니다.');
    		
    		io.to(roomNum).emit('leaveRoom', roomNum, name);
    	});
    });
    
    // roomNum방에서 통신한 내역을 같은 방에 존재하는 인원에게 전송
    socket.on('send_msg', (roomNum, name, msg) => {
        //다시, 소켓을 통해 이벤트를 전송한다.
    	
        io.to(roomNum).emit('chat_msg', name, msg);
    });
    
    socket.on('loginUser', (userName) =>{
	console.log(connUser.indexOf(userName));
    	if(connUser.indexOf(userName) == -1){
    		connUser.push(userName);
    		socket.join(userName, () =>{
        		console.log(userName + '님이  로그인하였습니다.');
        	});
    	}
    	console.log(connUser);
    });
    
    socket.on('logoutUser', (userName) =>{
    	connUser.splice(connUser.indexOf(userName), 1);
    	console.log(userName + '님이  로그아웃했습니다.');
    });

  socket.on('sendLike', (userName) =>{
	if(connUser.indexOf(userName) > -1){
		io.to(userName).emit('getLike', userName);
	}
    });
});

// 서버를 작동 port번호는 위에 port변수에 정의한 80번
http.listen(80, () => {
    console.log('listening on *:80');
});