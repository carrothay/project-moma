<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8"><title>Insert title here</title>
<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

/* 별명 중복체크 */
function chkNickname(){
	if(!frm.nickname.value) {
		$('#err_nickname').html("별명을 입력하세요");
		frm.nickname.focus();
		return false;
	}
	$.post("confirmNickname.bb", "nickname="+frm.nickname.value, function(data){
	$('#err_nickname').html(data);
	});
}

/* 비밀번호 형식 체크 (4글자이상) -> 영문섞어서로 바꿔보기? */
function chkPass(){
	var pw = $("#password").val();
	if(pw.length<4) {
		$('#err_pass').html("비밀번호를 4자리이상 입력해주세요");
		frm.password.focus();
		frm.password.value="";
		return false;
	} else {
		$('#err_pass').html("");
	}
}

/* 비밀번호 확인 일치여부 체크 */
function chkPass2() {
	if (!frm.password2.value){
		$('#err_pass2').html("비밀번호 확인란을 입력하세요");
		return false;
	} if(frm.password2.value!=frm.password.value){
		$('#err_pass2').html("비밀번호가 일치하지 않습니다");   /* .html("비밀번호가 일치하지 않습니다"); */
		frm.password2.focus();
		frm.password2.value="";
		return false;
	} else {
		$('#err_pass2').html("");
	}
}

/* 이메일 유효성 검사 */
function chkEmail(){
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!frm.email.value) {
		$('#err_email').html("이메일을 입력하세요");
		frm.email.focus();
		return false; 
	} if(!reg_email.test(frm.email.value)){
			$('#err_email').html("올바른 이메일 형식이 아닙니다");
			frm.email.focus();
			return false;
	}else{
		$('#err_email').html("");
	}
}

/* 연락처 유효성 검사 */
function chkPhone(){
	var reg_phone = /^([0-9]){3}[-]([0-9]){4}[-]([0-9]){4}$/;
	if(!frm.phone.value) {
		$('#err_phone').html("연락처를 입력하세요");
		frm.phone.focus();
		return false;
	} if(!reg_phone.test(frm.phone.value)){
		$('#err_phone').html("올바른 연락처 형식이 아닙니다");
		frm.phone.focus();
		return false;
	} else {
		$('#err_phone').html("");
	}
}

/* 회원탈퇴 */
function del() {
	var con = confirm("탈퇴 하시겠습니까?");
/* 	if(con) location.href="delete.bb";
	else alert("탈퇴가 취소 되었습니다."); */
	}

/* form 경로 2개 */
function submit2(frm) { 
	if(con) {
	frm.action='delete.bb';
    frm.submit(); 
    return true;
	} else { return false;}
  } 

</script></head><body>

	<div class="container_middle">
		<!-- myMainMenu -->
		<jsp:include page="/views/myPage/myMainMenu.jsp"></jsp:include>
	
		
		<div class="content_update">
		<p>
		<h3>내 정보 수정</h3>

	<div class="updateform">
	
		<form method="post" name="frm" onsubmit="return chk()">  <!-- action="updateAction.bb" -->
	
			<!-- 엔터키 전송 막기 -->
			<div style="display:none">
				<input type="submit" onclick="return false"/>
				<input type="text"/>
			</div>
	
			<table>
				<tr><th>아이디</th><td><input type="text" name="id" required="required" readonly="readonly" value="${member.id }"></td></tr> 
				<tr><td colspan="2"><a class="chk-msg2">* ID는 수정이 불가합니다.</a></td></tr>
				<tr><th>암호</th><td><input type="password" id = "password" name="password" placeholder="입력해주세요" required="required" onChange="chkPass()"></td></tr>
				<tr><th colspan="2"><a class="chk-msg1" id="err_pass"></a></th></tr>
				<tr><th>암호확인</th><td><input type="password" name="password2" placeholder="입력해주세요" required="required" onChange="chkPass2()"></td></tr>
				<tr><th colspan="2"><a class="chk-msg1" id="err_pass2"></a></th></tr>
				<tr><th>이름</th><td><input type="text" name="mname" required="required" value="${member.mname }"></td></tr>
				<tr><th>별명</th><td><input type="text" name="nickname" required="required" value="${member.nickname }" onChange="chkNickname()"></td></tr>
				<tr><th colspan="2"><a class="chk-msg1" id="err_nickname"></a></th></tr>
				<tr><th>이메일</th><td><input type="text" name="email" required="required" value="${member.email }" onChange="chkEmail()"></td></tr>
				<tr><th colspan="2"><a class="chk-msg1" id="err_email"></a></th></tr>
				<tr><th>연락처</th><td><input type="tel" name="phone" required="required" value="${member.phone }" onChange="chkPhone()"></td></tr>
				<tr><th colspan="2"><a class="chk-msg1" id="err_phone"></a></th></tr>
			</table>
			
			<!-- <div class="checks" >
				<li>sms 광고수신 &nbsp &nbsp &nbsp <label id="radio1"><input type="radio" name="sms_check" value="y" id="chk1" checked="checked">수신동의</label><label id="radio1"><input type="radio" id="chk1" name="sms_check" value="n" >수신거부</label></li>
				<li>email 광고수신 &nbsp &nbsp <label id="radio1"><input type="radio" name="email_check" value="y" id="chk1" checked="checked">수신동의</label><label id="radio1"><input type="radio" id="chk1" name="email_check" value="n" >수신거부</label></li>
    	 	</div> -->
			
			<div class="checks" >
				<li>sms 광고수신 &nbsp &nbsp &nbsp <label id="radio1"><input type="radio" name="sms_check" value="y" id="chk1" <c:if test="${member.sms_check eq 'y'}">checked="checked"</c:if>>수신동의</label><label id="radio1"><input type="radio" id="chk1" name="sms_check" value="n" <c:if test="${member.sms_check eq 'n'}">checked="checked"</c:if>>수신거부</label></li>
				<li>email 광고수신 &nbsp &nbsp <label id="radio1"><input type="radio" name="email_check" value="y" id="chk1" <c:if test="${member.email_check eq 'y'}">checked="checked"</c:if>>수신동의</label><label id="radio1"><input type="radio" id="chk1" name="email_check" value="n" <c:if test="${member.email_check eq 'n'}">checked="checked"</c:if>>수신거부</label></li>
    	 	</div>
			
			<!-- button -->
			<div class="container_submit2">
				<input type="submit" class="btn_small_up1" value="수정하기" onclick="javascript: form.action='updateAction.bb';"/>
				<input type="submit"class="btn_small_up2" value="탈퇴하기" onclick="javascript: form.action='delete.bb';"/>
			</div>
		</form>
	</div>
	</div>
</div>
</body>
</html>