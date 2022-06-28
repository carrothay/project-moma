<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/moma/css/member/join.css");</style>
</head><body>
	<div class="container">
		<div class="join">
		<form action="loginAction.bb?prevUrl=${prevUrl}" method="post">
			<h1 class="title">L O G I N</h1>
			<!-- input -->
			<div class="check_l">
			<input type="text" name="id" required="required"
				autofocus="autofocus" placeholder="아이디"> 
			</div>
			<div class="check_l">
			<input type="password" name="password" required="required" placeholder="비밀번호">
			</div>
		<div class="container_submit">
			<input type="submit" class="btn" value="로그인 하기">
		</div>
		</form>
		<a class="btn1" href="joinForm.bb">회원가입</a>
		<a class="btn2" href="findFormId.bb">아이디 찾기</a>
		<a class="btn2" href="findFormPw.bb">비밀번호 찾기</a>
	</div>
	</div>
</body>
</html>