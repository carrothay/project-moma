<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="../sessionChk.jsp" %>  --%>

<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<style>
.category>ul>li {
	float: left;
	width: 25%;
	font-size: 15px;
	font-weight: 600;
	text-align: center;
	cursor: pointer;
	position: relative;
}
</style>
<script type="text/javascript">
	function showCon(id) {
		location.href = "/moma/views/admin/" + id ;
	}
</script>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul>
		<!-- 메뉴 영역 -->
		<li class="category">
			<ul>
				<li id="adContent.so" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/icon/multimedia.png" >adContent
				</li>
				<li id="adReview.do" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/myPage_image/myReview.png" >adReview
				</li>
				<li id="adMember.bb" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/myPage_image/myInfo.png" >adMember
				</li>
				<li id="adBoard.bb" onclick="showCon(this.id)">
					<span class="dot"></span><img src="/moma/img/adPage_image/board.png" >adBoard
				</li>
			</ul>
		</li>
	</ul>
</div>
