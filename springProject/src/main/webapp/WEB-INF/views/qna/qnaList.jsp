<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 11.
 * 작성자 : 나윤경
 * 설명 : 
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Qna 자주 묻는 질문 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
    <script>
		$(function() {
			
			function toggle(){
	        	$("#btn1").on("click", function() {
	            	$("#divBox1").slideToggle();
				});
			}
      	});
    </script>
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
   
   <c:forEach items="${list }" var="qna" varStatus="status">
   
   <%-- <c:forEach var="qna" items="${list }"> --%>
   <div class="slide">
   		<button id="btn1" onclick="toggle();">${qna.qna_content }</button>
   		<div id="divBox1"><p>${qna.qna_reply }</p></div>
  </div>
   </c:forEach>
	
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
   			<td><a href="qnaUpdate.do?num=${qna.qna_num}">${qna.qna_content}</a></td>
   			<td>${qna.qna_reply}</td>
   			<td><input type="button" value="수정" onclick="location.href='qnaUpdate.do?num=${qna.qna_num}'"></td>
   			<td><input type="button" value="삭제" onclick="location.href='qnaDelete.do?num=${qna.qna_num}'"></td>
   		</tr>
   		</c:forEach>
   </table>
	</c:if>
   <div class="align-center">${pagingHtml}</div>
</div>
</body>
</html>