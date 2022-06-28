<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value='${sessionScope.id}'/>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/sessionChk.jsp"%>
<style type="text/css">@import url("/moma/css/admin/adMember.css");</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function del(delMno) {
		var con = confirm("탈퇴 처리 하시겠습니까?");
		if(con) {
			location.href="../member/delete.bb?mno="+delMno;
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
	<div class="ad_title">회원 목록</div>
	<table class="member_table">
		<tr><th>회원 번호</th><th>아이디</th><th>이름</th><th>이메일</th><th>별명</th><th>연락처</th><th>sms 광고</th><th>이메일 광고</th><th>가입일</th><th>탈퇴 여부</th><th>탈퇴</th></tr>
		<c:if test="${empty list}">
			<ul class="noItems">
				<li><span class="txt_title">가입한 회원이 없습니다.</span></li>
			</ul>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="member" items="${list }">
				<tr><td>${member.mno }</td>
					<td>${member.id }</td>
					<td>${member.mname }</td>
					<td>${member.email }</td>
					<td>${member.nickname }</td>
					<td>${member.phone }</td>
					<td>${member.sms_check }</td>
					<td>${member.email_check }</td>
					<td>${member.join_date }</td>
					<td>${member.del }</td>
					<td><a onclick="del(${member.mno})" class="mb_btn" style="cursor:pointer">탈퇴</a></td>
			</c:forEach>
		</c:if>
	</table>
	</div>
		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='adMember.bb?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../img/icon/left (1).png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='adMember.bb?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../img/icon/left.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='adMember.bb?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='adMember.bb?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../img/icon/right (1).png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='adMember.bb?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../img/icon/right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>