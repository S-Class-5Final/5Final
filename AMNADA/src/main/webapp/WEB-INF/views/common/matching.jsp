<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <title>Tinder swipe cards</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="css/style.css">
  <style>
        *, *:before, *:after {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
      }
      
      body {
        background: #CCFBFE;
        overflow: hidden;
        font-family: sans-serif;
      }
      
      .tinder {
        width: 100vw;
        height: 78vh;/* 카드랑 버튼 위치 */
        overflow: hidden;
        display: flex;
        flex-direction: column;
        position: relative;
        opacity: 0;
        transition: opacity 0.1s ease-in-out;
      }
      
      .loaded.tinder {
        opacity: 1;
      }
      
      .tinder--status {
        position: absolute;
        top: 50%;
        margin-top: -30px;
        z-index: 2;
        width: 100%;
        text-align: center;
        pointer-events: none;
      }
      
      .tinder--status i {
        font-size: 100px;
        opacity: 0;
        -webkit-transform: scale(0.3);
                transform: scale(0.3);
        transition: all 0.2s ease-in-out;
        position: absolute;
        width: 100px;
        margin-left: -50px;
      }
      
      .tinder_love .fa-heart {
        opacity: 0.7;
        -webkit-transform: scale(1);
                transform: scale(1);
      }
      
      .tinder_nope .fa-remove {
        opacity: 0.7;
        -webkit-transform: scale(1);
                transform: scale(1);
      }
      
      .tinder--cards {
        flex-grow: 1;
        padding-top: 40px;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: flex-end;
        z-index: 1;
      }
      
       .tinder--card {
        display: inline-block;
        width: 90vw;
        max-width: 400px;
        height: 50vh;
        background: #FFFFFF;
        padding-bottom: 40px;
        border-radius: 8px;
        overflow: hidden;
        position: absolute;
        will-change: transform;
        transition: all 0.3s ease-in-out;
        cursor: -webkit-grab;
        cursor: grab;
      } 
      
      .moving.tinder--card {
        transition: none;
        cursor: -webkit-grabbing;
        cursor: grabbing;
      }
      
      .tinder--card img {
        max-width: 100%;
        height: 70%; /* 사진 길이 */
        pointer-events: none;
      }
      
      .tinder--card h3 {
        color: black;   
        margin-top: 32px;
        font-size: 32px;
        padding: 0 16px;
        pointer-events: none;
      }
      
      .tinder--card p {
        color: black;
        margin-top: 24px;
        font-size: 20px;
        padding: 0 16px;
        pointer-events: none;
      }
      
      .tinder--buttons {
        flex: 0 0 100px;
        text-align: center;
        padding-top: 20px;
      }
      
      .tinder--buttons button {
        border-radius: 50%;
        line-height: 60px;
        width: 60px;
        border: 0;
        background: #FFFFFF;
        display: inline-block;
        margin: 0 8px;
        cursor: pointer;
      }
      
      .tinder--buttons button:focus {
        outline: 0;
      }
      
      .tinder--buttons i {
        font-size: 32px;
        vertical-align: middle;
      }      
      .fa-heart {
        color: #FFACE4;
      }
      
      .fa-remove {
        color: #CDD6DD;
      }
      
      /* -----------------------------slider-------------------------------- */
      
      /* Slideshow container */
      .slideshow-container {
        max-width: 1000px;
        position: relative;
        margin: auto;
      }

      /* The dots/bullets/indicators */
      .dot {
        cursor: pointer;
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
      }
      
      .active, .dot:hover {
        background-color: #717171;
      }
      
      /* Next & previous buttons */
      .prev, .next {
        margin-left: -200px; /* 이거해줘야 pre버튼 보임. */
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: black;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
      }
      /* Position the "next button" to the right */
      .next {
        right: 0;
        border-radius: 3px 0 0 3px;
      }
      /* On hover, add a black background color with a little bit see-through */
      .prev:hover, .next:hover {
        background-color: rgba(0,0,0,0.8);
      }
  </style>
</head>
   <jsp:include page="matchingMenu.jsp"/>
<body>
<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPathe 변수값을 만들어주자. -->
   <c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
    <div id="main">
     <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; AMANDA</span>
     
     <div id="tinder-body">
       <div class="tinder">
           <div class="tinder--status">
             <i class="fa fa-remove"></i>
             <i class="fa fa-heart"></i>
           </div>
            
            <h2 style="color: black;">맴버 : ${mlist[0] }</h2> 
             <br>
             <h2 style="color: black;">사진 : ${plist[0] }</h2> 
          <%--    <div>
                <img src="${contextPath }/resources/userface/${plist[0].renameFileName}" style="width: 200px; height: 200px;">
                <img src="${plist[0].renameFileName}" style="width: 200px; height: 200px;">
             </div> --%>
               
           <div class="tinder--cards"> 
           </div>  
      
           <div class="tinder--buttons">
           <!-- -o하면  빈 아이콘-->   
             <button id="previous"><i class="fa fa-undo" style="color: yellowgreen;"></i></button>
             <button id="nope"><i class="fa fa-remove"></i></button>
             <button id="love"><i class="fa fa-heart"></i></button>
             <button id="superLike"><i class="fa fa-star" style="color: skyblue;"></i></button>
           </div>
      </div>
   </div>
   
