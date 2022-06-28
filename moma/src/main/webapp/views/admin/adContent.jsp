<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<style type="text/css">@import url("/moma/css/admin/adContent.css");</style>
<style>
</style>
<script type="text/javascript">
	$(function() {
		// 페이징 현재페이지 설정
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
	
	function chk(){
		if(!search.searchValue.value){
			alert("검색어를 입력하세요");
			search.searchValue.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div class="ad_container_middle">
		<jsp:include page="adMainMenu.jsp"></jsp:include> </div>
<div class="line"></div>
<section class="ad_container_wide">
		<div class="ad_title">컨텐츠 관리</div>
			<div class="top_box">
				<form class="searchForm" action="adFindContent.so" name="search" onsubmit="return chk()">
					<select name="searchKey" class="search_key">
						<option value="cname">컨텐츠명</option>
						<option value="genre">장르</option>
						<option value="director">감독</option>
						<option value="actor">배우</option>
					</select>
					<input type="text" name="searchValue" class="search_value" placeholder="검색어를 입력해주세요">
					<button type="submit" style="border:none; background-color: transparent;"><img class="search" id="search" alt="검색" src="/moma/img/icon/search.png" width="30px"></img></button>
				</form>
				<a class="adbtn" href="/moma/views/admin/adContentRegistForm.so">컨텐츠 등록</a>
			</div>
	<div class="container-table">	
		<table class="content_table">
			<tr class="table_th">
				<th>컨텐츠번호</th><th>컨텐츠명</th><th>구분</th><th>등급</th><th>장르</th>
				<th>상영시간·회차수</th><th>개봉·방영일</th><th>조회수</th><th>넷플</th>
				<th>왓챠</th><th>티빙</th><th>예매가능</th>
				<th>삭제여부</th><th>수정</th><th>삭제</th><th>삭제취소</th>
			</tr>
			<c:forEach var="adcontent" items="${list }">
				<tr>
					<td><a class="content_hover" href="../content/contentView.do?cno=${adcontent.cno}">${adcontent.cno }</a></td>
					<td><a class="content_hover" href="../content/contentView.do?cno=${adcontent.cno}">${adcontent.cname }</a></td>
					<td><c:if test="${adcontent.sort == 'd' }">드라마</c:if><c:if test="${adcontent.sort == 'm'}">영화</c:if></td>
					<td>${adcontent.clevel }</td>
					<td>${adcontent.genre }</td>
					<td>${adcontent.hours }</td>
					<td>${adcontent.start_date }</td>
					<td>${adcontent.cviews }</td>
					<td><c:if test="${adcontent.netflix != null }">Y</c:if></td>
					<td><c:if test="${adcontent.watcha != null }">Y</c:if></td>
					<td><c:if test="${adcontent.tving != null }">Y</c:if></td>					
					<td><c:if test="${adcontent.reserve =='Y' }"><font color="red"> ${adcontent.reserve }</font></c:if><c:if test="${adcontent.reserve =='N'}"> ${adcontent.reserve }</c:if></td>
					<td><c:if test="${adcontent.del !='n' }"><font color="red"> ${adcontent.del }</font></c:if><c:if test="${adcontent.del =='n'}"> ${adcontent.del }</c:if></td>
					<td><c:if test="${adcontent.del =='n' }"><a href="./adContentUpdateForm.so?cno=${adcontent.cno }" class="ct_btn">수정</a></c:if></td>
					<td><c:if test="${adcontent.del == 'n' }"><a href="./adContentDelete.so?cno=${adcontent.cno }" class="ct_btn">삭제</a></c:if></td>
					<td><c:if test="${adcontent.del != 'n' }"><a href="./adContentDelCancel.so?cno=${adcontent.cno }" class="ct_btn">삭제취소</a></c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- paging -->
	<div class="paging">
		<div class="items">
			<div class="prev_btn">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='adContent.so?pageNum=${startPage - 1}'">
						<img alt="이전" src="../../img/icon/left (1).png">
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='adContent.so?pageNum=${currentPage - 1}'">
						<img alt="이전" src="../../img/icon/left.png">
					</button>
				</c:if>
			</div>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<span id="page${i}" class="page_num" onclick="location.href='adContent.so?pageNum=${i}'">${i}</span>
			</c:forEach>
			<div class="next_btn">
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='adContent.so?pageNum=${currentPage + 1}'">
						<img alt="다음" src="../../img/icon/right (1).png">
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class=last onclick="location.href='adContent.so?pageNum=${endPage + 1}'">
						<img alt="다음" src="../../img/icon/right.png">
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->
</section>
</body>
</html>