<!-- 
Desc : 사용자(학생)의 마이페이지 강의 재생
작성자 : 고한별
작성일 : 2024.06.17
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의강의 - 강의재생</title>
<link rel="icon" href="/all_about_knowledge/favicon.png">
<link rel="stylesheet" type="text/css" href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
<style type = "text/css">
</style>
<script type = "text/javascript">
	$(function() {

	}); // ready
</script>
</head>
<body class="mypage">
<!-- 사이드 네비게이션 바 -->
<jsp:include page="mypage_side_nav.jsp"></jsp:include>

<!-- 탑 네비게이션 바 -->
<jsp:include page="mypage_top_nav.jsp"></jsp:include>

<!-- 컨텐츠 영역 -->
<article class="my_article">
<div class="mypage_content_div">

<!-- breadcrumb 표시 -->
	<div class="ui small breadcrumb div_margin">
	  <a class="section">나의강의실</a>
	  <i class="right chevron icon divider"></i>
	  <a class="section">나의강의</a>
	  <i class="right chevron icon divider"></i>
	  <div class="active section">강의재생</div>
	</div>
	<div class="ui segment center aligned">
	<video src="http://localhost/all_about_knowledge/front/student/video/sample.mp4" controls></video>
	</div>
</div>
</article>

</body>
</html>