<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
 * 작성일 : 2021. 10. 16.
 * 작성자 : 오상준
 * 설명 : 마이페이지 헤더 리스트
 * 수정일 : 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script type="text/javascript">
	$(function(){
		// 프로필 버튼
		$(".profile_btn").hover(function(){
			$(this).css("background-color", "#f0e9e9");
		}, function() {
		        $(this).css("background-color","white");
		});
	});
</script>
<%-- 회원 마이페이지 --%>
<c:if test="${!empty user_num && user_auth == 2}">
<div align="left" style="padding-left: 15em;  ">
<nav class="nav-right">
	<div class="nav-right-menu">
		<ul style=" display: inline-block; ">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/myPage.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">프로필</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">모두보기</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myBoard.do">사진</a></li>
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
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">포인트</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/qna/qnaList.do">고객센터</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="nav-right-menu">
		<ul style="display: inline-block;">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/review/myBuyList.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">나의리뷰</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/review/myBuyList.do">리뷰쓰기</a></li>						
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
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/memberPasswdUpdate.do">비밀번호변경</a></li> 
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/sellerApplication.do">판매자 신청</a></li> 
				</ul>
			</li>
		</ul>
	</div>
</nav>	
</div>	
	<br>
<hr noshade="noshade" size="1">
</c:if>
<%-- 판매자 마이페이지 --%>
<c:if test="${!empty user_num && user_auth == 3}">
<div align="left" style="padding-left: 15em;  ">
<nav class="nav-right">
	<div class="nav-right-menu">
		<ul style=" display: inline-block; ">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/myPage.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">프로필</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">모두보기</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myBoard.do">사진</a></li>
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
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">포인트</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/qna/qnaList.do">고객센터</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="nav-right-menu">
		<ul style="display: inline-block;">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/review/myBuyList.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">나의리뷰</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/review/myBuyList.do">리뷰쓰기</a></li>						
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
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/memberPasswdUpdate.do">비밀번호변경</a></li> 
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/sellerApplication.do">판매자 신청</a></li> 
				</ul>
			</li>
		</ul>
	</div>
</nav>	
</div>	
	<br>
<hr noshade="noshade" size="1">
</c:if>
<%-- 관리자 마이페이지 --%>
<c:if test="${!empty user_num && user_auth == 4}">
<div align="left" style="padding-left: 15em;  ">
<nav class="nav-right">
	<div class="nav-right-menu">
		<ul style=" display: inline-block; ">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/myPage.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">회원관리</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">내 정보</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/memberList.do">전체 회원 조회</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">판매자 신청내역 조회</a></li>
					
				</ul>
			</li>
		</ul>
	</div>
	<div class="nav-right-menu">
		<ul style="display: inline-block;">
			<li class="navrightmenuli"><a class="navmenuitem" href="#" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">커뮤니티 관리</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/houseBoard/list.do">사진게시판</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/event/eventList.do">이벤트</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/qna/qnaList.do">고객센터</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/qna/qnaServiceList.do">이메일 문의 내역조회</a></li>
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/qna/serviceBoardList.do">자주묻는 질문 내역조회</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="nav-right-menu">
		<ul style="display: inline-block;">
			<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/memberUpdate.do" style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">설정</a>
				<ul class="dropdownbar">
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/memberUpdate.do">회원정보수정</a></li>						
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/memberPasswdUpdate.do">비밀번호변경</a></li> 
					<li class="navrightitemdropdown" style=" font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/sellerApplication.do">판매자 신청</a></li> 
				</ul>
			</li>
		</ul>
	</div>
</nav>	
</div>	
	<br>
<hr noshade="noshade" size="1">
</c:if>
<c:if test="${!empty user_num && user_auth < 2}">
	<h1>정지회원 또는 탈퇴회원은 접근할 수 없습니다.</h1>
	<script type="text/javascript">
	$(function(){
		alert("정지회원 또는 탈퇴회원은 접근할 수 없습니다.");
		location.href="${pageContext.request.contextPath}/main/main.do";
	});
	</script>
</c:if>