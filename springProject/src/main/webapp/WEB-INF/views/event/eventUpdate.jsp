<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<style>
.container{
width: 900px;
margin : 0 auto;
}
h2{
padding : 10px 0px 20px 8px;
border-bottom : 1px solid #dbdbdb;
}
.li-title input{
width : 700px;
margin : 10px 0px 10px 15px;
}
.li-title{
padding : 20px 0px 10px 8px;
}
.li-content{
padding : 10px 0px 0px 8px;
}
.li-content label{
	text-align: left;
}
.submit-button{
padding : 20px 0px 20px 0px;
border-bottom : 1px solid #dbdbdb;
text-align: center;
}
textarea{
width : 750px;
height : 300px;
resize:none;
margin : 20px 0px 0px 0px;
}
.main-container{
margin: 0 auto;
text-align: center;
}
</style>
    <div class="container">
    <div class="main-container">
	<h2>이벤트 수정</h2>
	<form:form action="eventUpdate.do" modelAttribute="eventVO">
	<form:hidden path="event_num"/>
		<ul>
			<li class="li-title">
				<label for="event_title">제목</label>
				<form:input path="event_title"/>
				<form:errors path="event_title" cssClass="error-color"/>
			</li>
			<li class="li-content">
				<label for="event_content">내용</label><br>
				<form:textarea path="event_content"/>
				<form:errors path="event_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">이미지 파일</label>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty eventVO.event_filename}">
					<br>
					<span id="file_detail">(${eventVO.event_filename}) 파일이 등록되어 있습니다.
					다시 업로드하면 기존 파일은 삭제됩니다.</span>
					<input type="button" value="파일삭제" id="file_del">
					<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
					<script type="text/javascript">
						$(function() {
							$('#file_del').click(function() {
								var choice = confirm('삭제하시겠습니까?');
								if(choice) { // true
									$.ajax({
										data: {event_num:${eventVO.event_num}},
										type: 'post',
										url: 'deleteFile.do',
										dataType: 'json',
										cache: false,
										timeout: 30000,
										success: function(param) {
											if(param.result == 'wrongauth') {
												alert('올바르지않은권한!');
											}else if(param.result == 'success') {
												$('#file_detail').hide();
											}else {
												alert('파일삭제 오류 발생');
											}
										},
										error: function() {
											alert('네트워크 오류 발생');
										}
									});
								}
							});
						});
					</script>
				</c:if>
			</li>

		</ul>
		<div class="submit-button">
			<input type="submit" value="등록">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/event/eventList.do'">
		</div>
	</form:form>
	</div>
</div>