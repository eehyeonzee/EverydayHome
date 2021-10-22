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
<script type="text/javascript" src="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script type="text/javascript">
	$(function(){
		$('#sendEmailForm').submit(function(){
			if($('#service_reply').val().trim()==''){
				$('#service_reply').val('').focus();
				alert("내용을 입력해주세요!");
				return false;
			}
		});
	});
</script>
</head>
<body>
<div class="page-main">
	<div align = "left">
		<h2 class="admin-page-h2">${ serviceboard.service_title }</h2>
	</div>
	
	<ul>
		<li>글번호: ${serviceboard.service_num }</li>
		<li>작성자 이메일: ${serviceboard.service_email }</li>
		<li>문의 유형: ${serviceboard.service_keyword }</li>
		<li>제목: ${serviceboard.service_title }</li>
	</ul>
	<hr width="100%" size="1" noshade="noshade">
	<p>
		문의내용: ${serviceboard.service_content }<br>
	</p>
	<c:if test="${!empty serviceboard.service_filename}">
	<div class="align-center">
		<img src="imageView.do?service_num=${serviceboard.service_num }" style="max-width:500px">
	</div>
	</c:if>
	<hr size="1" width="100%">
	
	<%-- 폼 작성 부분 --%>
	
	<div align="center">
		<div class="text-center col-sm-12 my-5">
		<form id="sendEmailForm" action="sendEmail.do" method="Post">
			<div class = "form-group row">
				<label class = "col-sm-4 col-form-label" for="service_reply">답변 내용 작성 </label>
				<textarea rows="5" cols="30" name="service_reply" id="service_reply"></textarea>
			</div>	
				<input type="hidden" value="${serviceboard.service_email}" name="service_email" id="service_email">
			<div class = "form-group row">
				<div class = "text-center col-sm-12">
					<input class="btn btn-outline-dark" type="submit" id="email_send_button" value="이메일전송">&nbsp;&nbsp;
				<input class="btn btn-outline-dark" type="button" value="목록" onclick="location.href='serviceBoardList.do'">
				</div>
			</div>	
		</form>
		</div>
	</div>	
</div>
</body>
</html>