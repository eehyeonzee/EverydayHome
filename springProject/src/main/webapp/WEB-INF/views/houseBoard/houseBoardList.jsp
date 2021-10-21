<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 12.
 * 작성자 : 이현지
 * 설명 : 집들이 게시판 글 목록
 * 수정일 : 
--%>
<!-- 중앙 내용 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<%-- <link rel="stylesheet" href="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> --%>
<style>
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<%-- <script type="text/javascript" src="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> --%>
<script type="text/javascript">
	$(function() {
		
	});
</script>
<div class="page-main">
	<h2>글 목록</h2>
<input style="float: right;" type="button" value="초기화" onclick="location.href='list.do'">
	<br>
<div style="display: inline-block;">
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">평수</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?size=0">10평미만</a>
	      <a class="dropdown-item" href="list.do?size=1">10평대</a>
	      <a class="dropdown-item" href="list.do?size=2">20평대</a>
	      <a class="dropdown-item" href="list.do?size=3">30평대</a>
	      <a class="dropdown-item" href="list.do?size=4">40평대</a>
	      <a class="dropdown-item" href="list.do?size=5">50평 이상</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size:15px;" href="#">${size}</a></span>
</div>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">주거형태</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?residence=0">원룸&오피스텔</a>
	      <a class="dropdown-item" href="list.do?residence=1">아파트</a>
	      <a class="dropdown-item" href="list.do?residence=2">빌라&연립</a>
	      <a class="dropdown-item" href="list.do?residence=3">단독주택</a>
	      <a class="dropdown-item" href="list.do?residence=4">사무공간</a>
	      <a class="dropdown-item" href="list.do?residence=5">상업공간</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size:15px;" href="#">${residence}</a></span>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스타일</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?style=0">모던</a>
	      <a class="dropdown-item" href="list.do?style=1">북유럽</a>
	      <a class="dropdown-item" href="list.do?style=2">빈티지</a>
	      <a class="dropdown-item" href="list.do?style=3">내추럴</a>
	      <a class="dropdown-item" href="list.do?style=4">프로방스&로맨틱</a>
	      <a class="dropdown-item" href="list.do?style=5">클래식&앤틱</a>
	      <a class="dropdown-item" href="list.do?style=6">한국&아시아</a>
	      <a class="dropdown-item" href="list.do?style=7">유니크</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size:15px;" href="#">${style}</a></span>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">공간</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="list.do?space=0">원룸</a>
	      <a class="dropdown-item" href="list.do?space=1">거실</a>
	      <a class="dropdown-item" href="list.do?space=2">침실</a>
	      <a class="dropdown-item" href="list.do?space=3">주방</a>
	      <a class="dropdown-item" href="list.do?space=4">욕실</a>
	      <a class="dropdown-item" href="list.do?space=5">아이방</a>
	      <a class="dropdown-item" href="list.do?space=6">드레스룸</a>
	      <a class="dropdown-item" href="list.do?space=7">서재&작업실</a>
	      <a class="dropdown-item" href="list.do?space=8">베란다</a>
	      <a class="dropdown-item" href="list.do?space=9">사무공간</a>
	      <a class="dropdown-item" href="list.do?space=10">상업공간</a>
	      <a class="dropdown-item" href="list.do?space=11">가구&소품</a>
	      <a class="dropdown-item" href="list.do?space=12">현관</a>
	      <a class="dropdown-item" href="list.do?space=13">외관&기타</a>
	    </div>
	  </div>
	</div>		
	<span><a style="font-size:15px;" href="#">${space}</a></span>
	<!-- 카테고리 검색 끝 -->
	<!-- 게시물 출력 시작 -->
	<div class="row mb-5 ml-5 mr-5">
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