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
<!-- 추천 및 스크랩 자바스크립트 시작 -->
<script type="text/javascript">
	$(function() {
		$('#heartCount').html("${countHeart}"); // span값 가져오기
		$('#scrapCount').html("${countScrap}");
		
		var house_num = $('#house_num').val(); // hidden값 가져오기
		
		// ========== 추천 버튼 ========== //
		// 추천 버튼 클릭시 추천 실행 또는 취소
		$(document).on('click','.heart-btn',function() {
			$.ajax({
				data: {
					"house_num": house_num, // 보내는 데이터
					},
				tyep: 'post', // 데이터 전송 방식
				url: 'heart.do', // 데이터 보내는 곳
				dataType: 'json', // 보내는 데이터 타입
				cache: false,
				timeout: 30000,
				success: function(param) { // param으로 데이터 전송받음
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요');
						location.replace('../member/login.do');
					}else if(param.result == 'success') {
						alert('추천해주셔서 감사합니다');
						$('#heart').attr('src','../resources/images/like.png');
						$('#heartCount').text(param.countHeart); // span값 변경하기
					}else {
						alert('추천이 취소되었습니다');
						$('#heart').attr('src','../resources/images/dislike.png');
						$('#heartCount').text(param.countHeart);
					}
				},
				error: function(request,status,error) { // 에러메시지 반환
					alert("🤯 code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			}); // end of ajax
		});
		
		// ========== 스크랩 버튼 ========== //		
		// 스크랩 버튼 클릭시 스크랩 실행 또는 취소
		$(document).on('click','.scrap-btn',function() {
			$.ajax({
				data: {
					"house_num": house_num, // 보내는 데이터
					},
				tyep: 'post', // 데이터 전송 방식
				url: 'scrap.do', // 데이터 보내는 곳
				dataType: 'json', // 보내는 데이터 타입
				cache: false,
				timeout: 30000,
				success: function(param) { // param으로 데이터 전송받음
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요');
						location.replace('../member/login.do');
					}else if(param.result == 'success') {
						alert('스크랩이 완료되었습니다');
						$('#scrap').attr('src','../resources/images/scrapO.png');
						$('#scrapCount').text(param.countScrap); // span값 변경하기
					}else {
						alert('스크랩이 취소되었습니다');
						$('#scrap').attr('src','../resources/images/scrapX.png');
						$('#scrapCount').text(param.countScrap);
					}
				},
				error: function(request,status,error) { // 에러메시지 반환
					alert("🤯 code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			}); // end of ajax
		});
		
	});
</script>
<!-- 추천 및 스크랩 자바스크립트 끝 -->
<!-- 공유 API 자바스크립트 시작 -->
<script type="text/javascript">
	// 페이스북
	function shareFacebook() {
	    var sendUrl = 'localhost:8081/EverydayHome/houseBoard/detail.do?house_num=${houseBoard.house_num}'; // 전달할 URL
	    window.open('http://www.facebook.com/sharer/sharer.php?u=' + sendUrl);
	}
	// 카카오톡
	function shareKakao() {
		var content = document.getElementById('btnKakao').innerHTML;
		// 사용할 앱의 JavaScript 키 설정
		Kakao.init('bb121a537c2b70043cc692b909a3c23f');
		// 링크 버튼 생성
		Kakao.Link.sendDefault({
			objectType: 'feed',
			content: {
				title: '매일의 집', // 보여질 제목
				description: '매일 새롭게 올라오는 예쁜 집들을 구경하세요! 🏡🥰💗', // 보여질 설명
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
<!-- 공유 API 자바스크립트 끝 -->
<!-- 댓글 자바스크립트 시작 -->
<script type="text/javascript">
	$(function() {
		var currentPage
		var count;
		var rowCount;
		
		// ========== 댓글 목록 ========== //
		function selectData(pageNum,house_num) {
			currentPage = pageNum;
			
			if(pageNum == 1) {
				// 처음 호출시는 해당 ID의 div 내부 내용물을 제거
				$('#output').empty();
			}
			
			// 로딩 이미지 노출
			$('#loading').show();
			
			$.ajax({
				type: 'post',
				data: {
					pageNum: pageNum, // key:value
					house_num: house_num
					},
				url: 'listComm.do',
				dataType: 'json',
				cache: false,
				timeout: 30000,
				success: function(param) {
					//로딩 이미지 감추기
					$('#loading').hide();
					count = param.count;
					rowCount = param.rowCount;
					
					$(param.list).each(function(index,item) { // 인자 item이 list에 들어가는 값을 받음
						//each() 메소드는 매개변수로 받은 것을 사용해 for in 반복문과 같이 배열이나 객체의 요소를 검사함
						var output = '<div class="item">';
						if(item.profile != null) {
							output += '<div style="width:57px; height:57px; float:left; padding-right:5em;"><img src="${pageContext.request.contextPath}/houseBoard/boardProfile.do?mem_num='+item.mem_num+'" style="height:53px; width:53px;" class="my-photo"/></div>';
						}else {
							output += '<div style="width:57px; height:57px; float:left; padding-right:5em;"><img src="${pageContext.request.contextPath}/resources/images/basic.jpg" style="height:45px; width:45px;" class="my-photo"/></div>';
						}
						output += '<h4 style="font-size:15px;"><b>' + item.nickname + '</b></h4>';
						output += '<div class="sub-item">';
						output += '   <p>' + item.comm_content.replace(/</gi,'&lt;').replace(/>/gi,'&gt;') + '</p>';
						output += item.comm_reg_date;
						if($('#mem_num').val() == item.mem_num) {
							// 로그인한 회원번호가 댓글 작성자 회원번호와 같으면 버튼 노출
							output += ' <input type="button" data-num="'+item.comm_num+'" data-mem="'+item.mem_num+'" value="수정" class="modify-btn">';
							output += ' <input type="button" data-num="'+item.comm_num+'" data-mem="'+item.mem_num+'" value="삭제" class="delete-btn">';
						}
						output += '  <hr size="1" noshade>';
						output += '</div>';
						output += '</div>';
						
						//문서 객체에 추가
						$('#output').append(output);						
					});//end of each
					
					//paging button 처리
					if(currentPage >= Math.ceil(count/rowCount)) {
						//다음 페이지가 없음
						$('.paging-button').hide();
					}else{
						//다음 페이지가 존재
						$('.paging-button').show();
					}
				},
				error: function(request,status,error) { // 에러메시지 반환
					alert("🤯 code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		} // 댓글 목록 끝
		
		// 다음 댓글 보기 버튼 클릭시 데이터 추가
		$('.paging-button input').click(function() {
			var pageNum = currentPage + 1;
			selectData(pageNum,$('#house_num').val());
		});
		
		// ========== 댓글 등록 ========== //
		$('#comm_form').submit(function(event) { // 기본 이벤트 제거하기 위해 이벤트 객체를 받음
			if($('#comm_content').val().trim() == '') {
				alert('내용을 입력하세요');
				$('#comm_content').val('').focus();
				return false;
			}
			
			// form 이하의 태그에 입력한 데이터를 모두 읽어옴
			var form_data = $(this).serialize();
			// 등록
			$.ajax({
				type: 'post',
				data: form_data, // 키(data): 변수(form_data) - 전달
				url: 'writeComm.do',
				dataType: 'json',
				cache: false,
				timeout: 30000,
				success: function(param) {
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요');
					}else if(param.result == 'success') {
						// 폼 초기화
						initForm(); // 따로 만들어줘야 함
						// 댓글 작성이 성공하면 새로 삽입한 글을 포함하여 첫번째 페이지의 게시글들을 다시 호출
						selectData(1,$('#house_num').val());
					}else {
						alert('등록 오류🤯');
					}
				},
				error: function(request,status,error) { // 에러메시지 반환
					alert("🤯 code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			// 기본 이벤트 제거 - submit 막아야 함
			event.preventDefault();
		});
		
		// 댓글 작성 폼 초기화
		function initForm() {
			$('textarea').val('');
			$('#comm_first .letter-count').text('300/300'); // class 후손선택자
		}
		
		// textarea에 내용 입력시 글자수 체크
		$(document).on('keyup','textarea',function() {
			// 입력한 글자 구함
			var inputLength = $(this).val().length;
			
			if(inputLength > 300) { // 300자 넘어선 경우
				$(this).val($(this).val().substring(0,300));
			}else { // 300자 이하
				var remain = 300 - inputLength;
				remain += '/300';
				if($(this).attr('id') == 'comm_content') {
					// 등록폼 글자수	후손선택자라 중간에 공백 있음
					$('#comm_first .letter-count').text(remain);
				}else {
					// 수정폼 글자수
					$('#mcomm_first .letter-count').text(remain);
				}
			}
		}); // 댓글 등록 끝
		
		// ========== 댓글 수정 ========== //
		// 댓글 수정 버튼 클릭시 수정폼 노출
		$(document).on('click','.modify-btn',function() {
			// 댓글 글번호
			var comm_num = $(this).attr('data-num');
			// 작성자 회원번호
			var mem_num = $(this).attr('data-mem');
			// 댓글 내용
			// this는 수정버튼 부모태그로 가서 p태그를 찾고 내용을 가져옴, br/gi 태그는 \n으로 변경, i의 의미는 대소문자 구분x, g의 의미는 전체
			var comm_content = $(this).parent().find('p').html().replace(/<br>/gi,'\n');
			
			// 댓글 수정폼 UI
			var modifyUI = '<form id="mcomm_form">';
			   modifyUI += '   <input type="hidden" name="comm_num" id="mcomm_num" value="'+comm_num+'">';
			   modifyUI += '   <input type="hidden" name="mem_num" id="mmem_num" value="'+mem_num+'">';
			   modifyUI += '   <textarea rows="3" cols="50" name="comm_content" id="mcomm_content" class="comm-content">'+comm_content+'</textarea>';
			   modifyUI += '   <div id="mcomm_first"><span class="letter-count">300/300</span></div>';
			   modifyUI += '   <div id="mcomm_second" class="align-right">'
			   modifyUI += '	  <input type="submit" value="수정">';
			   modifyUI += '	  <input type="submit" value="취소" class="comm-reset">';
			   modifyUI += '   </div>';
			   modifyUI += '<hr size="1" width="90%" noshade>';
			   modifyUI += '</form>';
			   
			   // 이전에 이미 수정하는 댓글이 있을 경우 수정 버튼을 클릭하면 숨겨진 sub-item을 환원시키고 수정폼을 초기화
			   initModifyForm();
			   
			   // 지금 클릭해서 수정하고자 하는 데이터는 감추기
			   // 수정버튼을 감싸고 있는 div
			   $(this).parent().hide(); // parent는 직계부모 - 수정버튼의 부모태그 sub-item 숨기기
			   
			   // 수정폼을 수정하고자 하는 데이터가 있는 div에 노출
			   $(this).parents('.item').append(modifyUI); // parents는 많은 부모들 중에서 내가 원하는 부모 지정 - class가 item인 태그에 append
			   
			   // 입력한 글자수 세팅
			   var inputLength = $('#mcomm_content').val().length;
			   var remain = 300 - inputLength;
			   remain += '/300';
			   
			   // 문서 객체에 반영
			   $('#mcomm_first .letter-count').text(remain);
		});
		
		// 수정폼에서 취소 버튼 클릭시 수정폼 초기화
		$(document).on('click','.comm-reset',function() {
			initModifyForm();
		});
		
		// 댓글 수정 폼 초기화
		function initModifyForm() {
			$('.sub-item').show(); // sub-item 보여줌
			$('#mcomm_form').remove(); // 폼 초기화
		}
		
		// 댓글 수정
		$(document).on('submit','#mcomm_form',function(event) { // form submit을 막기 위해 event 객체를 받음
			if($('#mcomm_content').val().trim() == '') {
				alert('내용을 입력하세요');
				$('#mcomm_content').val('').focus();
				return false;
			}
			
			// 폼에 입력한 데이터 반환
			var form_data = $(this).serialize();
			
			// 댓글 수정
			$.ajax({
				url: 'updateComm.do',
				type: 'post',
				data: form_data, // 오른쪽 form_data(value)는 중괄호 형태의 json 표기법으로 바뀜
				dataType: 'json',
				cache: false,
				timeout: 30000,
				success: function(param) {
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요');
					}else if(param.result == 'success') {
						// 등록 누르면 전송x -> 화면만 갱신
						// form을 없애기 전에 form에 접근해서 정보를 읽음
						// 부모로 올라가서 p태그를 찾아 내용을 넣어줌, html태그를 불허용했기 때문에 바꾸는 작업처리 필요
						$('#mcomm_form').parent().find('p').html($('#mcomm_content').val().replace(/</g,'&lt;').replace(/>/g,'&gt;'));
						// 수정폼 초기화
						initModifyForm();
						alert('댓글이 수정되었습니다');
					}else if(param.result == 'wrongAccess') {
						alert('타인의 글을 수정할 수 없습니다');
					}else {
						alert('댓글 수정 오류🤯');
					}
				},
				error: function(request,status,error) { // 에러메시지 반환
					alert("🤯 code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			// 기본이벤트 제거 - submit 막아야 함 
			event.preventDefault();
		});
		
		// ========== 댓글 삭제 ========== //
		$(document).on('click','.delete-btn',function() {
			// 댓글 번호
			var comm_num = $(this).attr('data-num');
			// 작성자 회원번호
			var mem_num = $(this).attr('data-mem');
			
			$.ajax({
				type: 'post',
				url: 'deleteComm.do',
				data: {
					comm_num: comm_num, // key:value
					mem_num: mem_num
					},
				dataType: 'json',
				cache: false,
				timeout: 30000,
				success: function(param) {
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요');
					}else if(param.result == 'success') {
						alert('댓글이 삭제되었습니다');
						selectData(1,$('#house_num').val());
					}else if(param.result == 'wrongAccess') {
						alert('타인의 글을 삭제할 수 없습니다');
					}else {
						alert('댓글 삭제 오류🤯');
					}
				},
				error: function(request,status,error) { // 에러메시지 반환
					alert("🤯 code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		}); // 댓글 삭제 끝
		
		// 초기 데이터(목록) 호출
		selectData(1,$('#house_num').val());
	});
</script>
<!-- 댓글 자바스크립트 끝 -->
<!-- 중앙 내용 시작 -->
<div class="page-main">
	<!-- 해당 게시글 상세 내용 시작 -->
	<h2>${houseBoard.house_title}</h2>
	<input type="hidden" id="house_num" value="${houseBoard.house_num}">
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
		<!-- 추천 버튼 -->
		<button type="button" id="heart_btn" class="heart-btn">
			<c:if test="${heartCheckNum == 0}">
				<img id="heart" style="margin: 5 10 5 10; width:25px; height:25px;" src="${pageContext.request.contextPath}/resources/images/dislike.png">
			</c:if>
			<c:if test="${heartCheckNum == 1}">
				<img id="heart" style="margin: 5 10 5 10; width:25px; height:25px;" src="${pageContext.request.contextPath}/resources/images/like.png">
			</c:if>
		</button>
		<!-- 추천수 -->
		<span id="heartCount" style="display:inline-block;"></span>&nbsp;
		<!-- 스크랩 버튼 -->
		<button type="button" id="scrap_btn" class="scrap-btn">
			<c:if test="${scrapCheckNum == 0}">
				<img id="scrap" style="margin: 5 10 5 10; width:25px; height:25px;" src="${pageContext.request.contextPath}/resources/images/scrapX.png">
			</c:if>
			<c:if test="${scrapCheckNum == 1}">
				<img id="scrap" style="margin: 5 10 5 10; width:25px; height:25px;" src="${pageContext.request.contextPath}/resources/images/scrapO.png">
			</c:if>
		</button>
		<!-- 스크랩수 -->
		<span id="scrapCount" style="display:inline-block;"></span>
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
	<span class="comm-title">댓글 <b style="color:#8c996b">${countComm}</b></span>
	<div id="comm_div">
		<p>
		<form id="comm_form">
			<input type="hidden" name="house_num" value="${houseBoard.house_num}" id="house_num">
			<input type="hidden" name="mem_num" value="${user_num}" id="mem_num">
			<textarea rows="3" cols="50" name="comm_content" id="comm_content" class="comm-content" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"
				<c:if test="${empty user_num}">disabled="disabled"</c:if>
				><c:if test="${empty user_num}">로그인 후 사용하세요</c:if></textarea><!-- 닫는 태그 내리지(띄어쓰지) 말자! 공백으로 인식함 -->
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
