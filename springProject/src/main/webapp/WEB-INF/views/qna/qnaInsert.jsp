<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 11.
 * 작성자 : 나윤경
 * 설명 : Qna 자주묻는질문 글쓰기 폼
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 글쓰기 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>자주묻는질문 추가</h2>
	<hr size="1" noshade width="100%">
	<form:form action="qnaInsert.do" modelAttribute="qnaVO">
		<ul>
			<li>
				<label for="qna_category">카테고리</label>
				<select name="qna_category" id="qna_category">
					<option value="">카테고리</option>
					<option value="주문/결제">주문/결제</option>
					<option value="배송관련">배송관련</option>
					<option value="취소/환불">취소/환불</option>
					<option value="반품/교환">반품/교환</option>
					<option value="증빙서류발급">증빙서류발급</option>
					<option value="회원정보변경">회원정보변경</option>
					<option value="서비스/기타">서비스/기타</option>
				</select>
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
		<!-- 버튼 -->
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="홈으로" onclick="location.href='qnaList.do'">
		</div>
		</form:form>
		
</div>
</body>
</html>