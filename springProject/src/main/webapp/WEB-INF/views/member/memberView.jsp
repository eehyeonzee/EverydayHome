<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 10.
 * 작성자 : 오상준
 * 설명 : 마이페이지
 * 수정일 : 
--%>
<style>
	.mypage-info-main{
	border: 2px solid; 
	width: 20%; 
	height: 45%;
	}
	div.mypage-info{
	border: 2px solid white; 
	width: 90%; 
	height: 90%;
	font-size: 10px;
	}
</style>
<!-- 중앙 내용 시작 -->
<div class ="page-main">
	<h2>프로필 사진</h2>
	<div class="mypage-info-main" align="center" ">
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
			<table>
				<tr>
					<th>스크랩북</th>
					<th>좋아요</th>
					<th>내 쿠폰</th>
				</tr>
				<tr>
					<td><a href="#">${ member.scrapbook_count }</a></td>
					<td><a href="#">${ member.recommend_count }</a></td>
					<td><a href="#">${member.coupon_count}</a></td>
				</tr>
			</table>
		</div>

	</div>
	<hr size="1" width="100%">
	<p class="align-right">
		<input type="button" value="회원정보수정" onclick="location.href='update.do'">
		<input type="button" value="비밀번호변경" onclick="location.href='changePassword.do'">
		<input type="button" value="회원탈퇴" onclick="location.href='delete.do'">
	</p>
</div>
<!-- 중앙 내용 끝 -->