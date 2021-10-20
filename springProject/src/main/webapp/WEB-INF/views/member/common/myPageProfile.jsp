<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
 * 작성일 : 2021. 10. 18.
 * 작성자 : 오상준
 * 설명 : 마이페이지 프로필 사진
 * 수정일 : 
--%>
<div class ="page-main">
	<h2>프로필 사진</h2>
	<div class="mypage-info-main" align="center">
	<ul>
		<li>
			<c:if test="${empty user_photo }">
			<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="100" height="100" class="my-photo">
			</c:if>
			<c:if test="${!empty user_photo }">
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
				<input class = "btn btn-outline-dark" type="button" value="수정" id="modify_btn" onclick="location.href='memberUpdate.do'">
			</div>
		<hr>
		<c:if test="${!empty user_num && (user_auth == 2 ||  user_auth == 3)}">
		<div class="mypage-info">
			<table  style="border:1px dashed #b5b7ba;">
				<tr>
					<th style="border:1px dashed white;"><div  style="cursor: pointer; width: 45px; height: 45px;" align="center" onclick="location.href='myScrapBook.do'">
																	<img class="profile_btn" style="margin-top: 1em; margin-bottom: 2px; width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/images/bookmark.svg">
																			<p>스크랩북
																			<p style="margin-bottom: 2em;">${member.scrapbook_count}
																			</div></th>
					<th style="border:1px dashed white;"><div  style="cursor: pointer; width: 45px; height: 45px;" align="center" onclick="location.href='myRecomm.do'">
																	<img class="profile_btn" style="margin-top: 1em; margin-bottom: 2px; width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/images/heart.svg">
																			<p>좋아요
																			<p style="margin-bottom: 2em;">${member.recommend_count}
																			</div></th>
					<th style="border:1px dashed white;"><div  style="cursor: pointer; width: 45px; height: 45px;" align="center" onclick="location.href='#'">
																	<img class="profile_btn" style="margin-top: 1em; margin-bottom: 2px; width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/images/coupon.png">
																			<p>내 쿠폰
																			<p style="margin-bottom: 2em;">${member.coupon_count}</div></th>
				</tr>
			</table>
		</div>
		</c:if>
	</div>