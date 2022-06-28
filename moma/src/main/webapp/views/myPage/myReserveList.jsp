<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><%@ include file="/views/sessionChk.jsp"%>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<script type="text/javascript">
	 //페이징 현재페이지 설정
	   $(function() {
	      $('#page'+${currentPage}).css({
	      "color" : "var(--point-color)",
	      "font-weight" : "600"
	      });
	   });
</script></head><body>

	<div class="container_middle">
		<!-- myMainMenu -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		
		<!-- 내용 -->
		<div class="content">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">예매한 영화가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<p>
				<h3>예매한 영화</h3>
				<ul>
					<c:forEach var="reservation" items="${list}">
						<li class= "rsv">
							<a href="/moma/views/content/contentView.do?cno=${reservation.cno}">
								<img alt="포스터" src="../../img/poster/${reservation.cno}.jpg">
							</a>
							<div class="txt_area">
								<a href="/moma/views/content/contentView.do?cno=${reservation.cno}" class="cursor">
									<span class="txt_title">${reservation.cname }</span>
									<span class="txt">${reservation.rsdate}</span>
									<span class="txt">${reservation.rstime}</span>
									<span class="txt">${reservation.cinema}</span>
									<span class="txt">총 ${reservation.rsnum}인</span>
								</a>
								<div class="txt_bottom">
									<div class="btn_area">
										<a href="/moma/views/content/reserveDelete.so?rsno=${reservation.rsno}" class="btn_rsv">예매 취소</a>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	
	
		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myReserveList.bb?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../img/icon/left (1).png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myReserveList.bb?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../img/icon/left.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myReserveList.bb?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myReserveList.bb?pageNum=${currentPage + 1}'">
						<img alt="다음" src="../../img/icon/right (1).png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myReserveList.bb?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../img/icon/right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>