<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html>
<c:set var="id" value='${sessionScope.id}'/>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content_myMain {
	margin-top:30%;
    width: 100%;
	display: table;
	text-align: center;
	font-size:  15px;
</style>
<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<%@ include file="../sessionChk.jsp"%>
</head><body>

		<div class="container_middle">
		<!-- adMainMenu -->
		<jsp:include page="adMainMenu.jsp"></jsp:include>
	<!-- 내용 -->
		<div class="content_myMain">
		<b> 관리자님 환영합니다.</b>
		</div>
	</div>
</body>
</html>
