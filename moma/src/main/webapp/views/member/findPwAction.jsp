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
		
		<h2 class="title">비밀번호 찾기 결과</h2>
		<c:if test="${result == 0 }">
			<div class= findresult>
			이메일을 정확하게 입력해주세요.
			</div>
		</c:if>
		<c:if test="${result > 0 }">
			<div class= findresult>
			비밀번호는 ${member.password } 입니다.
			</div>
		</c:if>
		<c:if test="${result < 0 }">
			<div class= findresult>
			존재하지 않는 회원입니다.
			</div>
		</c:if> 
		<a class="btn1" href="loginForm.bb">로그인</a>
		<a class="btn2" href="findFormId.bb">아이디 찾기</a>
		<a class="btn2" href="findFormPw.bb">비밀번호 찾기</a>
	</div>
</div>
</body>
</html>