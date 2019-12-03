/*companyVideo*/
company_video = [];
yogiyo_video = [];
ch_hero_video = [];

company_video[0] = "https://www.youtube.com/embed/lyeTBY54nf0?autoplay=1&rel=0&showinfo=0&controls=1&ps=blogger&loop=1&modestbranding=1&playsinline=1&playlist=lyeTBY54nf0";


yogiyo_video[0] = "https://www.youtube.com/embed/Hv5hxaQzAds?autoplay=0&rel=0&showinfo=0&controls=1&ps=blogger&loop=1&modestbranding=1&playsinline=1&playlist=Hv5hxaQzAds";


ch_hero_video[0] = "https://www.youtube.com/embed/Hv5hxaQzAds?autoplay=0&rel=0&showinfo=0&controls=1&ps=blogger&loop=1&modestbranding=1&playsinline=1&playlist=Hv5hxaQzAds";
ch_hero_video[1] = "https://www.youtube.com/embed/Hv5hxaQzAds?autoplay=0&rel=0&showinfo=0&controls=1&ps=blogger&loop=1&modestbranding=1&playsinline=1&playlist=Hv5hxaQzAds";
ch_hero_video[2] = "https://www.youtube.com/embed/Hv5hxaQzAds?autoplay=0&rel=0&showinfo=0&controls=1&ps=blogger&loop=1&modestbranding=1&playsinline=1&playlist=Hv5hxaQzAds";



