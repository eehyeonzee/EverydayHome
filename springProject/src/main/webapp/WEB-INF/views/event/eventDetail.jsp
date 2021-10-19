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
<!-- 댓글 시작 -->
<script type="text/javascript">

	$(function(){
		var currentPage;
		var count;
		var rowCount;
		//댓글 목록
		function selectData(pageNum,event_num){
			currentPage = pageNum;
			
			if(pageNum == 1){
				//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
				$('#output').empty();
			}
			
			//로딩 이미지 노출
			$('#loading').show();
			
			$.ajax({
				type:'post',
				data:{pageNum:pageNum,event_num:event_num},
				url:'listComment.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('#loading').hide();
					count = param.count;
					rowCount = param.rowCount;
					
					$(param.list).each(function(index,item){
						var output = '<div class="item">';
						output += '<h4>' + item.id + '</h4>';
						output += '<div class="sub-item">';
						output +='   <p>' + item.re_content.replace(/</gi,'&lt;').replace(/>/gi,'&gt;') + '</p>';
						output += item.re_date;
						if($('#mem_num').val()==item.mem_num){
							//로그인한 회원 번호가 댓글 작성자 회원 번호와 같으면
							output += ' <input type="button" data-num="'+item.re_num+'" data-mem="'+item.mem_num+'" value="수정" class="modify-btn">';
							output += ' <input type="button" data-num="'+item.re_num+'" data-mem="'+item.mem_num+'" value="삭제" class="delete-btn">';
						}
						output += '  <hr size="1" noshade>';
						output += '</div>';
						output += '</div>';
						
						//문서 객체에 추가
						$('#output').append(output);						
					});//end of each
					
					//paging button 처리
					if(currentPage>=Math.ceil(count/rowCount)){
						//다음 페이지가 없음
						$('.paging-button').hide();
					}else{
						//다음 페이지가 존재
						$('.paging-button').show();
					}
					
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
			
		}
		
		//다음 댓글 보기 버튼 클릭시 데이터 추가
		$('.paging-button input').click(function(){
			var pageNum = currentPage + 1;
			selectData(pageNum,$('#event_num').val());
		});
		
		
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
		$(document).on('keyup','textarea',function(){
			//남은 글자수를 구함
			var inputLength = $(this).val().length;
			
			if(inputLength>300){//300자를 넘어선 경우
				$(this).val($(this).val().substring(0,300));
			}else{//300자 이하인 경우
				var remain = 300 - inputLength;
				remain += '/300';
				if($(this).attr('nickname') == 'comm_content'){
					//등록폼 글자수
					$('#re_first .letter-count').text(remain);
				}else{
					//수정폼 글자수
					$('#mre_first .letter-count').text(remain);
				}
			}
		});
		//댓글 수정 버튼 클릭시 수정폼 노출
		$(document).on('click','.modify-btn',function(){
			//댓글 글번호
			var re_num = $(this).attr('data-num');
			//작성자 회원 번호
			var mem_num = $(this).attr('data-mem');
			//댓글 내용
			var content = $(this).parent().find('p').html().replace(/<br>/gi,'\n');
			
			//댓글 수정폼 UI
			var modifyUI = '<form id="mcomm_form">';
			   modifyUI += '  <input type="hidden" name="comm_num" id="mcomm_num" value="'+comm_num+'">';
			   modifyUI += '  <input type="hidden" name="mem_num" id="mmem_num" value="'+mem_num+'">';
			   modifyUI += '  <textarea rows="3" cols="50" name="comm_content" id="mcomm_content" class="commp-content">'+content+'</textarea>';
			   modifyUI += '  <div id="mcomm_first"><span class="letter-count">300/300</span></div>';	
			   modifyUI += '  <div id="mcomm_second" class="align-right">';
			   modifyUI += '     <input type="submit" value="수정">';
			   modifyUI += '     <input type="button" value="취소" class="comm-reset">';
			   modifyUI += '  </div>';
			   modifyUI += '  <hr size="1" noshade width="90%">';
			   modifyUI += '</form>';
			   
			//이전에 이미 수정하는 댓글이 있을 경우 수정버튼을 클릭하면
			//숨김 sub-item을 환원시키고 수정폼을 최기화함
			initModifyForm();
			
			//지금 클릭해서 수정하고자 하는 데이터는 감추기
			//수정버튼을 감싸고 있는 div
			$(this).parent().hide();
			
			//수정폼을 수정하고자하는 데이터가 있는 div에 노출
			$(this).parents('.item').append(modifyUI);
			
			//입력한 글자수 셋팅
			var inputLength = $('#mcomm_content').val().length;
			var remain = 300 - inputLength;
			remain += '/300';
			
			//문서 객체에 반영
			$('#mcomm_first .letter-count').text(remain);		
		});
		//수정폼에서 취소 버튼 클릭시 수정폼 초기화
		$(document).on('click','.re-reset',function(){
			initModifyForm();
		});
		//댓글 수정 폼 초기화
		function initModifyForm(){
			$('.sub-item').show();
			$('#mcomm_form').remove();
		}
		/*
		//댓글 수정
		$(document).on("submit","#mcomm_form", function(event){
			if($("#mcomm_content").val().trim() == ""){
				alert("내용을 입력하세요!");
				$("#comm_content").val("").focus();
				return false;
			}
			
			// 폼에 입력한 데이터 변환
			var form_data = $(this).serialize();
					
			// 댓글 수정
			$.ajax({
				type:"post",
				url:"updateComment.do",
				data: form_data,
				dataType:"json",
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == "logout"){
						alert("로그인해야 수정할 수 있습니다.")
					}else if(param.result == "success"){
						// 전송을 누르면 전송되지 않고 그대로 화면에 읽어와서 표시되도록
						// 부모로 올라가서 p태그를 찾아서 내용을 넣어준다. 그리고 html 태그 불허용을 했기때문에 바꾸는 작업처리
						$('#mcomm_form').parent().find('p').html($('#mcomm_content').val().replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\n/gi,'<br>'));
						// 수정폼 삭제 및 초기화
						initModifyForm();
					}else if(param.result == "wrongAccess"){
						alert("타인의 글을 수정할 수 없습니다.");
					}else{
						alert("네트워크 오류 발생");
					}
				},
				error : function(request,status,error){		// 에러메세지 반환
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			// 기본 이벤트 제거하는 부분    이거는 꼭 넣어주어야 한다. 이게 빠지면 서밋이 되버림
			event.preventDefault();
		});
		*/
		
		//댓글 삭제
		$(document).on('click','.delete-btn',function(){
			//댓글 번호
			var comm_num = $(this).attr('data-num');
			//작성자 회원 번호
			var mem_num = $(this).attr('data-mem');
			
			$.ajax({
				type:'post',
				url:'deleteComment.do',
				data:{comm_num:comm_num,mem_num:mem_num},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인해야 삭제할 수 있습니다.');
					}else if(param.result == 'success'){
						alert('삭제 완료!');
						selectData(1,$('#event_num').val());
					}else if(param.result == 'wrongAccess'){
						alert('타인의 글을 삭제할 수 없습니다.');
					}else{
						alert('댓글 삭제시 오류 발생');
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
			
		});
		//초기 데이터(목록) 호출
		selectData(1,$('#event_num').val());
	});
</script>
<!-- 댓글 끝 -->
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