<%@page import="org.hibernate.validator.constraints.Length"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 
 * 작성일 : 2021. 10. 11.
 * 작성자 : 나윤경
 * 설명 : 
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Qna 자주 묻는 질문 목록</title>
<script type="text/javascript">
 	$(function() {
 		var list_length = ${fn:length(list)};
 		for (var i = 0; i <= list_length; i++) {
 			$('.slideToggle'+i).click(function(){
		        $('p').slideToggle("slow");
		    });
 		};
	});
         
</script>
</head>
<body>

<div class="page-main">
   <h2>게시판 목록</h2>
   <div class="align-left">
   <c:if test="${member_auth != 3}">
      <input type="button" value="이메일 문의하기" onclick="location.href='serviceBoardInsert.do'">
   </c:if>
   </div>
   <br><br><br>
   <c:if test="${member_auth == 3 }"> 
	   	<input type="button" value="자주묻는 질문 list" onclick="location.href='qnaServiceList.do'">
   		<input type="button" value="이메일 문의 list" onclick="location.href='serviceBoardList.do'"><br><br>
	</c:if> 
   
   <c:if test="${count==0 }">
   <div class="result-display">출력할 내용이 없습니다.</div>
   </c:if>
   <c:if test="${count > 0 }">
     <%-- <c:forEach items="${list }" var="qna" varStatus="status"> --%>
   <c:forEach var="qna" items="${list}" varStatus="class_count">
   <button class="slideToggle${class_count.count}">${qna.qna_content }</button>
         <p>${qna.qna_reply }</p>
   </c:forEach>
   <%-- </c:forEach> --%>
	</c:if>
   <div class="align-center">${pagingHtml}</div>
</div>
</body>

</html>