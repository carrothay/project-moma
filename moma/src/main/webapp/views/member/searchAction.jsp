<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moma/css/searchAction.css">
</head>
<body>
<div class="container_wide">
	<div class="search_box">
		<form method="post" name="srch" action="searchAction.so">
			<input class="search" type="text" name="srch" placeholder="검색어를 입력해주세요">
			<button type="submit" style="border:none; background-color: transparent;"><img class="search" id="search" alt="검색" src="/moma/img/icon/search.png" width="30px"></img></button>
		</form>
	</div>
		<!-- content -->
		<div class="container_inner">
			<h1 class="title">컨텐츠</h1>
			<div class="content_list">
				<c:if test="${ctList.size() == 0}">
					<p class="search_text">검색 결과가 없습니다.<br>다른 검색어를 입력하시거나 철자와 띄어쓰기를 확인해보세요.</p>
				</c:if>
				<c:if test="${ctList.size() != 0}">
					<ul>
						<c:forEach var="content" items="${ctList}">
							<li>
								<a href="/moma/views/content/contentView.do?cno=${content.cno }">
									<img style="background: url(/moma/img/poster/${content.poster}) no-repeat center; background-size: cover;"/>
									<div class="ct_text_area">
										<p class="ct_list_title">${content.cname}</p>
									</div> <!-- text_area -->
								</a>
							</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div> <!-- container_inner -->
	</div> <!-- container_wide -->
	
	<!-- pre 태그 안에 있는 css 요소 삭제 -->
	<script type="text/javascript">
		$(".bd_text_content").find("*").css({
			"all" : "unset",
			"color" : "#000"
		})
	</script>
</body>
</html>