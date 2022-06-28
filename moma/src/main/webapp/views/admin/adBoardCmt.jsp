<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="id" value='${sessionScope.id}' />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
<style type="text/css">
@import url("/moma/css/admin/adBoardCmt.css");
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function delComment(delBcno) {
		var con = confirm("삭제 하시겠습니까?");
		if(con) {
			location.href="/moma/views/board/adboardCmtDelete.ha?bcno="+delBcno;
		}
	}
	
	$(document).ready(function() {
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
</script>
</head>
<body>

	<div class="ad_container_middle">
	<!-- adMainMenu -->
	<jsp:include page="adMainMenu.jsp"></jsp:include>
	</div>
		<div class="ad_container_wide">
		<div class="content">
		<div class="ad_title">저널 댓글 목록</div>
			<table class="boardcmt_table">
					<tr>
						<th>댓글번호</th>
						<th>저널번호</th>
						<th>댓글내용</th>
						<th>닉네임</th>
						<th>삭제여부</th>
						<th>삭제</th>
					</tr>
					<c:if test="${empty list}">
						<ul class="noItems">
							<li><span class="txt_title">작성된 댓글이 없습니다.</span></li>
						</ul>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach var="boardcmt" items="${list}">
							<tr>
								<td>${boardcmt.bcno}</td>
								<td>${boardcmt.bno}</td>
								<td>${boardcmt.bc_content}</td>
								<td>${boardcmt.nickname}</td>
								<td>${boardcmt.del}</td>
								<td><a onclick="delComment(${boardcmt.bcno})" class="bd_btn"
									style="cursor: pointer">삭제</a></td>
						</c:forEach>
					</c:if>
			</table>
		</div>
			
				<!-- paging -->
				<div class="paging">
					<div class="items">
						<div class="prev_btn">
							<c:if test="${startPage > PAGE_PER_BLOCK}">
								<button class="first"
									onclick="location.href='adBoardCmt.ha?pageNum=${startPage - 1}'">
									<img alt="이전" src="../../img/icon/left (1).png">
								</button>
							</c:if>
							<c:if test="${pageNum > 1}">
								<button class="prev"
									onclick="location.href='adBoardCmt.ha?pageNum=${currentPage - 1}'">
									<img alt="이전" src="../../img/icon/left.png">
								</button>
							</c:if>
						</div>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<span id="page${i}" class="page_num"
								onclick="location.href='adBoardCmt.ha?pageNum=${i}'">${i}</span>
						</c:forEach>
						<div class="next_btn">
							<c:if test="${currentPage < totalPage}">
								<button class="next"
									onclick="location.href='adBoardCmt.ha?pageNum=${currentPage + 1}'">
									<img alt="다음" src="../../img/icon/right (1).png">
								</button>
							</c:if>
							<c:if test="${endPage < totalPage}">
								<button class=last
									onclick="location.href='adBoardCmt.ha?pageNum=${endPage + 1}'">
									<img alt="다음" src="../../img/icon/right.png">
								</button>
							</c:if>
						</div>
						<!-- next_btn -->
					</div>
					<!-- number -->
				</div>
				<!-- paging -->
		</div>
</body>
</html>