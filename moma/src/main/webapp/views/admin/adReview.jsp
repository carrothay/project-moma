<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value='${sessionScope.id}'/>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
<style type="text/css">@import url("/moma/css/admin/adReview.css");</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	//페이징 현재페이지 설정
	$(function() {
		$('#page'+${currentPage}).css({
		"color" : "var(--point-color)",
		"font-weight" : "600"
		});
	});
	
</script>
</head>
<body>
	<div class="container_middle">
		<!-- adMainMenu -->
		<jsp:include page="adMainMenu.jsp"></jsp:include>
			<div class="content">
			<div class="ad_title">리뷰 목록</div>
			<table>
				<tr><th>리뷰 번호</th><th>제목</th><th>닉네임</th><th>별점</th><th>내용</th><th>작성 날짜</th><th>삭제</th></tr>
				<c:if test="${empty list}">
					<ul class="noItems">
						<li><span class="txt_title">작성한 리뷰가 없습니다.</span></li>
					</ul>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach var="review" items="${list }">
						<tr><td>${review.rvno }</td>
							<td>${review.cname }</td>
							<td>${review.nickname }</td>
							<td>${review.star_rate }</td>
							<td>${review.rv_content }</td>
							<td>${review.rv_date }</td>
							<td><a href="/moma/views/admin/adReviewDelete.do?rvno=${review.rvno}" class="rv_btn">삭제</a></td>
					</c:forEach>
				</c:if>
			</table>
			</div>
		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='adReview.do?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../img/icon/left (1).png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='adReview.do?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../img/icon/left.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='adReview.do?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='adReview.do?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../img/icon/right (1).png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='adReview.do?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../img/icon/right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->	
	</div>
</body>
</html>