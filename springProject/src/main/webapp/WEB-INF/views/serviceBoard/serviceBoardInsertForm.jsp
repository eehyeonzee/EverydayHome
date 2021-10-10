<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 10. 9.
 * 작성자 : 나윤경
 * 설명 : 
 * 수정일 : 
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<label for="service_num">글 번호</label>
				<form:input path="service_num"/>
				<form:errors path="service_num" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_num">회원번호</label>
				<form:input path="mem_num"/>
				<form:errors path="mem_num" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_title">제목</label>
				<form:input path="service_title"/>
				<form:errors path="service_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_context">내용</label>
				<form:textarea path="service_context"/>
				<form:errors path="service_context" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_email">이메일</label>
				<form:input path="service_email"/>
				<form:errors path="service_email" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_keyword">유형</label>
				<form:input path="service_keyword"/>
				<form:errors path="service_keyword" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_file">파일</label>
				<form:input path="service_file"/>
				<form:errors path="service_file" cssClass="error-color"/>
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