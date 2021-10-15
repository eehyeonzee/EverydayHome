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
	
</style>
<!-- 중앙 내용 시작 -->
<div align="left" style="padding-left: 15em;">
<nav class="nav-right">
	<div class="nav-right-menu">
		<ul style=" display: inline-block; ">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/myPage.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">프로필</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">모두보기</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">사진</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">질문과답변</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">스크랩북</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">좋아요</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="nav-right-menu">
		<ul style="display: inline-block;">
			<li class="navrightmenuli"><a class="navmenuitem" href="#" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">나의쇼핑</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">주문배송내역조회</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">상품 스크랩북</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">상품 문의내역</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/memberUpdate.do">포인트</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardList.do">고객센터</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="nav-right-menu">
		<ul style="display: inline-block;">
			<li class="navrightmenuli"><a class="navmenuitem" href="#" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">나의리뷰</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">리뷰쓰기</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">내가 작성한 리뷰</a></li> 
				</ul>
			</li>
		</ul>
	</div>
	<div class="nav-right-menu">
		<ul style="display: inline-block;">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/memberUpdate.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">설정</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/memberUpdate.do">회원정보수정</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">비밀번호변경</a></li> 
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">추천코드</a></li> 
				</ul>
			</li>
		</ul>
	</div>
</nav>	
</div>	
	<br>
<div class ="page-main">
	<hr noshade="noshade" size="1">
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
	<div class="mypage-main-content" align="center">
		<div class="mypage-photo-write-divi">
		<div align="left">사진 1</div>
		<table style="border:1px dashed #b5b7ba;">
			<tr>
			<td style="border:1px dashed #b5b7ba;" class="mypage-photo-write" align="center" onclick="location.href='#'">
				<span style="font-size: 25px;">+</span>
				<span style="font-size: 14px;">사진을 올려보세요</span>
			</td>			
			</tr>
		</table>	
		<br><br>
		<div align="left">질문 1</div>
		<table style="border:1px dashed #b5b7ba;">
			<tr style="border-style: dotted;">
			<td style="border:1px dashed #b5b7ba;" class="mypage-photo-write" align="center" onclick="location.href='#'">
				<span style="font-size: 25px;">+</span>
				<span style="font-size: 14px;">질문을 올려보세요</span>
			</td>			
			</tr>
		</table>
		</div>
		
	</div>
</div>
<!-- 중앙 내용 끝 -->