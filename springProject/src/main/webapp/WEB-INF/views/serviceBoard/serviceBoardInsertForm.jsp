<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- 
 * 작성일 : 2021. 10. 9.
 * 작성자 : 나윤경
 * 설명 : 
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 글 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>글쓰기</h2>
	<form:form action="serviceBoardInsert.do" modelAttribute="serviceBoardVO">
		<ul>
			<li>
				<label for="service_title">제목</label>
				<form:input path="service_title"/>
				<form:errors path="service_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_content">내용</label>
				<form:textarea path="service_content"/>
				<form:errors path="service_content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="홈으로" onclick="location.href='serviceBoardList.do'">
		</div>
		</form:form>
</div>
</body>
</html>