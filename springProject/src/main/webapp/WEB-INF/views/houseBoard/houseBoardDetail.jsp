<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 14.
 * 작성자 : 이현지
 * 설명 : 집들이 게시판 글 상세
 * 수정일 : 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/videoAdapter.js"></script>
<!-- 중앙 내용 시작 -->
<div class="page-main">
	<h2>${houseBoard.house_title}</h2>
	<ul>
		<li>번호 : ${houseBoard.house_num}</li>
		<li>작성자 : ${houseBoard.mem_id}</li>
		<li>조회수 : ${houseBoard.house_hits}</li>
		<li>작성일 : ${houseBoard.house_reg_date}</li>
		<li>최근수정일 : ${houseBoard.house_mod_date}</li>
		<li>${houseBoard.house_area}｜${houseBoard.house_type}｜${houseBoard.house_style}｜${houseBoard.house_space}</li>
	</ul>
	<hr size="1" width="100%" noshade="noshade">
	<c:if test="${!empty houseBoard.thumbnail_filename}">
	<div class="align-center">
		<img src="imageView.do?house_num=${houseBoard.house_num}" style="max-width:500px">
	</div>
	</c:if>
	<p>${houseBoard.house_content}</p>
	<hr size="1" width="100%" noshade>
	<div class="align-right">
	<c:if test="${!empty user_num && user_num == houseBoard.mem_num}">
		<input type="button" value="수정" onclick="location.href='update.do?house_num=${houseBoard.house_num}'">
		<input type="button" value="삭제" id="delete_btn">
			<script type="text/javascript">
				var delete_btn = document.getElementById('delete_btn');
				delete_btn.onclick = function() {
					var choice = confirm('삭제하시겠습니까?');
					if(choice) {
						location.replace('delete.do?house_num=${houseBoard.house_num}') // replace는 삭제 후 경로 지워줌 -> back 못함
					}
				};
			</script>
	</c:if>
	<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
</div>
<!-- 중앙 내용 끝 -->
