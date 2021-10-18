<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 18.
 * 작성자 : 오상준
 * 설명 : 전체회원조회
 * 수정일 : 
--%>
<c:if test="${!empty user_num && user_auth == 4}">
	전체회원조회
</c:if>
<c:if test="${empty user_num || user_auth != 4}">
	<h1>관리자만 접근할 수 있습니다.</h1>
	<script type="text/javascript">
	$(function(){
		alert("관리자만 접근할 수 있습니다.");
		location.href="${pageContext.request.contextPath}/main/main.do";
	});
	</script>
</c:if>
