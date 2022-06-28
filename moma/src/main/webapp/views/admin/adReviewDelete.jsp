<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("리뷰 삭제 완료되었습니다");
			location.href="/moma/views/admin/adReview.do";
		</script>
	</c:if>
	
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("리뷰 삭제 실패하였습니다 다시 시도해 주세요");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>