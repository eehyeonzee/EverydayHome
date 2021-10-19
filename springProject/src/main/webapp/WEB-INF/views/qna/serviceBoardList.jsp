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
    <form id="search_form" action="serviceBoardList.do" method="get">
   		<ul class="search">
			<li>
				<select name="keyword" id="keyword">
					<option value="">전체</option>
					<option value="회원 정보 문의">회원 정보 문의</option>
					<option value="쿠폰/포인트 문의">쿠폰/포인트 문의</option>
					<option value="주문/결제 관련 문의">주문/결제 관련 문의</option>
					<option value="취소/환불 관련 문의">취소/환불 관련 문의</option>
					<option value="배송 관련 문의">배송 관련 문의</option>
					<option value="주문 전 상품 정보 문의">주문 전 상품 정보 문의</option>
					<option value="서비스 개선 제안">서비스 개선 제안</option>
					<option value="시스템 오류 제보">시스템 오류 제보</option>
					<option value="불편 신고">불편 신고</option>
					<option value="기타 문의">기타 문의</option>
				</select>
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록" onclick="location.href='serviceBoardList.do'">
			</li>
		</ul>
   </form> 
   
     <c:if test="${count==0 }">
   <div class="result-display">출력할 내용이 없습니다.</div>
   </c:if>
   <c:if test="${count > 0 }">
   <table>
   		<tr>
   			<th>문의번호</th>
   			<th>키워드</th>
   			<th>닉네임</th>
   			<th>제목</th>
   			<th>내용</th>
   			<th>이메일</th>
   		</tr>
   		<c:forEach var="serviceboard" items="${list }">
   		<tr>
   			<td>${serviceboard.service_num}</td>
   			<td>${serviceboard.service_keyword}</td>
   			<td>${serviceboard.service_nickname}</td>
   			<td><a href="${pageContext.request.contextPath}/qna/serviceBoardDetail.do?service_num=${serviceboard.service_num}">${serviceboard.service_title}</a></td>
   			<td>${serviceboard.service_content}</td>
   			<td>${serviceboard.service_email}</td>
   		</tr>
   		</c:forEach>
   </table>
   		
   <div class="align-center">${pagingHtml}</div>
   <div class="align-center">
		<input type="button" value="홈으로" onclick="location.href='qnaList.do'">
	</div>
   </c:if>
</div>
</body>
</html>