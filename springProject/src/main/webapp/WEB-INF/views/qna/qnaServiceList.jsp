<%@page import="org.hibernate.validator.constraints.Length"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 
 * 작성일 : 2021. 10. 15.
 * 작성자 : 나윤경
 * 설명 : 
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

</head>
<body>
<div class="page-main">
   <h2>게시판 목록</h2>
   
   <div class="align-right">
      <input type="button" value="글 등록" onclick="location.href='qnaInsert.do'">
   </div>
   <c:if test="${count==0 }">
   <div class="result-display">출력할 내용이 없습니다.</div>
   </c:if>
   <c:if test="${count > 0 }">
   <table>
   		<tr>
   			<th>질문번호</th>
   			<th>분류</th>
   			<th>질문내용</th>
   			<th>답변내용</th>
   			<th>수정</th>
   			<th>삭제</th>
   		</tr>
   		<c:forEach var="qna" items="${list }">
   		<tr>
   			<td>${qna.qna_num}</td>
   			<td>${qna.qna_category}</td>
   			<td>${qna.qna_content}</td>
   			<td>${qna.qna_reply}</td>
   			<td><input type="button" value="수정" onclick="location.href='qnaUpdate.do?num=${qna.qna_num}'"></td>
   			<td><input type="button" value="삭제" onclick="location.href='qnaDelete.do?num=${qna.qna_num}'"></td>
   		</tr>
   		</c:forEach>
   </table>
	</c:if>
   	<div class="align-center">${pagingHtml}</div>
	<div class="align-center">
		<input type="button" value="홈으로" onclick="location.href='qnaList.do'">
	</div>
</div>
</body>
</html>