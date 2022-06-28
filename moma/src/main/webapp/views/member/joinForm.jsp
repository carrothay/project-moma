<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/moma/css/member/join.css");</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	
	/* 아이디 중복체크 */
	function chkId(){
		$.post("confirmId.bb", "id="+frm.id.value, function(data){
			$('#err_id').html(data);
			frm.id.focus();
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
			$('#err_pass2').html("비밀번호가 일치하지 않습니다");
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
	
</script></head><body>

	<div class="container">
		<form action="joinAction.bb" method="post" name="frm" onsubmit="return chk()">
			
			<!-- 엔터키 전송 막기 -->
			<div style="display:none">
				<input type="submit" onclick="return false"/>
				<input type="text"/>
			</div>
			
			<h1 class="title">J O I N</h1>
			
			<div class="join">
			<!-- 아이디 -->
			<div class="check">
				<input type="text" class="check_mem" name="id" required="required"  autofocus="autofocus" placeholder="아이디" onchange="chkId()" > 
				<div class="chk-msg" id="err_id"></div>
			</div> 
			
			<!-- 비밀번호 -->
			<div class="check">
				<input type="password" name="password" id="password" placeholder="비밀번호(4자리 이상)" required="required" onChange="chkPass()"> 
				<div class="chk-msg" id="err_pass"></div>
			</div>
			<div class="check">
				<input type="password" name="password2" placeholder="비밀번호 확인" required="required" onChange="chkPass2()">
				<div class="chk-msg" id="err_pass2"></div>
			</div>
			
			<!-- 이메일 -->
			<div class="check">
				<input type="text" name="email" required="required" placeholder="이메일" onChange="chkEmail()">
				<div class="chk-msg" id="err_email"></div>
			</div>
			
			<!-- 이름 -->
			<div class="check">
				<input type="text" name="mname" required="required" placeholder="이름">
			</div>
			
			<!-- 별명 -->
			<div class="check">
				<input type="text" name="nickname" placeholder="별명" required="required" onchange="chkNickname()">
				<div class="chk-msg" id="err_nickname"></div>
			</div>
			
			<!-- 연락처 -->
			<div class="check">
				<input type="tel" name="phone" required="required" pattern="010-\d{4}-\d{4}" placeholder="연락처(010-****-****)" onchange="chkPhone()">
				<div class="chk-msg" id="err_phone"></div>
			</div>
			<p>
			
			<!-- 광고수신 -->
			<div class="checks">
				<li>sms 광고수신 &nbsp &nbsp &nbsp <label id="chk1"><input type="radio" id="chk1" name="sms_check" value="y" checked="checked">수신동의</label> <label id="chk1"><input type="radio" id="chk1" name="sms_check" value="n">수신거부</label><p></li>
				<li>email 광고수신 &nbsp &nbsp <label id="chk1"><input type="radio" id="chk1" name="email_check" value="y" checked="checked">수신동의</label> <label id="chk1"><input type="radio" id="chk1" name="email_check" value="n">수신거부</label><p></<li>
     		</div>
     		
     		<div class="container_submit2">
			<input type="submit" class="btn_small_j" value="가입하기"> <input type="reset" class="btn_small_j" value="다시쓰기">
			</div>
		</div>	
     	</form>
   	</div>
</body>
</html>