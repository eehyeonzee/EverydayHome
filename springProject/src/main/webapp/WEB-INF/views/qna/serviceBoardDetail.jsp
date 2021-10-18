<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- 
 * 작성일 : 2021. 10. 11.
 * 작성자 : 나윤경
 * 설명 : 고객센터 게시판 디테일
 * 수정일 : 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//이메일 전송 ajax 작성
$(function() {
	$("#email_send_button").click(function(){	// 인증번호전송 버튼 클릭시
		
		var service_email = $("#service_email").val();	// 입력 이메일
		
		// 이메일 전송 ajax 작성
		$.ajax({
			type : "GET",
			url:"mailCheck.do?service_email=" + service_email,
			success:function(data){
				console.log("data : " + data);			// 나중에 삭제꼭하자!!!!
			},
			error : function(){
				alert("네트워크 오류 발생!!");
			}
		});
		
	});	
});	
	

</script>
<title>고객센터 게시판 디테일</title>
</head>
<body>

	<h2>${serviceboard.service_title }</h2>
	<ul>
		<li>글번호: ${serviceboard.service_num }</li>
		<li>작성자 이메일: <input type="text" id="service_email" value="${serviceboard.service_email }" readonly>
		</li>
		<li>문의 유형: ${serviceboard.service_keyword }</li>
		<li>제목: ${serviceboard.service_title }</li>
		<li>
			
		</li>
	</ul>
			
	<hr width="100%" size="1" noshade="noshade">
	<p>
		문의내용: ${serviceboard.service_content }<br>
	</p>
	<hr size="1" width="100%">
	<c:if test="${!empty serviceboard.service_filename}">
	<div class="align-center">
		<img src="imageView.do?service_num=${serviceboard.service_num }" style="max-width:500px">
	</div>
	</c:if>
	<input type="text" id="service_reply" value="${serviceboard.service_content }" readonly>
	<input type="submit" id="email_send_button" value="이메일전송">
	
	
	<div class="align-center">
		<input type="button" value="목록" onclick="location.href='serviceBoardList.do'">
	</div>
</body>
</html>