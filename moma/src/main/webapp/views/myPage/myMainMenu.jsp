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
		location.href = "/moma/views/myPage/" + id + ".bb";
	}
</script>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul>
		<!-- 메뉴 영역 -->
		<li class="category">
			<ul>
				<li id="myLikesList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../img/myPage_image/myLikes.png" >My Likes
					<%-- <span class="point-color">${bmTotal}</span> 좋아요총갯수 보여줄까말까~~ --%>
				</li>
				<li id="myReserveList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../img/myPage_image/reservation.png" >Reservation
				</li>
				<li id="myReviewList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../img/myPage_image/myReview.png" >My Reviews
				</li>
				<li id="../member/updateForm" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../img/myPage_image/myInfo.png" >My Info
				</li>
			</ul>
		</li>
	</ul>
</div>