$(document).ready(function(){
    /*main영상*/
    videoResize();
    
    $(window).resize(function(){
       videoResize(); 
    });
    
    /* Get the element you want displayed in fullscreen mode (a video in this example): */
    var elem = document.getElementById("video"); 

    /* When the openFullscreen() function is executed, open the video in fullscreen.
    Note that we must include prefixes for different browsers, as they don't support the requestFullscreen method yet */
    function openFullscreen() {
      if (elem.requestFullscreen) {
        elem.requestFullscreen();
      } else if (elem.mozRequestFullScreen) { /* Firefox */
        elem.mozRequestFullScreen();
      } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
        elem.webkitRequestFullscreen();
      } else if (elem.msRequestFullscreen) { /* IE/Edge */
        elem.msRequestFullscreen();
      }
    }
    
    /*subGnb scroll*/
    
    //스크롤 애니메이션
    $(".scroll").click(function (event) {
        event.preventDefault();
        $('html,body').stop().animate({
            scrollTop: $(this.hash).offset().top
        }, 800);
    });
    
    $(".company .menu2 .scroll").click(function () {
        $('html,body').stop().animate({
            scrollTop: $(this.hash).offset().top - 80
        }, 800);
    });
    
    
    $(".service .scroll").click(function () {
        if($('.header').not().hasClass('slide_up')){
            $('html,body').stop().animate({
                scrollTop: $(this.hash).offset().top - 50
            }, 800);   
        } else {
            $('html,body').stop().animate({
                scrollTop: $(this.hash).offset().top +50
            }, 800);
        }
    });
    
    $(".service .menu1 .scroll").click(function () {
        if($('.header').not().hasClass('slide_up')){
            $('html,body').stop().animate({
                scrollTop: $(this.hash).offset().top - 50
            }, 800);   
        } else {
            $('html,body').stop().animate({
                scrollTop: $(this.hash).offset().top
            }, 800);
        }
    });
    
    
    //selectBox
    $('.select_wrap').bind({
        click : function(){
            $('.select_wrap').not(this).find('ul').slideUp();
            $('.select_wrap').not(this).removeClass('active');
            $(this).find('ul').slideToggle();
            $(this).find('.default').toggleClass('active');
        }
    });
    $('.select_wrap').find('li').bind({
        click : function(){
            $(this).find('ul').slideUp();
            $(this).parent().parent().find('.default').html($(this).text());
        }
    });
    
    //nav eng버튼 클릭 시 alert
    // $('.nav .language').click(function(){
    //     alert('준비중 입니다.');
    // });
    
    /*visual slider*/
    /*$('.main .slider_pv').slick({
        fade: true,
        speed: 0,
        arrows: false,
        prevArrow: $('.main .slider_pv .slider_ar .prev'),
        nextArrow: $('.main .slider_pv .slider_ar .next')
    });
    $('.main .slider_pv .slider_ar .prev').click(function(){
        $(".slider_pv").slick('slickPrev');
    });
    $('.main .slider_pv .slider_ar .next').click(function(){
        $(".slider_pv").slick('slickNext');
    });*/

    /*service slider*/
    $('.service .slider').slick({
        fade: true,
        arrows: false,
        prevArrow: $('.service .slider .slider_ar .prev'),
        nextArrow: $('.service .slider .slider_ar .next')
    });
    $('.service .slider .slider_ar .prev').click(function(){
        $(".service .slider").slick('slickPrev');
    });
    $('.service .slider .slider_ar .next').click(function(){
        $('.service .slider').slick('slickNext');
    });
    
    /*interview slider*/
    $('.interview .slider').slick({
        fade: true,
        arrows: false,
        prevArrow: $('.interview .slider .slider_ar .prev'),
        nextArrow: $('.interview .slider .slider_ar .next')
    });
    $('.interview .slider .slider_ar .prev').click(function(){
        $(".interview .slider").slick('slickPrev');
    });
    $('.interview .slider .slider_ar .next').click(function(){
        $('.interview .slider').slick('slickNext');
    });
    
    /*popInterview slider*/
    $('.pop_interview .slider').slick({
        arrows: false,
        variableWidth: true,
        slidesToScroll: 1,
        slidesToShow: 1,
        centerMode: true,
        prevArrow: $('.pop_interview .slider_ar .prev'),
        nextArrow: $('.pop_interview .slider_ar .next')
    });
    $('.pop_interview .slider_ar .prev').click(function(){
        $(".pop_interview .slider").slick('slickPrev');
    });
    $('.pop_interview .slider_ar .next').click(function(){
        $('.pop_interview .slider').slick('slickNext');
    });

    /*service_pv_thumb_slider*/
    $('.pv_wrap .thumb').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        variableWidth: true,
        infinite: false
    });
    $('.pv_wrap .thumb li').click(function(){
        // $('.pv_wrap .thumb li').removeClass('on');
        $(this).parent().find('li').removeClass('on');
        $(this).addClass('on');
    });
    
    /*ch_hero_thumb*/
    $('.ch_hero .hero_list li').click(function(){
        $(this).parent().find('li').removeClass('on');
        $(this).addClass('on');
    });
    
    /*company_tour slider*/
    $('.company_tour .slider').slick({
        fade: true,
        arrows: false,
        prevArrow: $('.company_tour .slider .slider_ar .prev'),
        nextArrow: $('.company_tour .slider .slider_ar .next')
    });
    $('.company_tour .slider .slider_ar .prev').click(function(){
        $(".company_tour .slider").slick('slickPrev');
    });
    $('.company_tour .slider .slider_ar .next').click(function(){
        $('.company_tour .slider').slick('slickNext');
    });
    
    //valuePopSlider
    $('.value_pop_wrap .content').slick({
        fade: true,
        dots: true,
        slide: 'div'
    });
    $('.value_pop_wrap .slick-dots li').removeClass('slick-active');
    $('.value_pop_wrap .slick-dots li').click(function(){
        $(this).addClass('slick-active');
        if($('.value_pop_wrap .slick-dots li').hasClass('slick-active')){
            $('.value_pop').slideDown(300);
        }
        $('.value_pop_wrap .slick-arrow').animate({'opacity':'1'}, 200);
    });
    //valueButton 클릭 시 popupDropDown
    
    /*valuePop 닫기 클릭 시 slideUp*/
    $('.value_pop .btn_x').click(function(){
        $('.value_pop_wrap .slick-dots li').removeClass('slick-active');
        $('.value_pop').slideUp(300);
        $('.value_pop_wrap .slick-arrow').animate({'opacity':'0'}, 100);
    });
    
    /*tabMenuClick*/
    $('.world_wrap .tab_st li').click(function(){
        $('.world_wrap .tab_st li').removeClass('active');
        $(this).addClass('active');
    });
    $('.contact_map .tab_st li').click(function(){
        $('.contact_map .tab_st li').removeClass('active');
        $(this).addClass('active');
    });
    $('.new_board_wrap .tab_st li').click(function(){
        $('.new_board_wrap .tab_st li').removeClass('active');
        $(this).addClass('active');
    });
    
    /*boardContDropDown*/
    // $('.new_board_wrap .news_board1 .text2, .new_board_wrap .news_board1 .text4').click(function(){
    //     $('.board_view').not($(this).parent().parent().find('.board_view')).slideUp();
    //     //$('.board_view').not($(this).parent().parent()).removeClass('on');
    //     $('.new_board_wrap .news_board1 ul li').removeClass('on');
    //     $(this).parent().toggleClass('on');
    //     $(this).parent().find('.board_view').slideToggle();
    // });
    
    $('.header').mouseenter(function(){
        $(this).addClass('on'); 
    }).mouseleave(function(){
        $(this).removeClass('on'); 
    });
    
    $('.floor .floor1').click(function(){
        $('.company_tour .slider').slick('slickGoTo', 0);
    });
    $('.floor .floor2').click(function(){
        $('.company_tour .slider').slick('slickGoTo', 9);
    });
    $('.floor .floor3').click(function(){
        $('.company_tour .slider').slick('slickGoTo', 13);
    });
    $('.floor .floor4').click(function(){
        $('.company_tour .slider').slick('slickGoTo', 17);
    });
    $('.floor .floor5').click(function(){
        $('.company_tour .slider').slick('slickGoTo', 20);
    });
    $('.floor .floor6').click(function(){
        $('.company_tour .slider').slick('slickGoTo', 26);
    });
    $('.floor .floor7').click(function(){
        $('.company_tour .slider').slick('slickGoTo', 30);
    });

    
    /*채널 이동 시 scrollTop*/
    
});//DocumentEnd



