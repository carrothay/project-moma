<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<script type="text/javascript">

$(function() {
	
	// input range rate 조절
	$('input[type="range"]').on('change mousemove', function() {
		var val = ($(this).val() - $(this).attr('min')) / ($(this).attr('max') - $(this).attr('min'));

	    $(this).css('background-image',
	                '-webkit-gradient(linear, left top, right top, '
	                + 'color-stop(' + val + ', #ff5f06), '
	                + 'color-stop(' + val + ', #e4e4e4)'
	                + ')'
       	);
	    // span에 등록한 별점(range value) 넣기
	    $('#input_span').text($(this).val());
	});
	
	// scroll top
	$('.scroll_top').on('click', function(e) {
		e.preventDefault();
		$('html, body').animate({scrollTop: 0}, 200);
	});
	
	// scroll top button show/hide
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.scroll_top').fadeIn(500);
		} else {
			$('.scroll_top').fadeOut('slow');
		}
	});
	
});
	
</script></head><body>

	 <div class="container_middle">
		<!-- myMainMenu -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		
 	 <form action="myReviewUpdateAction.bb?rvno=${review.rvno}" method="post">
  
            <div class="content">
			 <h3 class="sub_title">리뷰 수정</h3>
				<ul>
					<li class=likes>
						<a href="/moma/views/content/contentView.do?cno=${review.cno}" class="cursor">
							<img src ="/moma/img/poster/${review.cno}.jpg" style =" no-repeat center; background-size: cover;">
							<div class="up_title"> ${content.cname }	</div>
						</a>
					</li>
				</ul>
			</div>
			
			<!-- 엔터키 전송 막기 -->
			<div style="display:none">
				<input type="submit" onclick="return false"/>
				<input type="text"/>
			</div>
	      	
	      	<!-- 리뷰 수정 -->
        	<input type="hidden" name="rv_date" value="${review1.rv_date }">
            <h4 class="sub_title">감상평을 작성해 주세요.</h4>
            <div class = rvup_content>
            	<textarea name="rv_content" placeholder="클릭 후 새로운 내용을 작성해주세요. (이전 감상평 : ${review.rv_content})" style="color:gray;"  required="required"></textarea>
            </div>
            <p class="txt_star">별점을 선택해 주세요.</p>

            <!-- 별점 등록 -->
            <div class="star_rate_up">
                <input type="range" name="star_rate" min="0" max="10" step="1"  required="required" value="${review.star_rate}">
                <div class="star_rate_num">
                <span class="text" id="input_span">${review.star_rate}</span>
            	</div>
            </div>
            
            <div class="submit_box">
                 <input type="submit" class="btn_small_rv1" value="수정하기">
            	 <input type="button" class="btn_small_rv2" onclick="history.go(-1)" value="취소">
            </div>
      	   </form>
			
            
        
  		</form>
	</div>
</body>
</html>