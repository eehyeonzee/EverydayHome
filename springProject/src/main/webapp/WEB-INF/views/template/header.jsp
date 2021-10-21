<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
html, body, div, span, applet, object, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
a {
	text-decoration: none;
	color: black;
}
/* 컨테이너 속성 */
.navcontainer{
	display: flex;
	align-items:flex-start;
	postion:relative;
	box-sizing:border-box;
	max-width: 1256px;
	height:80px;
	padding:0px 80px;
	margin: 0 auto;
}
/* 메뉴중앙세팅 */
/*커뮤니티 스토어 버튼 설정 */
.navmenuitem{
	float:left;
	display:display-block;
	position:relative;
	font-weight:700;
	line-height:26px;
	font-size:18px;
	padding: 14px 6px;
	margin:6px 10px 0;
}
.nav-menu{
	display:block;
	width:300px;
	flex:0 0 auto;
}
/*드롭다운메뉴 설정 */
 .dropdownbar{
position: absolute; 
height: 0px; 
overflow: hidden;  
transition: height .2s; 
-webkit-transition: height .2s; 
-moz-transition: height .2s; 
-o-transition: height .2s;
width: 800px;       
margin-top:80px;
}
.dropdownbar li {
	display : inline-block;
}
.navmenuli:hover .dropdownbar{
height: 40px;
}
.navmenuitemdropdown{
	font-size : 15px;
	line-height : 23px;
	margin : 8px 4px;
	padding : 6px 8px 4px;
}

