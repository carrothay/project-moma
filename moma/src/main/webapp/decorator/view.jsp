<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOMA</title>
<link rel="stylesheet" type="text/css" href="/moma/css/fonts.css">
<link rel="stylesheet" type="text/css" href="/moma/css/reset.css">
<link rel="stylesheet" type="text/css" href="/moma/css/common.css">
<link rel="stylesheet" type="text/css" href="/moma/css/magic-check.css">
<script type="text/javascript" src="/moma/js/jquery.js"></script>
<deco:head></deco:head>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<deco:body></deco:body>   
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>