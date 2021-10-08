<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 메인 시작 -->
<style>
.main {
	display: flex;
	justify-content: center;
	align-item: center;
}

.main-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-auto-rows: minmax(180px, auto);
	grid-row-gap: 4 rem;
	grid-column-gap: 2rem;
}

.main-item:nth-child(1) {
	grid-column: 1/4;
	grid-row: 1/4;
}

.main-item:nth-child(2) {
	grid-column: 4/5;
	grid-row: 1/4;
}

.main-item:nth-child(3) {
	grid-column: 1/4;
	grid-row: 4/6;
}

.main-item:nth-child(4) {
	grid-column: 4/5;
	grid-row: 4/6;
}

.main-item:nth-child(5) {
	grid-column: 1/5;
	grid-row: 6/7;
}

.main-item:nth-child(6) {
	grid-column: 1/5;
	grid-row: 7/9;
}

.main-item:nth-child(7) {
	grid-column: 1/5;
	grid-row: 9/11;
}
.main-story{
	display:flex;
	flex-direction:column;
	align-items: stretch;
}
.main-story-link{
	height: 90px;
	width:397px;
	border : 1px solid white;
	background-color:rgb(250,250,250);
	border-radius:10px;
}
.description{
	padding : 25px 0px 0px 25px;
	font-weight : 700;
	font-color: gray;
	font-size: 9px;
}
.title{
	padding : 10px 0px 0px 25px;
	font-weight : 700;
	font-color: gray;
	font-size: 13px;
}
</style>
<div class="main">
	<div class="main-container">
		<div class="main-item">메인썸네일메인썸네일v메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일메인썸네일
		</div>
		<div class="main-item">이벤트 썸네일</div>
		<div class="main-item">매일의 스토리</div>
		<div class="main-item" id="main-item-link">
			<div class="main-story">
			<div class="main-story-link" onclick="location.href='#';">
				<div class="description">예쁜집 구경하기</div>
				<div class="title">
					<span class="text">>집들이</span>
				</div>
			</div> 
			<div class="main-story-link" onclick="location.href='#';">
				<div class="description">전문가 시공사례</div>
				<div class="title">
					<span class="text">>전문가 집들이</span>
				</div>
			</div>
			<div class="main-story-link" onclick="location.href='#';">
				<div class="description">인테리어 꿀팁 총 집합</div>
				<div class="title">
					<span class="text">>노하우</span>
				</div>
			</div>
			</div>
		</div>
		<div class="main-item">카테고리</div>
		<div class="main-item">매일의 인기사진</div>
		<div class="main-item">베스트</div>
	</div>
</div>
<!-- 메인 끝 -->