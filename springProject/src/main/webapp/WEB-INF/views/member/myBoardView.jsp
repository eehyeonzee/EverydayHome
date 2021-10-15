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
<!-- 중앙 내용 시작 -->
<div class ="page-main">
	<h2>프로필 사진</h2>
	<div class="mypage-info-main" align="center">
	<ul>
		<li>
			<c:if test="${empty member.profile_filename }">
			<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="100" height="100" class="my-photo">
			</c:if>
			<c:if test="${!empty member.profile_filename }">
			<img src="${pageContext.request.contextPath }/member/photoView.do" width="100" height="100" class="my-photo">
			</c:if>
		</li>
		<li>
			
		</li>
	</ul>
	
		<h3>닉네임 : ${member.nickname}</h3><br>
		팔로우 : ${member.follow_count} | 팔로워 : ${member.follower_count}
		<br><br> 
		<div class="align-center">
				<input type="button" value="설정" id="modify_btn" onclick="location.href='memberUpdate.do'">
			</div>
		<hr>
		<div class="mypage-info">
			<table  style="border:1px dashed #b5b7ba;">
				<tr>
					<th style="border:1px dashed white;"><div class="profile_btn" style="cursor: pointer;" align="center" onclick="location.href='#'">
																	<img style="margin-top: 1em; margin-bottom: 2px; width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/images/bookmark.svg">
																			<p>스크랩북
																			<p style="margin-bottom: 2em;">${member.scrapbook_count}
																			</div></th>
					<th style="border:1px dashed white;"><div class="profile_btn" style="cursor: pointer;" align="center" onclick="location.href='#'">
																	<img style="margin-top: 1em; margin-bottom: 2px; width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/images/heart.svg">
																			<p>좋아요
																			<p style="margin-bottom: 2em;">${member.recommend_count}
																			</div></th>
					<th style="border:1px dashed white;"><div class="profile_btn" style="cursor: pointer;" align="center" onclick="location.href='#'">
																	<img style="margin-top: 1em; margin-bottom: 2px; width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/images/coupon.png">
																			<p>내 쿠폰
																			<p style="margin-bottom: 2em;">${member.coupon_count}</div></th>
				</tr>
			</table>
		</div>
	</div>
	<div class="mypage-main-content" align="center">
		<div class="mypage-photo-write-divi">
		<div align="left">사진 ${member.house_board_count}</div>
		<table style="border:1px dashed #b5b7ba;">
			<tr>
			<td style="border:1px dashed #b5b7ba;" class="mypage-photo-write" align="center" onclick="location.href='${pageContext.request.contextPath}/houseBoard/write.do'">
				<span style="font-size: 25px;">+</span>
				<span style="font-size: 14px;">사진을 올려보세요</span>
			</td>			
			</tr>
		</table>	
		<br><br>
		<div align="left">문의하기</div>
		<table style="border:1px dashed #b5b7ba;">
			<tr style="border-style: dotted;">
			<td style="border:1px dashed #b5b7ba;" class="mypage-photo-write" align="center" onclick="location.href='${pageContext.request.contextPath}/serviceBoard/serviceBoardList.do'">
				<span style="font-size: 25px;">+</span>
				<span style="font-size: 14px;">질문을 올려보세요</span>
			</td>			
			</tr>
		</table>
		</div>
	</div>
</div>
<!-- 중앙 내용 끝 -->