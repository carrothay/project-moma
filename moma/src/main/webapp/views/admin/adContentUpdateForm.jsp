<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/moma/css/admin/adContentForm.css");</style>
<script type="text/javascript">
	$(function(){	
		//Genre tag active : Genre tag
		$('input[name="genre"]').on('change', function() {
			if ($(this).is(":checked")) {
				$(this).siblings("label").addClass('active');
			} else {
				$(this).siblings("label").removeClass('active');
			}
		});
	});
	
	/* 개봉연도 유효성 검사 */
	function adChk(){
		var getYear = RegExp(/^[0-9]{4}$/);
		if(!getYear.test($("#startdate").val())){
			$('#err_start_date').html("연도를 4자리 숫자로 입력하세요(예: 2022)");
			$("#startdate").focus();
			return false;
		} else {
			$('#err_start_date').html("");	
		}
	};
		
	/* 포스터 미리보기 */
	function setPoster(event) {
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("width",200);
			img.setAttribute("height",300);
			
			$('#image_container img').remove();
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	};
		function genreChk(){
			var chk = false;
			for(var i=0; i<frm.genre.length; i++){
				if (frm.genre[i].checked){
					chk = true;
					break;
				}
			}
			if (!chk){
				alert("장르를 선택해주세요");
				return false;
			}
		} 
</script>
</head>
<body>
<div class="container_middle">
	<div class="title">컨텐츠 수정</div>
	<form action="adContentUpdateAction.so?cno=${ct.cno }" method="post" onsubmit="return genreChk()" name="frm" enctype="multipart/form-data">
	
		<!-- 포스터 -->
		<div class="poster">
			<div id="image_container">
				<img alt="포스터" src="/moma/img/poster/${ct.poster }">
			</div>
			<label for="f1" class="poster_file">포스터 사진 업로드</label>
			<input type="file" id="f1" name="file"  onchange="setPoster(event)" value="${ct.poster }">
		</div>
		
		<!-- 제목 -->
		<div class="adCheck">
			<div class="option_title">컨텐츠 제목 *</div>
			<input type="text" name="cname" value="${ct.cname }" required="required" autofocus="autofocus">
		</div>

		<!-- 분류 -->
		<div class="adCheck">
			<div class="option_title">분류 선택 *</div>
				<div class="option_box">
				<div class="sol"><input class="magic-radio" type="radio" name="sort" value="m" <c:if test="${ct.sort=='m' }">checked="checked"</c:if> id="s1"><label for="s1">영화</label></div>
				<div class="sol"><input class="magic-radio" type="radio" name="sort" value="d" <c:if test="${ct.sort=='d' }">checked="checked</c:if> id="s2"><label for="s2">드라마</label></div>
				</div>
				<div class="option_box_reserve">
				<div class="sol"><input class="magic-radio" type="radio" name="reserve"  value="Y"  id="c1" ><label for="c1">예매가능</label></div>
				<div class="sol"><input class="magic-radio" type="radio" name="reserve"  value="N" id="c2" checked="checked"><label for="c2">예매불가</label></div>
				</div>
		</div>
		
		<!-- 연령등급 -->
		<div class="adCheck">
			<div class="option_title">연령 등급 선택 *</div>
				<div class="sol"><input class="magic-radio" type="radio" name="clevel" value="7" <c:if test="${ct.clevel == '7' }">checked="checked"</c:if>  id="l1"><label for="l1">7세 이상</label></div>
				<div class="sol"><input class="magic-radio" type="radio" name="clevel" value="12" <c:if test="${ct.clevel == '12' }">checked="checked"</c:if>  id="l2"><label for="l2">12세 이상</label></div>
				<div class="sol"><input class="magic-radio" type="radio" name="clevel" value="15" <c:if test="${ct.clevel == '15' }">checked="checked"</c:if>  id="l3"><label for="l3">15세 이상</label></div>
				<div class="sol"><input class="magic-radio" type="radio" name="clevel" value="18" <c:if test="${ct.clevel == '18' }">checked="checked"</c:if>  id="l4"><label for="l4">18세 이상</label></div>	
		</div>
			
		<!-- 장르 -->
		<div class="adCheck">
			<div class="option_title">장르 선택 *</div>
			<div class="genre_box">
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t1" value="로맨스">
					<label class="genre" for="t1">로맨스</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t2" value="SF">
					<label class="genre" for="t2">SF</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t3" value="범죄">
					<label class="genre" for="t3">범죄</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t4" value="공포">
					<label class="genre" for="t4">공포</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t5" value="코미디">
					<label class="genre" for="t5">코미디</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t6" value="스릴러">
					<label class="genre" for="t6">스릴러</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t7" value="액션">
					<label class="genre" for="t7">액션</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t8" value="드라마">
					<label class="genre" for="t8">드라마</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t9" value="판타지">
					<label class="genre" for="t9">판타지</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t10" value="다큐멘터리">
					<label class="genre" for="t10">다큐멘터리</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t11" value="사회이슈">
					<label class="genre" for="t11">사회이슈</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t12" value="애니메이션">
					<label class="genre" for="t12">애니메이션</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t13" value="호러">
					<label class="genre" for="t13">호러</label>
				</div>
				<div class="label_box">
					<input type="checkbox" class="genre"  name="genre" id="t14" value="미스터리">
					<label class="genre" for="t14">미스터리</label>
				</div>
			</div>
		</div>
		
		<!-- 상영시간, 회차수 -->
		<div class="adCheck">
			<div class="option_title">상영시간 · 회차 수 *</div>
			<input type="text" name="hours" value="${ct.hours }" required="required">
		</div>	
		
		<!-- 개봉, 방영년도 -->
		<div class="adCheck">
			<div class="option_title">개봉 · 방영 년도 *</div>
			<input type="text" id="startdate" name="start_date" value="${ct.start_date }" required="required" onchange="adChk()">
			<div class="adChk" id="err_start_date"></div>
		</div>
		
		<!-- OTT URL -->
		<div class="adCheck">
			<div class="option_title">제공 OTT URL 정보 </div>
				<div class="url"><img alt="넷플릭스" src="../../img/icon/netflix.png" height="30px" width="30px">&nbsp; 넷플릭스<input type="url" class="url" name="netflix" value="${ct.netflix }"></div>
				<div class="url"><img alt="왓챠" src="../../img/icon/watcha.png" height="30px"  width="30px">&nbsp; 왓챠 <input type="url" class="url" name="watcha" value="${ct.watcha }"></div>
				<div class="url"><img alt="티빙" src="../../img/icon/tving.png" height="30px"  width="30px">&nbsp; 티빙 <input type="url" class="url" name="tving" value="${ct.tving }"></div>
		</div>
		
		<!-- 감독명, 배우명 입력 -->
		<div class="adCheck">
			<div class="option_title">감독명 *</div>
				<input type="text" name="director" value="${ct.director }" required="required">
			<div class="option_title">배우명 *</div>
				<input type="text" name="actor" value="${ct.actor }"  required="required">			
		</div>
		
		<div class="adSubmit">
			<input type="submit" class="btn" value="등록하기">
			<input type="button" class="btn btn_stroke reset" onclick="history.go(-1)" value="취소">
		</div>
	</form>
</div>
</body>
</html>