/*우측메뉴 통합검색부터 글쓰기까지*/
#search {
 margin : 7px 10px 0 ;
}
.nav-right{
		display:flex;
		justify-content:flex-end;
		align-items:center;
		position:static;
		width:720px;
		line-height:1;
		flex-grow:1;
		flex:0 0 auto;
}
.navrightitem{
	display:inline-block;
	position:relative;
	font-weight:700;
	line-height:20px;
	font-size:15px;
	padding:14px 6px;
	margin:7px 10px 0;
}
/*하단 줄*/
.navline{
	z-index:502;
	position:relative;
	transition: top .1s;
	border-bottom:1px solid #ededed;
}
/*드롭다운 위한 여백 */
.nav-dropdown {
	margin : 50px;
}
.navrightitemdropdown{
	font-size : 15px;
	line-height : 23px;
	margin : 8px 4px;
	padding : 6px 8px 4px;
	font-weight : bold;
}
.navrightmenuli:hover .dropdownbar{
height: 40px; 
}
</style>
<div class="topbar">
	<div class="navline">
		<div class="navcontainer">
			<div class="nav-left">
				<a class="logo" href="${pageContext.request.contextPath}/main/main.do" style="font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">매일의 집</a>
			</div>
			<!-- 기본매뉴 -->
			<nav class="nav-menu">
				<ul>
					<li class="navmenuli"><a class="navmenuitem" href="#" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">커뮤니티</a>
						<ul class="dropdownbar">
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">커뮤니티 메인</a></li>
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/houseBoard/list.do">사진게시판</a></li>
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/qna/qnaList.do">고객센터</a></li>
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/event/eventList.do">이벤트</a></li>
						</ul>
					</li>
					<li class="navmenuli"><a class="navmenuitem" style="font-family: 'Gowun Dodum', sans-serif; text-decoration: none;" href="${pageContext.request.contextPath}/store/storeMain.do">스토어</a>
						<ul class="dropdownbar">
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/store/storeMain.do">스토어홈</a></li>
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/store/storeCategory.do">카테고리</a></li>
							<li class="navmenuitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">베스트</a></li>
						</ul>
				</ul>
			</nav>
			<!-- 비회원 -->
			<c:if test="${empty user_num}">
				<nav class="nav-right">
				<form id="search" action="#" method="get">
					<div class="search-bar" style="width: 170px;">
						<input type="search" name="search" id="search" class="form-control rounded-pill" placeholder="통합검색" autocomplete="off" aria-label="통합검색" aria-describedby="button-addon2">
				</div>
			</form>
					<a class="navrightitem" href="${pageContext.request.contextPath}/member/login.do" style="font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">로그인</a> 
					<a class="navrightitem" href="${pageContext.request.contextPath}/member/registerUser.do" style="font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">회원가입</a> 
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="#" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">글쓰기</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/houseBoard/write.do">사진올리기</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">상품리뷰쓰기</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/qna/serviceBoardInsert.do">고객센터질문하기</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</c:if>
			<!-- 정지회원 -->
			<c:if test="${!empty user_num && user_auth==1}">
				<nav class="nav-right">
						<c:if test="${empty user_photo }">
						<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="33" height="33" class="my-photo">
						</c:if>
						<c:if test="${!empty user_photo }">
						<img src="${pageContext.request.contextPath }/member/photoView.do" width="33" height="33" class="my-photo">
						</c:if>
					<span class="navrightitem">${user_nickname} 님은 <b style="color: red;">정지회원입니다.</b></span>
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="#" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">마이페이지</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">마이페이지</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</c:if>
			<!-- 일반회원 -->
			<c:if test="${!empty user_num && user_auth==2}">
				<nav class="nav-right">
						<c:if test="${empty user_photo }">
						<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="33" height="33" class="my-photo">
						</c:if>
						<c:if test="${!empty user_photo }">
						<img src="${pageContext.request.contextPath }/member/photoView.do" width="33" height="33" class="my-photo">
						</c:if>
					<span class="navrightitem">${user_nickname} 님</span>
					<a class="navrightitem" href="${pageContext.request.contextPath}/cart/cartList.do">장바구니</a> 
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/myPage.do" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">마이페이지</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">마이페이지</a>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">나의쇼핑</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/sellerApplication.do">판매자신청</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="#" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">글쓰기</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/houseBoard/write.do">사진올리기</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="#">상품리뷰쓰기</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardInsert.do">고객센터질문하기</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/store/storeRegister.do">상품 등록</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</c:if>
			<!-- 판매자회원 -->
					<c:if test="${!empty user_num && user_auth == 3}">
						<nav class="nav-right">
						<c:if test="${empty user_photo }">
						<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="33" height="33" class="my-photo">
						</c:if>
						<c:if test="${!empty user_photo }">
						<img src="${pageContext.request.contextPath }/member/photoView.do" width="33" height="33" class="my-photo">
						</c:if>
						<span class="navrightitem">${user_nickname} 님</span>
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/myPage.do" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">판매자페이지</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">마이페이지</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myProduct.do">나의물건</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="#" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">등록</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardInsert.do">고객센터질문하기</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/store/storeRegister.do">상품 등록</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
		</c:if>
		<!-- 관리자 -->
				<c:if test="${!empty user_num && user_auth == 4}">
						<nav class="nav-right">
						<c:if test="${empty user_photo }">
						<img src="${pageContext.request.contextPath }/resources/images/crown.gif" width="37" height="37" class="my-photo">
						</c:if>
						<c:if test="${!empty user_photo }">
						<img src="${pageContext.request.contextPath }/member/photoView.do" width="37" height="37" class="my-photo">
						</c:if>
						<span class="navrightitem">관리자</span>
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="${pageContext.request.contextPath}/member/myPage.do" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">관리자페이지</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/myPage.do">관리자페이지</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="nav-right-menu">
						<ul>
							<li class="navrightmenuli"><a class="navmenuitem" href="#" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;">등록</a>
								<ul class="dropdownbar">
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/event/eventWrite.do">이벤트등록</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/notice/noticeWrite.do">공지등록</a></li>
									<li class="navrightitemdropdown" style="color: #35c5f0; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;"><a href="${pageContext.request.contextPath}/member/couponRegisterView.do">쿠폰 등록</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
		</c:if>
		
		</div>
	</div>
</div>
<div class="nav-dropdown">
	<div class="nav-dropdown-bar">
		<div class="navline"></div>
	</div>
</div>

<!-- 드롭다운 메뉴 고치기 호버 후에 고정,유지 되도록 -->
<!-- 창 따라 내려오도록 수정 -->
<!-- 검색창 수정 -->