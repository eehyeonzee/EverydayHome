<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2>${vo.service_title }</h2>
	<p>
		글번호: ${vo.service_num }<br>
		작성자 이메일: ${vo.service_email }<br>
		문의 유형: ${vo.service_keyword }<br>
		제목: ${vo.service_title }<br>
	</p>
	<hr width="100%" size="1" noshade="noshade">
	<p>
		문의내용: ${vo.service_content }<br>
		파일: ${vo.service_file }<br>
	</p>
	<div class="align-center">
		<input type="button" value="수정" onclick="location.href='serviceBoardUpdateForm.do?num=${vo.service_num}'">
		<input type="button" value="삭제" onclick="location.href='serviceBoardDeleteForm.do?num=${vo.service_num}'">
		<input type="button" value="목록" onclick="location.href='serviceBoardList.do'">
	</div>
</div>
</body>
</html>