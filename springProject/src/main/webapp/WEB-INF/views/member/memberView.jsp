<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 10.
 * 작성자 : 오상준
 * 설명 : 마이페이지
 * 수정일 : 
--%>
<!-- 중앙 내용 시작 -->
<div class ="page-main">
	<h2>프로필 사진</h2>
	<ul>
		<li>
			<c:if test="${empty member.photo_name }">
			<img src="${pageContext.request.contextPath }/resources/images/blank.jpg" width="100" height="100" class="my-photo">
			</c:if>
			<c:if test="${!empty member.photo_name }">
			<img src="${pageContext.request.contextPath }/member/photoView.do" width="100" height="100" class="my-photo">
			</c:if>
		</li>
		<li>
			<div class="align-center">
				<input type="button" value="수정" id="photo_btn">
			</div>
			<div id="photo_choice" style="diplay:none;">
				<input type="file" id="upload" accept = "image/gif, image/png, image/jpeg">
				<input type="button" value="전송" id="photo_submit">
				<input type="button" value="취소" id="photo_reset">
			</div>
		</li>
	</ul>
</div>
<!-- 중앙 내용 끝 -->