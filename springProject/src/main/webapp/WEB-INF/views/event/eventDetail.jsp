<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!--  공유 API 시작 -->
<script type="text/javascript">
//페이스북
function shareFacebook() {
    var sendUrl = 'localhost:8081/EverydayHome/event/eventDetail.do?event_num=${event.event_num}'; // 전달할 URL
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
    var sendUrl = 'http://localhost:8081/EverydayHome/event/eventDetail.do?event_num=${event.event_num}'; // 전달할 URL
    window.open('https://twitter.com/intent/tweet?text=' + sendText + '&url=' + sendUrl);
}
</script>
<!-- 공유 API  끝 -->

<script type="text/javascript">

	$(function(){
		var currentPage;
		var count;
		var rowCount;
		//댓글 목록
		function selectData(pageNum, event_num){
			
		}
		//다음 댓글 보기 버튼 클릭시 데이터 추가
		//댓글 등록
		$('#comm_form').submit(function(event){
			if($('#comm_content').val().trim()==''){
				alert('내용을 입력하세요!');
				$('#comm_content').val('').focus();
				return false;
			}
			var data =$(this).serialize();
			//등록
			$.ajax({
				type:'post',
				data:data,
				url:'writeComment.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인 해야 작성할 수 있습니다.');
					}else if(param.result == 'success'){
						//폼 초기화
						initForm();
						//댓글 작성이 성공하면 새로 삽입한 글을 포함해서 첫번째 페이지의
						//게시글들을 다시 호출
						selectData(1,$('#event_num').val());
					}else{
						alert('댓글 등록시 오류 발생!');
					}
				},
				error : function(request,status,error) { // 에러메시지 반환
					alert("🤯 code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			//기본 이벤트 제거
			event.preventDefault();
		});
		//댓글 작성 폼 초기화
		function initForm(){
			$('textarea').val('');
			$('#comm_first .letter-count').text('300/300');
		}
		//textarea에 내용 입력시 글자수 체크
		//댓글 수정 버튼 클릭시 수정폼 노출
		//수정폼에서 취소 버튼 클릭시 수정폼 초기화
		//댓글 수정 폼 초기화
		//댓글 수정
		//댓글 삭제
		//초기 데이터(목록) 호출
		selectData(1,$('#event_num').val());
	});
</script>

<style>
.main-container{
width:1000px;
margin : 0 auto;
}
.title-item{
text-align: left;
}
.date-item{
text-align: left;
}
.content-item{
text-align: left;
padding: 50px 0px 140px 10px;
}
.hits-item{
text-align: right;
border-bottom : 1px solid #dbdbdb;
padding : 0px 8px 0px 10px;
}
.icon-item{
border-top : 1px solid #dbdbdb;
text-align: right;
padding : 40px 8px 0px 100px;

}
</style>


 <div class="container">
<div class="main-container"> 
	<!-- 게시글 내용 시작 -->
 	<div class="title-item" align="center">
 		<h2  id="title" style="font-family: 'Gowun Dodum', sans-serif;">${event.event_title}</h2>
 	</div>
 	<div class="date-item" align="center">
 		<p style="font-family: 'Gowun Dodum', sans-serif;">${event.event_reg_date}</p>
 	</div>
 	<div class="hits-item" align="center">
 		<p style="font-family: 'Gowun Dodum', sans-serif;">hits : ${event.event_hits}  |  작성자 : 관리자</p>
 	</div>
 	<!-- 썸네일 시작 -->
 	<hr size="1" width="100%" noshade>
	<c:if test="${!empty event.event_filename}">
	<div class="align-center">
		<img src="imageView.do?event_num=${event.event_num}" style="max-width:500px">
	</div>
	</c:if>
 	<!-- 썸네일 끝 -->
	
 	<%-- <c:if test="${!empty event.event_filename}">
		<div class="file-item">
			<img src="imageView.do?event_num=${event.event_num}" style="max-width:500px">
	</div>
	</c:if> --%>
 	<div class="content-item" align="center">
 		<p id="content" style="font-family: 'Gowun Dodum', sans-serif;">${event.event_content}</p>
 	</div>
	<!-- 게시글 내용 끝 -->
 	<!-- SNS 공유하기 버튼 시작 -->
	<div align="right">
		<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">　　　</a><!-- 페이스북 -->
		<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">　　　</a><!-- 카카오톡 -->
		<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">　　　</a><!-- 트위터 -->
	</div>
	<!-- SNS 공유 API 버튼 끝 -->
 	<!-- 버튼 시작 -->
 	<div class="icon-item" align="center">
	 	<a href="${pageContext.request.contextPath}/event/eventList.do">목록으로 돌아가기</a>
	 	<c:if test="${user_auth==4}">
		 	<a href="${pageContext.request.contextPath}/event/eventUpdate.do?event_num=${event.event_num}">수정</a>
			<a href="${pageContext.request.contextPath}/event/eventDelete.do?event_num=${event.event_num}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
		</c:if>
 	</div>
 	<!-- 버튼 끝 -->
 	
 	<!-- 댓글 시작 -->
 	<hr size="1" width="100%" noshade="noshade">
 	<span class="comm-title">댓글 ${count}</span>
	<div id="comment_div">
		<form id="comm_form">
			<input type="hidden" name="event_num" value="${event.event_num }" id="event_num">
			<input type="hidden" name="mem_num" value="${user_num }" id="mem_num">
			<textarea rows="3" cols="50" name="comm_content" id="comm_content" class="comm-content" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"
				<c:if test="${empty user_num }">disabled="disabled"</c:if>
				><c:if test="${empty user_num }">로그인 해야 작성할 수 있습니다.</c:if></textarea>
			<c:if test="${!empty user_num }">
			<div id="comm_first">
			<span class="letter-count">300/300</span>
			</div>
			<div id="comm_second" class="align-right">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음 글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif">
	</div>
 	
 	
 	
 	
 	
 	
 </div>
 </div>