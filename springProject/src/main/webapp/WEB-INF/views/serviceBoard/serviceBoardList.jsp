<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 10.
 * 작성자 : 나윤경
 * 설명 : 
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
   <h2>게시판 목록</h2>
   <div class="align-right">
      <input type="button" value="글쓰기" onclick="location.href='serviceBoardInsert.do'">
   </div>
   <c:if test="${count==0 }">
   <div class="result-display">출력할 내용이 없습니다.</div>
   </c:if>
   <c:if test="${count > 0 }">
   <table>
   		<tr>
   			<th>문의번호</th>
   			<th>닉네임</th>
   			<th>제목</th>
   			<th>내용</th>
   			<th>이메일</th>
   			<th>키워드</th>
   		</tr>
   		<c:forEach var="serviceboard" items="${list }">
   		<tr>
   			<td>${serviceboard.service_num}</td>
   			<td>${serviceboard.service_nickname}</td>
   			<td><a href="serviceBoardDetail.do?service_num=${serviceboard.service_num}">${serviceboard.service_title}</a></td>
   			<td>${serviceboard.service_content}</td>
   			<td>${serviceboard.service_email}</td>
   			<td>${serviceboard.service_keyword}</td>
   		</tr>
   		</c:forEach>
   </table>
   <div class="align-center">${pagingHtml}</div>
   </c:if>
</div>
</body>
</html>