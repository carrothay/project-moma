<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@ include file="../sessionChk.jsp" %> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("../../css/content/reserveForm.css");
</style>
<script type="text/javascript">
 	$(function(){
		var sumCnt = 1;
		var sumPrice = 0;
		
		// 수량 감소
		$('#minus').on("click",function(e) {
			e.preventDefault();
			var oldValue = $(this).siblings("span").text();
			var num = parseInt(oldValue);
			var price = 7000;
			
			num -= 1;

			if (num <= 0) {
				alert('최저 수량입니다.');
				num = 1;
				sumPrice = price;
			}
			else {
				sumPrice = num * price;
				sumCnt--;	
			}
			
			$(this).siblings("span").text(sumCnt);
			$(this).siblings("input").val(sumCnt);
			$(".price_sp").text(sumPrice+"원");
			$(".price").val(sumPrice);
			$('.member_info td .sum_count').text(sumCnt);
			$.totalPrice();
		});
		
		// 수량 증가
		$('#plus').on("click",function(e) {
			e.preventDefault();
			var stat = $(this).siblings("span").text();
			var num = parseInt(stat);
			var price = 7000;

			num += 1;
			
			if (num > 20) {
				alert('최고 수량입니다.');
				num = 20;
			}
			else {
				sumPrice = num * price;
				sumCnt++;
			}
			
			$(this).siblings("span").text(sumCnt);
			$(this).siblings("input").val(sumCnt);
			$(".price_sp").css("color", "var(--point-color)");
			$(".price_sp").text(sumPrice+"원");
			$(".price").val(sumPrice);
			$('.member_info td .sum_count').text(num);
			$.totalPrice();
		});
 		
		// 전체 가격 찾기
		$.totalPrice = function() {
			var price = $(".price_sp").text().split("원")[0];
			var priceNum = Number(price);
			
			var totalPrice = price;
			
			totalPrice = priceNum;
			
			$('.member_info td .total_price').text(totalPrice+"원");
		}
	});
</script>
</head><body>
<form action="reserveAction.so?cno=${content.cno }&mno=${member.mno}" method="post" name="frm">
	<div class="container">
		<div class="reserve_title">예매하기</div>
			<div class="section">
			<div class="section_title">< &nbsp; ${content.cname } &nbsp; ></div>
				<div class="option_title">예매날짜
					<div class="rsdate_box">
						<input type="date" class="column" name="rsdate" placeholder="0000-00-00" onfocus="(this.type='date')" required="required">
					</div><p>
				</div>	
				<div class="option_title">예매시간 선택<p>
					<div class="radio_box">
						<div>
							<input class="magic-radio" type="radio" name="rstime" value="10:00" checked="checked" id="t1">
							<label for="t1">10:00</label>
						</div>
						<div>
							<input class="magic-radio" type="radio" name="rstime" value="12:00" id="t2">
							<label for="t2">12:00</label>
						</div>
						<div>
							<input class="magic-radio" type="radio" name="rstime" value="14:00" id="t3">
							<label for="t3">14:00</label>
						</div>
						<div>	
							<input class="magic-radio" type="radio" name="rstime" value="16:00" id="t4">
							<label for="t4">16:00</label>
						</div>
						<div>	
							<input class="magic-radio" type="radio" name="rstime" value="18:00" id="t5">
							<label for="t5">18:00</label>
						</div>
					</div>
				</div>
				<div class="option_title">영화관 선택<br>
					<select class="cinema" name="cinema">
						<option value="CGV">CGV<option value="롯데시네마">롯데시네마<option value="메가박스">메가박스
					</select>
				</div><p>
				<div class="option_title">수량 선택
					<div class="cnt_box">
						<button class="button" type="button" id="minus">-</button>&nbsp;
						<span>1</span>&nbsp;
						<button class="button" type="button" id="plus">+</button>
						<input type="hidden" name="rsnum" class="input_hidden" value="0">
					</div>
				</div>
				<div class="price_box">
					<span class="price_sp">7000원</span>
					<input type="hidden" name="price" class="price" value="0">
				</div>
				
			<div class="section">
				<p class="section_title">예매자 정보</p>
				<table class="member_info">
					<tr><th>예매자</th><td>${member.mname }</td></tr>
					<tr><th>연락처</th><td>${member.phone }</td></tr>
					<tr><th>이메일</th><td>${member.email }</td></tr>
					<tr><th>예매내용</th><td>${content.cname }, 총 <span class="sum_count">1</span>매, <span class="total_price">7000원</span></td></tr>
				</table>
			</div>
			<div class="section">
				<p class="section_title">결제 방식 선택</p>
				<div class="radio_box">
					<div class="radio_entity">	
						<input class="magic-radio" type="radio" name="payment" value="카드결제"  id="p1" checked="checked">
						<label for="p1">카드로결제</label>
					</div>
					<div class="radio_entity">	
						<input class="magic-radio" type="radio" name="payment" value="카카오페이"  id="p2">
						<label for="p2">카카오페이</label>
					</div>
					<div class="radio_entity">	
						<input class="magic-radio" type="radio" name="payment"  value="네이버페이" id="p3">
						<label for="p3">네이버페이</label>
					</div>
					<div class="radio_entity">	
						<input class="magic-radio" type="radio" name="payment"  value="휴대폰결제"  id="p4">
						<label for="p4">휴대폰결제</label>
					</div>
				</div>
				<input type="submit" class="btn" value="예매하기">
			</div>
		</div>
	</div>
	</div>
</form>
</body>
</html>