<!-- ajax로 매치카드 생성하기. -->
<script>
   // ajax로 카드를 먼저 만들어주자!
   makeCard();

    // 자동실행 부분
    $(function() {
      var tinderContainer = document.querySelector('.tinder');
      var allCards = document.querySelectorAll('.tinder--card');
      var nope = document.getElementById('nope');
      var love = document.getElementById('love');
      
      /* 1. 카드시작 함수 */
      function initCards(card, index) {
        var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
      
        newCards.forEach(function (card, index) {
          card.style.zIndex = allCards.length - index;
          card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
          card.style.opacity = (10 - index) / 10;
        });
        
        tinderContainer.classList.add('loaded');
      }
      /* -------------- */
      
      initCards();
      
      /* 모든 카드에게, 드래그 먹이는 작업. */
      allCards.forEach(function (el) {
        var hammertime = new Hammer(el);
      
        hammertime.on('pan', function (event) {
          el.classList.add('moving');
        });
      
        hammertime.on('pan', function (event) {
          if (event.deltaX === 0) return;
          if (event.center.x === 0 && event.center.y === 0) return;
      
          // event.delta(X,Y) : 지금까지 드래그한 거리값을 가져옴.
          // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(양수)일때 값을 love로 지정한다는거.
          // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(음수)일때 값을 nope로 지정한다는거.
          tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
          tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
      
          var xMulti = event.deltaX * 0.03;
          var yMulti = event.deltaY / 80;
          var rotate = xMulti * yMulti;
      
          event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
        });
      
        hammertime.on('panend', function (event) {
          el.classList.remove('moving');
          tinderContainer.classList.remove('tinder_love');   
          tinderContainer.classList.remove('tinder_nope');
      
          var moveOutWidth = document.body.clientWidth;
          var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;
      
          event.target.classList.toggle('removed', !keep);
      
          if (keep) {
            event.target.style.transform = '';
          } else {
            var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
            var toX = event.deltaX > 0 ? endX : -endX;
            var endY = Math.abs(event.velocityY) * moveOutWidth;
            var toY = event.deltaY > 0 ? endY : -endY;
            var xMulti = event.deltaX * 0.03;
            var yMulti = event.deltaY / 80;
            var rotate = xMulti * yMulti;
      
            event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
            initCards();
          }
        });
      });
      /* --------------------------------- */
      
      
      function createButtonListener(love) {
        return function (event) {
          var cards = document.querySelectorAll('.tinder--card:not(.removed)');
          var moveOutWidth = document.body.clientWidth * 1.5;
      
          if (!cards.length) return false;
      
          var card = cards[0];
      
          card.classList.add('removed');
      
          if (love) {
            card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
          } else {
            card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
          }
      
          initCards();
      
          event.preventDefault();
        };
      }
      
      var nopeListener = createButtonListener(false);
      var loveListener = createButtonListener(true);
      
      nope.addEventListener('click', nopeListener);
      love.addEventListener('click', loveListener);
    });
    
    
    
    
    // ajax 카드만들기 함수.
    function makeCard() {
       // 1. 사진뺀 카드만들기
       $.ajax({
          url:"mList.do",
          type:"get",
          dataType: "json",
          contentType:"application/json;charset=utf-8",
          success: function(mlist) {
             $.each(mlist, function(index, value) {
                var str = 
                           "<div id = card"+(index+1)+" class=tinder--card>"+
                           "      <div class='mySlides"+(index+1)+" fade' style='pointer-events: none;'>"+
                           "         <img src='${contextPath }/resources/userface/${plist[0].renameFileName}' style='width: 400px; height: 300px;'>"+
                           "      </div>"+
                           "      <div class='mySlides"+(index+1)+" fade' style='pointer-events: none;'>"+
                           "         <img src='${contextPath }/resources/userface/${plist[1].renameFileName}' style='width: 400px; height: 300px;'>"+
                           "      </div>"+
                           "      <div class='mySlides"+(index+1)+" fade' style='pointer-events: none;'>"+
                           "         <img src='${contextPath }/resources/userface/${plist[2].renameFileName}' style='width: 400px; height: 300px;'>"+
                           "      </div>"+
                           "      <a class=prev onclick=plusSlides(-1)>&#10094;</a>"+
                           "      <a class=next onclick=plusSlides(1)>&#10095;</a>"+
                           "      <div style=text-align:center style='pointer-events: none;'>"+
                           "          <span class=dot onclick=currentSlide(1)></span>"+
                           "          <span class=dot onclick=currentSlide(2)></span>"+
                           "          <span class=dot onclick=currentSlide(3)></span>"+
                           "      </div>"+
                           "      <h3 id=tUser-name>"+mlist[index].user_nick +"</h3>"+
                           "      <p id=tUser-summary>"+mlist[index].user_into +"</p>"+
                           "</div>";
                        
                       $(".tinder--cards").append(str);    
             });
          },
          error:function(request, status, errorData){
             alert("매칭 에이젝스 error code: " + request.status + "\n"
                   +"message: " + request.responseText
                   
                   +"error: " + errorData);
          }
       });
       
       // 2. 사진을 뺀 자리에 넣기.
       $.ajax({
          url:"mList.do",
          type:"get",
          dataType: "json",
          contentType:"application/json;charset=utf-8",
          success: function(plist) {
            
         }
       });
    } 