/*function scrollSubGnb() {

    win_top = $(window).scrollTop();
    part1 = $(".hero, .franchise1, .news_board, .mission").offset().top;
    part2 = $(".hero_korea, .franchise2, .company_tour, .dh_culture").offset().top;
    part3 = $(".contact, .franchise3, .ch_hero, .recruitment").offset().top;
    part4 = $(".franchise4, .ci_bi, .lookie_hero").offset().top;
    part5 = $(".rider").offset().top;

    if (win_top < part2) {
        $(".sub_gnb li, .nav li").removeClass('active');
        $(".menu1").addClass('active');
    } else if (win_top >= part2 && win_top < part3) {
        $(".sub_gnb li, .nav li").removeClass('active');
        $(".menu2").addClass('active');
    } else if (win_top >= part3 && win_top < part4) {
        $(".sub_gnb li, .nav li").removeClass('active');
        $(".menu3").addClass('active');
    } else if (win_top >= part4 && win_top < part5) {
        $(".sub_gnb li, .nav li").removeClass('active');
        $(".menu4").addClass('active');
    } else if (win_top >= part5) {
        $(".sub_gnb li, .nav li").removeClass('active');
        $(".menu5").addClass('active');
    }
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        $(".sub_gnb li").removeClass('active');
        $(".menu5").addClass('active');
    }
}*/

function scrollGnb() {
    var didScroll; 
    var lastScrollTop = 0; 
    var delta = 5; 
    var navbarHeight = $('.header').outerHeight();
    
    $(window).scroll(function(event){ 
        didScroll = true; 
    });
    
    setInterval(function() { if (didScroll) { 
        hasScrolled(); didScroll = false; 
    } }); 
    
    function hasScrolled() { 
        var st = $(this).scrollTop(); // Make sure they scroll more than delta 
        if(Math.abs(lastScrollTop - st) <= delta) return; 
        // If they scrolled down and are past the navbar, add class .nav-up. 
        // This is necessary so you never see what is "behind" the navbar. 
        if (st > lastScrollTop && st > navbarHeight){ // Scroll Down 
            $('.header').removeClass('scroll_up');
            $('.sub_gnb').removeClass('scroll_up');
            $('.sub_gnb').addClass('scroll_down');
            $('.sub_nav').removeClass('scroll_up');
            if($(window).scrollTop() < 450){
                $('.sub_gnb').removeClass('scroll_down');
                $('.sub_gnb').removeClass('scroll_up');
                $('.header').removeClass('scroll_up');
                $('.header').removeClass('on');
                 $('.sub_nav').removeClass('scroll_up');
            }
        } else { // Scroll Up 
            if(st + $(window).height() < $(document).height()) { 
                $('.header').addClass('scroll_up');
            } 
            if($(window).scrollTop() < 450){
                $('.sub_gnb').removeClass('scroll_down');
                $('.sub_gnb').removeClass('scroll_up');
                $('.header').removeClass('scroll_up');
                $('.header').removeClass('on');
                $('.sub_nav').removeClass('scroll_up');
                /*header mouseenter addClass 'on'*/
                $('.header').mouseenter(function(){
                    $(this).addClass('on'); 
                }).mouseleave(function(){
                    $(this).removeClass('on'); 
                });
            }else if($(window).scrollTop() > 450){
                $('.sub_gnb').removeClass('scroll_down');
                $('.sub_gnb').addClass('scroll_up');
                $('.header').addClass('on');
                $('.header').addClass('scroll_up');
                $('.sub_nav').addClass('scroll_up');
                /*header mouseenter addClass 'on'*/
                $('.header').mouseenter(function(){
                    $(this).addClass('on'); 
                }).mouseleave(function(){
                    $(this).addClass('on'); 
                });
            }
        } 
        
        lastScrollTop = st; 
    }
}



