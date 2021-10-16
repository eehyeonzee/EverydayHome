<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 16.
 * 작성자 : 오상준
 * 설명 : 마이페이지 내가 쓴 글
 * 수정일 : 
--%>
<%@ include file="/WEB-INF/views/member/myPageHeader.jsp" %>
	<div class="mypage-main-content" align="center">
		<c:if test="${empty houseBoard.house_num}">
			등록된 글이 없습니다.
		</c:if>
		<c:if test="${!empty houseBoard.house_num}">
			<c:if test="${empty member.profile_filename }">
			<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="33" height="33" class="my-photo">
			</c:if>
			<c:if test="${!empty member.profile_filename }">
			<img src="${pageContext.request.contextPath }/member/photoView.do" width="33" height="33" class="my-photo">
			</c:if>
		</c:if>
	</div>
</div>
<!-- 중앙 내용 끝 --> 