</script>
           
     
<script src='https://hammerjs.github.io/dist/hammer.min.js'></script>
<script  src="js/index.js"></script>
<script type="text/javascript">
   
</script>
     
     
    <!-- previous 버튼 누를 시. -->
    <script>
    /*          
    .css('z-index','1000')
    .css('opacity', '1')
   .css('touch-action', 'pan-y')
   .css('user-select', 'none')          
   .css('-webkit-user-drag', 'none')
   .css('-webkit-tap-highlight-color', 'rgba(0,0,0,0)'); 
      .css(transform: scale(1) translateY(0px)) ;
*/


//var A = $("#card"+i).text();
//var A = $("#card"+i);

//alert(A);
//alert(i);
//var ind = 3;

   /* 
      for(var j = 1; j < ${mlist.size()}; j++){
              $("#card"+(i-(i-j))).css('transform','translate(0px, 0px) rotate(0deg)').css('z-index','800');
        }
   */
   
       $("#previous").on('click', function() {
          alert("dd");
           var test = $(".removed").last();
         console.log(test);    
         test.removeClass('.removed');
           test.css('transform','translate(0px, 0px) rotate(0deg)').css('z-index','800');
    
           /*       var count = 2;
          for(var i = 1; i <= ${mlist.size()}; i++){   
             
              $("#card"+(i-3)).css('transform','translate(0px, 0px) rotate(0deg)').css('z-index','800').css('transform', 'scale(1) translateY(0px)');
         } */
          
      });
    </script>
    
    <!-- nope버튼 투를 시 -->
   <!--  <script>
       $("#nope").on('click', function() {
         alert("dd");
         
         
      });
    </script> -->
    
    
    <!-- superLike 버튼 누를 시 -->
    <script>
       $("#superLike").on('click', function() {
         // 상대방과 바로 채팅으로 연결되어야함. 
         alert("상대방과 채팅으로 넘어갑니다.");   
      
      });
    </script>
     
     
     
     
     
     
    <!-- 이미지 슬라이드 관련 --> 
     <script>
        // 1. 슬라이드가 1(처음)일 때,,,
      var slideIndex = 1;
      showSlides(slideIndex);
      
      // 2. 다음 슬라이드로 넘어갈 때,,, 
       function plusSlides(n) {
        showSlides(slideIndex += n);
      } 
      // 3. 현재 슬라이드 보고 있을 때,,,
      function currentSlide(n) {
        showSlides(slideIndex = n);
      }
      
      // 위의 1,2,3 에서 매개변수 갖고와서 돌자.
      // 슬라이드 보여주는 함수
      function showSlides(n) {
          var i;
        //var slides = document.getElementsByClassName("mySlides"); // 사진부분.
          for(var num = 1   ; num <= 4; num++){ 
        //   var slides = $("#card"+num+" .mySlides"+num);
          var slides = $(".mySlides"+num);
          var dots = document.getElementsByClassName("dot"); // 사진 넘길 수 있는 점들.
           
           if (n > slides.length){ 
              slideIndex = 1
           }   
           if (n < 1) {
              slideIndex = slides.length
           }
           for (i = 0; i < slides.length; i++) {
                 slides[i].style.display = "none";  
           }
           for (i = 0; i < dots.length; i++) {
               dots[i].className = dots[i].className.replace(" active", "");
           }
           slides[slideIndex-1].style.display = "block";  
           dots[slideIndex-1].className += " active";
        }      
           
      }
   </script>
     
     
   </div> 
</body>
   <jsp:include page="matchingFooter.jsp"/>
</html>