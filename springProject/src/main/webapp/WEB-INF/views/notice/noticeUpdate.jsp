<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

    <div class="page-main">
	<h2>글쓰기</h2>
	<form:form action="noticeUpdate.do" modelAttribute="noticeVO">
		<form:hidden path="notice_num"/>
		<ul>
			<li>
				<label for="notice_title">제목</label>
				<form:input path="notice_title"/>
				<form:errors path="notice_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="notice_content">내용</label>
				<form:textarea path="notice_content"/>
				<form:errors path="notice_content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">
		</div>
	</form:form>
</div>