//풀사이즈 영상사이즈 조정
function videoResize() {
    $('.main .visual').css({'max-width':'100%','min-width': '100%','min-height': '800px'});
    $('.main .video_img').css({'max-width':'100%','min-width': '100%','min-height': '800px'});
    w_w = $(window).width();
    w_h = $(window).height();
    w_r = w_h / w_w;
    v_w = 1920;
    v_h = 1080;
    v_r = v_h / v_w;
    $('.main .visual').css('height', w_h);
    if(w_r > v_r){
        $('.main .visual .video_wrap #video').css({width:'auto', 'height':'100%','top': 0});
        $('.main .visual .video_wrap .video_img').css({width:'auto', 'height':'100%','top': 0});
    }else{
        $('.main .visual .video_wrap #video').css({'width':'100%','height':'auto','top': (w_h - (w_w * v_r))/2});
        $('.main .visual .video_wrap .video_img').css({'width':'100%','height':'auto','top': (w_h - (w_w * v_r))/2});
    }
}

/*value 팝업*/
/*function valuePopDropDown(num) {
    $('.value_pop_wrap').animate({height:'234px'}, 1000);
    $('.value_pop').slideUp(0);
    $('.value_pop' + num).slideToggle(500);
    $('.value_pop').css('z-index','1');
    $('.value_pop' + num).css('z-index','10');
}*/

/*company 유튜브영상팝업*/
function companyVideo(video_num) {
    $('.company_pop').bPopup({
        onOpen: function () {
            $('#company_video').prop('src', company_video[video_num]);
        },
        onClose: function () {
            $('.youtube_player').prop('src', '');
        }
    });
}

/*franchise 유튜브영상*/
function franchiseVideo(video_num) {
    if($('.franchise1 .pv_wrap .thumb li').hasClass('video')) {
        $('.franchise1 .pv_wrap .view .youtube').show();
        $('.franchise1 .pv_wrap .view .image').hide();
        $('.franchise1 .youtube_player').prop('src', '');
        $('#franchise_video' + video_num).prop('src', yogiyo_video[video_num]);
    }
}

/*chHero 유튜브영상팝업*/
function chHeroVideo(video_num) {
    $('#ch_hero_video').prop('src', ch_hero_video[video_num]);
}


/*worldTabClick*/
function worldTabClick(contry) {
    $('.world_list').hide();
    $('.' + contry + '_list').show();
}
/*newsTabClick*/
function newsTabClick(num) {
    $('.board .board_st1').hide();
    $('.news_board' + num).show();
}
/*mapTabClick*/
function mapTabClick(num) {
    $('.contact_map .map').removeClass('active');
    $('.map' + num).addClass('active');
}
/*interviewPopuo*/
function interviewPop(person) {
    $('.pop_interview .slider').slick('refresh');
    $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
    $('.employee').addClass('hide');
    $('.nav').addClass('hide');
    $('.footer').addClass('hide');
    $('.pop_interview' + person).fadeIn('hide');
}
function interviewPopClose(){
    $('.employee').removeClass('hide');
    $('.nav').removeClass('hide');
    $('.footer').removeClass('hide');
    $('.pop_interview').fadeOut('hide');
    $(".sub_gnb li").removeClass('active');
    $(".menu1").addClass('active');
    location.href="#interview";
}
