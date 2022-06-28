<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/content/momaMain.css");</style>
<link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick-theme.css"/>
<script type="text/javascript">
    /* 상단 배너 기능 */
	$(function() {
		var auto = true;
		var pause = 7000;
		var $this = $('.slider');
		
		var slidesCont = $this.children('.slides-container');
		var slides = slidesCont.children('.slide');
		var arrowsCont = $this.children('.arrows');
		var prevSlide = arrowsCont.children('.prev');
		var nextSlide = arrowsCont.children('.next');
		
		var slidesCount = slides.length;
		var currentSlide = slides.first();
		var currentSlideIndex = 1;
		var autoPlay = null;
		
		slides.not(':first').css('display', 'none');
		currentSlide.addClass('active');
		
		function fadeNext(){
			currentSlide.removeClass('active').fadeOut(700);
			
			if(currentSlideIndex == slidesCount){
				currentSlide = slides.first();
				currentSlide.delay(500).addClass('active').fadeIn(700);
				currentSlideIndex=1;
			} else {
				currentSlideIndex++;
				currentSlide = currentSlide.next();
				currentSlide.delay(500).addClass('active').fadeIn(700);
			}
		}
		function fadePrev(){
			currentSlide.removeClass('active').fadeOut(700);
			if (currentSlideIndex ==1){
				currentSlide=slides.last();
				currentSlide.delay(500).addClass('active').fadeIn();
				currentSlideIndex=slidesCount;
			} else {
				currentSlideIndex--;
				currentSlide = currentSlide.prev();
				currentSlide.delay(500).addClass('active').fadeIn(700);
			}
		}
		function AutoPlay(){
			clearInterval(autoPlay);
			if(auto == true) autoPlay = setInterval(function(){fadeNext()},pause);
		}
		$(nextSlide).click(function(e){
			e.preventDefault();
			fadeNext();
			AutoPlay();
		});
		$(prevSlide).click(function(e){
			e.preventDefault();
			fadePrev();
			AutoPlay();
		});
		AutoPlay();
	});
    
    /* 영화 순위 배너 */
	$(document).ready(function(){
	  $('.content_list').slick({
		  slide: 'li',      //슬라이드 되어야 할 태그 ex) div, li
          infinite : false,    //무한 반복 옵션   
          slidesToShow : 5,      // 한 화면에 보여질 컨텐츠 개수
          slidesToScroll : 5,      //스크롤 한번에 움직일 컨텐츠 개수
          speed : 300,    // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
          arrows : false,       // 옆으로 이동하는 화살표 표시 여부
          dots : true,       // 스크롤바 아래 점으로 페이지네이션 여부
          autoplay : true,         // 자동 스크롤 사용 여부
          autoplaySpeed : 5000,       // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
          pauseOnHover : true,      // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
          vertical : false,      // 세로 방향 슬라이드 옵션
          dotsClass : "slick-dots",    //아래 나오는 페이지네이션(점) css class 지정
	
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ]
		});
	});
</script>
</head>
<body>
<!-- 검색바 -->
<div class="container_wide">

	<div class="slider">
		<div class="slides-container">
			<div class="slide" onclick="location.href='/moma/views/board/boardView.ha?bno=1'">
				<img alt="Slider img 1" src="/moma/img/main_slide_image/1.JPG">
				<div class="centered">열대야에 어울리는 시원한 여름 힐링 영화<br>'맘마미아'</div>
			</div>
			<div class="slide" onclick="location.href='/moma/views/board/boardView.ha?bno=2'">
				<img alt="Slider img 2" src="/moma/img/main_slide_image/2.jpg">
				<div class="centered">'요노스케 이야기'<br>평범했지만 웃음이 나오는 이야기</div>
			</div>
			<div class="slide" onclick="location.href='/moma/views/board/boardView.ha?bno=3'">
			<img alt="Slider img 3" src="/moma/img/main_slide_image/3.jpg">
				<div class="centered">8살 소녀가 받아들인 이별이야기<br>'역으로 가는 길을 알려줘'</div>
			</div>
		</div>
		
		<div class="arrows">
			<a class="prev" href="#"><img class="left" alt="" src="/moma/img/icon/left.png"></a>
			<a class="next" href="#"><img class="right" alt="" src="/moma/img/icon/right (1).png"></a>
		</div>
	</div>

	<div class="search_box">
		<form method="post" name="srch" action="searchAction.so">
			<input class="search" type="text" name="srch" placeholder="검색어를 입력해주세요">
			<button type="submit" style="border:none; background-color: transparent;"><img class="search" id="search" alt="검색" src="/moma/img/icon/search.png" width="30px"></img></button>
		</form>
	</div>
	
	<section class="content_main">
		<!-- 영화 -->
		<ul class="content_tab">
			<li class="title" id="tab1" onclick="location.href='movieMain.so'">영화</li>
			    <div class = "subtitle"> - 조회수 TOP 10</div>
				<ul class="content_list">
					<c:forEach var="content" items="${mlist }">
						<c:if test="${content.sort == 'm' }">
							<li class="ctslide">
								<a href="contentView.do?cno=${content.cno }">
									<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
									<div class="text_area">
										<p class="content_list_title">${content.cname }</p>
									</div>
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>	
		</ul>
		<!-- 드라마 -->
		<ul class="content_tab">
			<li class="title" id="tab2" onclick="location.href='dramaMain.so'">드라마</li>
			   <div class = "subtitle"> - 조회수 TOP 10</div>
				<ul class="content_list">
					<c:forEach var="content" items="${dlist }">
						<c:if test="${content.sort == 'd' }">
							<li class="ctslide">
								<a href="contentView.do?cno=${content.cno }">
									<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
									<div class="text_area">
										<p class="content_list_title">${content.cname }</p>
									</div>
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
		</ul>
				<!-- 예매 가능한 영화 -->
		<ul class="content_tab">
			<li class="content_title" id="tab3">예매 가능한 영화</li>
				<ul class="content_list">
					<c:forEach var="content" items="${list }">
						<c:if test="${content.reserve == 'Y' }">
							<li class="ctslide">
								<a href="contentView.do?cno=${content.cno }">
									<img style="background: url(/moma/img/poster/${content.poster }) no-repeat center; background-size: cover;">
									<div class="text_area">
										<p class="content_list_title">${content.cname }</p>
									</div>
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
		</ul>
	</section>
</div>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="./slick-1.8.1/slick/slick.min.js"></script>
</body>
</html>