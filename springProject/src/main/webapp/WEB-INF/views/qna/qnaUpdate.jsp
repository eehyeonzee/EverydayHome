<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 10. 12.
 * 작성자 : 나윤경
 * 설명 : QnA 자주묻는 질문 수정
 * 수정일 : 
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna 자주묻는 질문 글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>글수정</h2>
	<form:form action="qnaUpdate.do" modelAttribute="qnaVO">
		<form:hidden path="qna_num"/>
		<ul>
			<li>
				<label for="qna_category">분류</label>
				<form:input path="qna_category"/>
				<form:errors path="qna_category" cssClass="error-color"/>
			</li>
			<li>
				<label for="qna_content">질문내용</label>
				<form:textarea path="qna_content"/>
				<form:errors path="qna_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="qna_reply">답변내용</label>
				<form:textarea path="qna_reply"/>
				<form:errors path="qna_reply" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="홈으로" onclick="location.href='qnaList.do'">
		</div>
	</form:form>
</div>
</body>
</html>