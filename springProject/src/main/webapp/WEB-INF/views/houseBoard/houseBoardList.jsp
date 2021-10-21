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
<link rel="stylesheet" href="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
</style>
<script type="text/javascript" src="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
</script>
<div class="page-main">
<div class="container-fluid">
	<!-- 카테고리 검색 시작 -->
	<form id="search_form" action="list.do" method="get">
		<div class="search">
			<select name="keyword" id="keyword">
				<option value="">평수</option>
				<option value="10평 미만">10평 미만</option>
				<option value="10평대">10평대</option>
				<option value="20평대">20평대</option>
				<option value="30평대">30평대</option>
				<option value="40평대">40평대</option>
				<option value="50평 이상">50평 이상</option>
			</select>
			<input type="submit" value="찾기" >
			<input type="button" value="초기화" onclick="location.href='list.do'">
		</div>
	</form>
	<form id="search_form" action="list.do" method="get">
		<div class="search">
			<select name="keyword" id="keyword">
				<option value="">주거형태</option>
				<option value="원룸&오피스텔">원룸&오피스텔</option>
				<option value="아파트">아파트</option>
				<option value="빌라&연립">빌라&연립</option>
				<option value="단독주택">단독주택</option>
				<option value="사무공간">사무공간</option>
				<option value="상업공간">상업공간</option>
			</select>
			<input type="submit" value="찾기" >
		</div>
	</form>
	<form id="search_form" action="list.do" method="get">
		<div class="search">
			<select name="keyword" id="keyword">
				<option value="">스타일</option>
				<option value="모던">모던</option>
				<option value="북유럽">북유럽</option>
				<option value="빈티지">빈티지</option>
				<option value="내추럴">내추럴</option>
				<option value="프로방스&로맨틱">프로방스&로맨틱</option>
				<option value="클래식&앤틱">클래식&앤틱</option>
				<option value="한국&아시아">한국&아시아</option>
				<option value="유니크">유니크</option>
			</select>
			<input type="submit" value="찾기" >
		</div>
	</form>
	<form id="search_form" action="list.do" method="get">
		<div class="search">
			<select name="keyword" id="keyword">
				<option value="">공간</option>
				<option value="원룸">원룸</option>
				<option value="거실">거실</option>
				<option value="침실">침실</option>
				<option value="주방">주방</option>
				<option value="욕실">욕실</option>
				<option value="아이방">아이방</option>
				<option value="드레스룸">드레스룸</option>
				<option value="서재&작업실">서재&작업실</option>
				<option value="베란다">베란다</option>
				<option value="사무공간">사무공간</option>
				<option value="상업공간">상업공간</option>
				<option value="가구&소품">가구&소품</option>
				<option value="현관">현관</option>
				<option value="외관&기타">외관&기타</option>
			</select>
			<input type="submit" value="찾기" >
		</div>
	</form>
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
</div>
<!-- 중앙 내용 끝 -->