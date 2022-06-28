<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
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
					<li><span class="txt_title">좋아요 한 컨텐츠가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<h3>좋아요 한 컨텐츠</h3>
				<ul class="likeslist">
					<c:forEach var="likes" items="${list}">
						<li id="likeslist">
							<a href="/moma/views/content/contentView.do?cno=${likes.cno}" class="cursor">
								<img src ="/moma/img/poster/${likes.cno}.jpg" style =" no-repeat center; background-size: cover;">
								<div class="txt_likes">${likes.cname }</div>
							</a>
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
						<button class="first" onclick="location.href='myLikesList.bb?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../img/icon/left (1).png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myLikesList.bb?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../img/icon/left.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myLikesList.bb?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myLikesList.bb?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../img/icon/right (1).png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myLikesList.bb?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../img/icon/right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
	
</body>
</html>