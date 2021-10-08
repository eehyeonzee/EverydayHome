<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.footer-container{
	display:grid;
	grid-template-columns: 1fr 3fr 1fr;
	grid-template-rows: 300px;
	background-color : rgb(250,250,250);
	}
	.footer-item{
	display:grid;
	}
	.footer-item:nth-child(1){
	background-color : white;
	}
	.footer-item:nth-child(3){
	background-color : white;
	}
	.empty-place{
	margin : 50px;
	}
</style>
<div class="empty-place"></div>
<div class="footer-container">
	<div class="footer-item"></div>
	<div class="footer-item">
	<h3>고객센터 > </h3>
	<h2>1818-1818</h2>
	<p>평일 09:00 ~ 18:00(주말 공휴일 제외)<p><br>
	브랜드 스토리 회사소개 제품정보 이용약관 <b>개인정보처리방침</b> 고객센터 고객의 소리 전문가 등록<br>
	위 사이트는 학습용으로 제작된 사이트입니다. 깃허브 주소는 https://github.com/OhSangJooon/EverydayHome 입니다.<br>
		&copy;Copyright 2021 ohshinleenayong <br>
	</div>
	<div class="footer-item"></div>
</div>
<!-- 하단 끝 -->