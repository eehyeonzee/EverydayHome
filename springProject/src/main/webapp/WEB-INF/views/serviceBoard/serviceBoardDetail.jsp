<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 11.
 * 작성자 : 나윤경
 * 설명 : 고객센터 게시판 디테일
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 게시판 디테일</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>${serviceboard.service_title }</h2>
	<ul>
		<li>글번호: ${serviceboard.service_num }</li>
		<li>작성자 이메일: ${serviceboard.service_email }</li>
		<li>문의 유형: ${serviceboard.service_keyword }</li>
		<li>제목: ${serviceboard.service_title }</li>
	</ul>
	<hr width="100%" size="1" noshade="noshade">
	<p>
		문의내용: ${serviceboard.service_content }<br>
	</p>
	<hr size="1" width="100%">
	<c:if test="${!empty serviceboard.service_filename}">
	<div class="align-center">
		<img src="imageView.do?service_num=${serviceboard.service_num }" style="max-width:500px">
	</div>
	</c:if>
	<div class="align-center">
		<input type="button" value="목록" onclick="location.href='serviceBoardList.do'">
	</div>
</div>
</body>
</html>