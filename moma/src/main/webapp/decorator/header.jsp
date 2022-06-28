<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moma/css/common.css">
<script type="text/javascript">
	function sessionChk() {
		if (${empty id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			location.href = "/moma/views/member/loginForm.bb";
		} else {
			location.href = "/moma/views/myPage/myMain.bb";
		}
	}
</script>
</head>
<body>   
	<header>
		<div class='header_inner'>
			<div class='header_logo'>
				<a href="/moma/views/content/momaMain.so"><img src='/moma/img/momalogo.jpg'></a>
			</div>
		
			<nav>
				<ul class='nav_sub'>
					<c:if test="${empty id }">
						<li><a href="/moma/views/member/loginForm.bb">로그인</a></li>
						<li><a href="/moma/views/member/joinForm.bb">회원가입</a></li>
					</c:if>
					<c:if test="${not empty id }">
						<li><a href="/moma/views/member/logout.bb">로그아웃</a></li>
					</c:if>
				</ul>
				<ul class='nav_main'>
					<li><a href="/moma/views/content/movieMain.so" id="movie">영화</a></li>
					<li><a href="/moma/views/content/dramaMain.so" id="drama">드라마</a></li>
					<li><a href="/moma/views/board/boardMain.ha?pageNum=1" id="board">저널게시판</a></li>
					<c:if test="${id == 'admin'}">
						<li><a href="/moma/views/admin/adMain.bb">관리자페이지</a></li>
					</c:if>
					<c:if test="${id != 'admin' }">
						<li><a id="myPage" onclick="return sessionChk()">마이페이지</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>