<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 12.
 * 작성자 : 이현지
 * 설명 : 집들이 게시판 글 목록!
 * 수정일 : 
--%>
<!-- 중앙 내용 시작 -->
<style>
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script type="text/javascript">
	$(function() {
		
	});
</script>
<div class="page-main">
	<h2>글 목록</h2>


	<br>
<div style="display: inline-block;">
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">평수</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?size=0&residence=${residence}&style=${style}&space=${space}">10평미만</a>
	      <a class="dropdown-item" href="list.do?size=1&residence=${residence}&style=${style}&space=${space}">10평대</a>
	      <a class="dropdown-item" href="list.do?size=2&residence=${residence}&style=${style}&space=${space}">20평대</a>
	      <a class="dropdown-item" href="list.do?size=3&residence=${residence}&style=${style}&space=${space}">30평대</a>
	      <a class="dropdown-item" href="list.do?size=4&residence=${residence}&style=${style}&space=${space}">40평대</a>
	      <a class="dropdown-item" href="list.do?size=5&residence=${residence}&style=${style}&space=${space}">50평 이상</a>
	      <a class="dropdown-item" href="list.do?size=''&residence=${residence}&style=${style}&space=${space}">취소</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;" href="#">${sizeOutput}</a></span>

	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">주거형태</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?size=${size}&residence=0&style=${style}&space=${space}">원룸&amp;오피스텔</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=1&style=${style}&space=${space}">아파트</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=2&style=${style}&space=${space}">빌라&amp;연립</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=3&style=${style}&space=${space}">단독주택</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=4&style=${style}&space=${space}">사무공간</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=5&style=${style}&space=${space}">상업공간</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=''&style=${style}&space=${space}">취소</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;" href="#">${residenceOutput}</a></span>
	
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스타일</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=0&space=${space}">모던</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=1&space=${space}">북유럽</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=2&space=${space}">빈티지</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=3&space=${space}">내추럴</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=4&space=${space}">프로방스&amp;로맨틱</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=5&space=${space}">클래식&amp;앤틱</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=6&space=${space}">한국&amp;아시아</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=7&space=${space}">유니크</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=''&space=${space}">취소</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;" href="#">${styleOutput}</a></span>

	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">공간</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=0">원룸</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=1">거실</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=2">침실</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=3">주방</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=4">욕실</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=5">아이방</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=6">서재&amp;작업실</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=7">베란다</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=8">사무공간</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=9">상업공간</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=10">가구&amp;소품</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=11">현관</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=12">외관&amp;기타</a>
	      <a class="dropdown-item" href="list.do?size=${size}&residence=${residence}&style=${style}&space=''">취소</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size: 30px; font-family: 'Gowun Dodum', sans-serif; text-decoration: none;" href="#">${spaceOutput}</a></span>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	  	<button class="btn btn-outline-secondary" type="button" onclick="location.href='list.do'">초기화</button>
	  </div>
	</div>
</div>
	<!-- 카테고리 검색 끝 -->
	<!-- 게시물 출력 시작 -->
	<div class="row mb-5 ml-5 mr-5" align="center">
	<c:if test="${count == 0}">
	<div class="align-center">
		등록된 게시물이 없습니다.
	</div>
	</c:if>
	<c:if test="${count > 0}">
	<p>
		총 <b style="color:#8c996b">${count}</b>개의 글
	</p>
	
	<table>
		<tr>
			<th>번호</th>
			<th width="400">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="houseBoard" items="${list}">
		<tr>
			<td>${houseBoard.house_num}</td>
			<td><a href="detail.do?house_num=${houseBoard.house_num}">${houseBoard.house_title}</a></td>
			<td>${houseBoard.nickname}</td>
			<td>${houseBoard.house_reg_date}</td>
			<td>${houseBoard.house_hits}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
	</div>
	<!-- 게시물 출력 끝 -->
</div>
<!-- 중앙 내용 끝 -->