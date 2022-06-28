<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board/boardMain.css">
<c:set var="id" value='${sessionScope.id}'></c:set>
<script type="text/javascript">
// 페이지 로드 시 페이지넘 색상 세팅
$(document).ready(function() {
	$('#page'+${currentPage}).css({
		"color" : "var(--point-color)",
		"font-weight" : "700"
	});
});

//세션 확인
function sessionChk() {
	if (${empty id}) {
		var con = confirm("로그인 후 이용해 주시기 바랍니다.");
		if (con) {
			location.href = "/moma/views/board/boardWriteForm.ha?action=insert";
		}
	} else {
		location.href = "/moma/views/board/boardWriteForm.ha?action=insert";
	}
}
</script>
</head>
<body>
<main>
<div class="container_wide">

<h1 class="title">MOMA JOURNAL</h1>
<div class="txt">모마가 추천하는 작품 모음</div>


	<div class="board_grid">
		<c:if test="${empty list }">
			<div>게시글이 없습니다</div>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="board" items="${list }">
				<c:if test="${board.del == 'y' }">
					<div>삭제된 글입니다</div>
				</c:if>
				<c:if test="${board.del != 'y' }">
						<article class="board_listing">
							<a class="board_title" href="boardView.ha?bno=${board.bno }">${board.bname }</a>

							<div class="board_image">
								<a href="#"> <img alt="썸네일" width=100% height=100%
									src="../../upload/${board.image}"></a>
							</div>

							<%-- <div class="board_bviews">조회수:${board.bviews }</div> --%>
						</article>
				</c:if>
			</c:forEach>
		</c:if>
	</div>

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='boardMain.ha?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../img/icon/left.png">
							<img alt="이전" src="../../img/icon/left.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='boardMain.ha?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../img/icon/left.png">
						</button>
					</c:if>
				</div>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='boardMain.ha?pageNum=${i}'">${i}</span>
				</c:forEach>
				
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='boardMain.ha?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../img/icon/right (1).png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class="last" onclick="location.href='boardMain.ha?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../img/icon/right (1).png">
							<img alt="다음" src="../../img/icon/right (1).png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
</div>
</main>
</body>
</html>