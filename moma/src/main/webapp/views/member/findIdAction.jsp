<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/moma/css/member/join.css");</style>
</head><body>

<div class="container">
	<div class="join">
	
		<!-- 엔터키 전송 막기 -->
			<div style="display:none">
				<input type="submit" onclick="return false"/>
				<input type="text"/>
			</div>
	
		<h2 class="title">아이디 찾기 결과</h2>
			<c:if test="${member != null }">
				<div class= findresult>
				아이디는 ${member.id } 입니다.
				</div>
			</c:if>
			<c:if test="${member == null }">
				<div class= findresult>
				존재하지 않는 회원정보입니다.
				</div>
			</c:if>
		<a class="btn1" href="loginForm.bb">로그인</a>
		<a class="btn2" href="#" onClick="history.back()">아이디 찾기</a>
		<a class="btn2" href="findFormPw.bb">비밀번호 찾기</a>
	</div>
</div>

</body>
</html>