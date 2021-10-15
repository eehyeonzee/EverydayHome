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
	<c:if test="${empty houseBoard.house_num}">
		등록된 글이 없습니다.
	</c:if>
</div>
<!-- 중앙 내용 끝 -->