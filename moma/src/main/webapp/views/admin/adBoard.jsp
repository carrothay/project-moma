<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value='${sessionScope.id}'/>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
<style type="text/css">@import url("/moma/css/admin/adBoard.css");</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function del(delBno) {
		var con = confirm("삭제 하시겠습니까?");
		if(con) {
			location.href="/moma/views/board/boardDelete.ha?bno="+delBno;
		}
	}
	
	function up(upBno) {
		var con = confirm("수정 하시겠습니까?");
		if(con) {
			location.href="/moma/views/board/boardUpdateForm.ha?bno="+upBno;
		}
	}
	
	$(document).ready(function() {
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
</script></head><body>

	<div class="ad_container_middle">
	<!-- adMainMenu -->
	<jsp:include page="adMainMenu.jsp"></jsp:include>
	</div>
	<div class="ad_container_wide">
	<div class="content">	
	<div class="ad_title">저널 목록</div>
	<table class="board_table">
		<tr><th>저널 번호</th><th width="180px">제목</th><th>조회수</th><th>삭제 여부</th><th>수정</th><th>삭제</th></tr>
		<c:if test="${empty list}">
			<ul class="noItems">
				<li><span class="txt_title">작성한 저널이 없습니다.</span></li>
			</ul>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="board" items="${list }">
				<tr><td>${board.bno }</td>
					<td><a href="/moma/views/board/boardView.ha?bno=${board.bno}" style="cursor:pointer">${board.bname }</a></td>
					<td>${board.bviews }</td>
					<td>${board.del }</td>
					<td><a onclick="up(${board.bno})" class="bd_btn" style="cursor:pointer">수정</a></td>
					<td><a onclick="del(${board.bno})" class="bd_btn" style="cursor:pointer">삭제</a></td>
			</c:forEach>
		</c:if>
	</table>
	</div>
	<div class="adbtn_box">
		<button class="adbtn" onclick="location.href='/moma/views/board/boardWriteForm.ha?action=insert'">저널 등록</button>
		<button class="adbtn" onclick="location.href='/moma/views/admin/adBoardCmt.ha'">저널 댓글 관리</button>
	</div>
	<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='adBoard.bb?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../img/icon/left (1).png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='adBoard.bb?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../img/icon/left.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='adBoard.bb?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='adBoard.bb?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../img/icon/right (1).png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='adBoard.bb?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../img/icon/right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>