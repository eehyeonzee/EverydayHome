<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
.nav-container{
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
.nav-menu-item{
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
 .dropdown{
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
.dropdown li {
	display : inline-block;
}
.nav-menu-li:hover .dropdown{
height: 40px; 
}
.nav-menu-item-dropdown{
	font-size : 15px;
	line-height : 23px;
	margin : 8px 4px;
	padding : 6px 8px 4px;
	font-weight : bold;
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
.nav-right-item{
	display:inline-block;
	position:relative;
	font-weight:700;
	line-height:20px;
	font-size:15px;
	padding:14px 6px;
	margin:7px 10px 0;
}
/*하단 줄*/
.nav-line{
	z-index:502;
	position:relative;
	transition: top .1s;
	border-bottom:1px solid #ededed;
}
/*드롭다운 위한 여백 */
.nav-dropdown {
	margin : 50px;
}
.nav-right-item-dropdown{
	font-size : 15px;
	line-height : 23px;
	margin : 8px 4px;
	padding : 6px 8px 4px;
	font-weight : bold;
}
.nav-right-menu-li:hover .dropdown{
height: 40px; 
}
</style>
<div class="navgation-bar">
	<div class="nav-line">
		<div class="nav-container">
			<div class="nav-left">
				<a class="logo" href="#" style="">걍 매일의 집</a>
			</div>
			<nav class="nav-menu">
				<ul>
					<li class="nav-menu-li"><a class="nav-menu-item" href="#" style="color: #35c5f0;">커뮤니티</a>
						<ul class="dropdown">
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="#">커뮤니티 메인</a></li>
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="#">공지사항</a></li>
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="#">사진게시판</a></li>
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="#">고객센터게시판</a></li>
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="#">QnA게시판</a></li>
						</ul>
					</li>
					<li class="nav-menu-li"><a class="nav-menu-item" href="${pageContext.request.contextPath}/store/storeMain">스토어</a>
						<ul class="dropdown">
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="${pageContext.request.contextPath}/store/storeMain">스토어홈</a></li>
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="#">카테고리</a></li>
							<li class="nav-menu-item-dropdown" style="color: #35c5f0;"><a href="#">베스트</a></li>
						</ul>
				</ul>
			</nav>
			<c:if test="${empty user_num}">
				<nav class="nav-right">
				<form id="search" action="#" method="get">
					<div class="search-bar" style="width: 170px;">
						<input type="search" name="search" id="search" class="form-control rounded-pill" placeholder="통합검색" autocomplete="off" aria-label="통합검색" aria-describedby="button-addon2">
				</div>
			</form>
					<a class="nav-right-item" href="#">장바구니</a> 
					<a class="nav-right-item" href="#">로그인</a> 
					<a class="nav-right-item" href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a> 
					<div class="nav-right-menu">
						<ul>
							<li class="nav-right-menu-li"><a class="nav-menu-item" href="#" style="color: #35c5f0;">글쓰기</a>
								<ul class="dropdown">
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">사진올리기</a></li>
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">상품리뷰쓰기</a></li>
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">고객센터질문하기</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</c:if>
			<c:if test="${!empty user_num}">
				<nav class="nav-right">
					<a class="nav-right-item" href="#">장바구니</a> 
					<div class="nav-right-menu">
						<ul>
							<li class="nav-right-menu-li"><a class="nav-menu-item" href="#" style="color: #35c5f0;">마이페이지</a>
								<ul class="dropdown">
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">마이페이지</a></li>
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">나의쇼핑</a></li>
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">판매자신청</a></li>
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">로그아웃</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="nav-right-menu">
						<ul>
							<li class="nav-right-menu-li"><a class="nav-menu-item" href="#" style="color: #35c5f0;">글쓰기</a>
								<ul class="dropdown">
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">사진올리기</a></li>
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="#">상품리뷰쓰기</a></li>
									<li class="nav-right-item-dropdown" style="color: #35c5f0;"><a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardInsertForm.do">고객센터질문하기</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</c:if>
		</div>
		<c:if test="${!empty user_num && user_auth == 2}">
			<nav class="nav-right">
				<a class="nav-right-item" href="#">판매자페이지</a> 
				<a class="nav-right-item" href="#">나의 물건</a> 
				<a class="nav-right-item" href="#">로그아웃</a>
			</nav>
		</c:if>
	</div>
</div>
<div class="nav-dropdown">
	<div class="nav-dropdown-bar">
		<div class="nav-line"></div>
	</div>
</div>

<!-- 드롭다운 메뉴 고치기 호버 후에 고정,유지 되도록 -->
<!-- 창 따라 내려오도록 수정 -->
<!-- 검색창 수정 -->