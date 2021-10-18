<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<%-- 
 * 작성일 : 2021. 10. 14.
 * 작성자 : 이현지
 * 설명 : 집들이 게시판 글 상세
 * 수정일 : 
--%>
<link rel="stylesheet" href="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/videoAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#house_recom').html("${houseBoard.house_recom}"); // 추천수
		
		// ========== 추천 버튼 ========== //
		// 추천 버튼 클릭시 추천 또는 제거
		$('#btn_heart').click(function() {
			$.ajax({
				data: {house_num: ${houseBoard.house_num}, // 보내는 데이터
					   user_num: ${user_num}},
				tyep: 'post', // 데이터 전송 방식
				url: 'heart.do', // 데이터 보내는 곳
				dataType: 'json', // 보내는 데이터 타입
				cache: false,
				timeout: 30000,
				success: function(param) { // param으로 데이터 전송받음
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요');
					}else if(param.duplication == 0) {
						console.log('Cool function is called 🚀')
						$('#house_recom').text(param.heartCount);
						$('#btn_heart').css('background-color', '#fd7575');
					}else {
						console.log('Cool function is called 🚀')
						$('#house_recom').text(param.heartCount);
						$('#btn_heart').css('background-color', '#ffffff');
					}
				},
				error : function(request,status,error){      // 에러메세지 반환
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	              }
				}
			}); // end of ajax
		});	
	});
</script>
<!-- 공유 API 시작 -->
<script type="text/javascript">
	// 페이스북
	function shareFacebook() {
	    var sendUrl = 'localhost:8081/EverydayHome/houseBoard/detail.do?house_num=${houseBoard.house_num}'; // 전달할 URL
	    window.open('http://www.facebook.com/sharer/sharer.php?u=' + sendUrl);
	}
	// 카카오톡
	function shareKakao() {
 		// 사용할 앱의 JavaScript 키 설정
		Kakao.init('bb121a537c2b70043cc692b909a3c23f');
		// 링크 버튼 생성
		Kakao.Link.createDefaultButton({
			container: '#btnKakao', // 공유 버튼 ID
			objectType: 'feed',
			content: {
				title: '매일의 집', // 보여질 제목
				description: '매일 새롭게 올라오는 예쁜 집들을 구경하세요!', // 보여질 설명
				imageUrl: 'localhost:8081/EverydayHome/main/main.do', // 콘텐츠 URL
				link: {
				mobileWebUrl: 'localhost:8081/EverydayHome/main/main.do',
				webUrl: 'localhost:8081/EverydayHome/main/main.do'
				}
			}
		});
	}
	// 트위터
	function shareTwitter() {
	    var sendText = '매일의 집'; // 전달할 텍스트
	    var sendUrl = 'http://localhost:8081/EverydayHome/houseBoard/detail.do?house_num=${houseBoard.house_num}'; // 전달할 URL
	    window.open('https://twitter.com/intent/tweet?text=' + sendText + '&url=' + sendUrl);
	}
</script>
<!-- 공유 API 끝 -->
<!-- 중앙 내용 시작 -->
<div class="page-main">
	<!-- 해당 게시글 상세 내용 시작 -->
	<h2>${houseBoard.house_title}</h2>
	<ul>
		<li>번호 : ${houseBoard.house_num}</li>
		<li>작성자 : ${houseBoard.nickname}</li>
		<li>조회수 : ${houseBoard.house_hits}</li>
		<li>작성일 : ${houseBoard.house_reg_date}</li>
		<li>최근수정일 : ${houseBoard.house_mod_date}</li>
		<li>${houseBoard.house_area}｜${houseBoard.house_type}｜${houseBoard.house_style}｜${houseBoard.house_space}</li>
	</ul>
	<hr size="1" width="100%" noshade>
	<c:if test="${!empty houseBoard.thumbnail_filename}">
	<div class="align-center">
		<img src="imageView.do?house_num=${houseBoard.house_num}" style="max-width:500px">
	</div>
	</c:if>
	<p>${houseBoard.house_content}</p>
	<!-- 해당 게시글 상세 내용 끝 -->
	<!-- 추천 및 스크랩 시작 -->
	<div class="btn_click">
		<!-- 추천 -->
		<button type="button" id="btn_heart" class="btn btn-outline-danger" style="background-color: <c:if test="${heartBtnCheck == 0}">#ffffff;</c:if><c:if test="${heartBtnCheck == 1}"> #fd7575;</c:if>" aria-pressed="true" title="like" aria-label="like">
			<svg class="" style="width:24px; height:24px;" fill="currentColor" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMaxYMin meet">
		         <path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"/>
			</svg>
			<span class="heart-count">${houseBoard.house_recom}</span>
		</button>
		<!-- 스크랩 -->
		<button type="button" id="btn_scrap" class="btn btn-outline-warning" style="background-color: <c:if test="${scrapBtnCheck == 0}">#ffffff;</c:if><c:if test="${heartBtnCheck == 1}"> #fd7575;</c:if>" aria-pressed="true" title="scrap" aria-label="scrap">
			<svg class="" style="width:24px; height:24px;" fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24" preserveAspectRatio="xMaxYMin meet">
		         <path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"/>
			</svg>
		   <span class="scrap-count">${houseBoard.scrap_num}</span>
		</button>
	</div>
	<!-- 추천 및 스크랩 끝 -->
	<!-- SNS 공유하기 버튼 시작 -->
	<div align="right">
		<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">　　　</a><!-- 페이스북 -->
		<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">　　　</a><!-- 카카오톡 -->
		<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">　　　</a><!-- 트위터 -->
	</div>
	<!-- SNS 공유 API 버튼 끝 -->
	<!-- 수정｜삭제｜목록 버튼 시작 -->
	<hr size="1" width="100%" noshade>
	<div class="align-right">
		<!-- 로그인 회원번호와 작성자 회원번호가 일치해야 수정/삭제 가능 -->
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
	<!-- 수정｜삭제｜목록 버튼 끝 -->
	<!-- 댓글 시작 -->
	<span class="comm-title">댓글 ${count}</span>
	<div id="comm_div">
		<p>
		<form id="comm_form">
			<input type="hidden" name="house_num" value="${houseBoard.house_num}" id="house_num">
			<input type="hidden" name="mem_num" value="${user_num}" id="mem_num">
			<textarea rows="3" cols="50" name="comm_content" id="comm_content" class="comm-content" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"
				<c:if test="${empty user_num}">disabled="disabled"</c:if>
				><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다</c:if></textarea><!-- 닫는 태그 내리지(띄어쓰지) 말자! 공백으로 인식함 -->
			<c:if test="${!empty user_num}">
			<div id="comm_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="comm_second" class="align-right">
				<input type="submit" value="등록">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="더보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
	</div>
	<!-- 댓글 끝 -->
</div>
<!-- 중앙 내용 끝 -->
