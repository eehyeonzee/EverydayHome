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
	<h2>글쓰기</h2>
	<form:form action="noticeWrite.do" modelAttribute="noticeVO">
		<ul>
			<li class="li-title">
				<label for="notice_title">제목</label>
				<form:input path="notice_title"/>
				<form:errors path="notice_title" cssClass="error-color"/>
			</li>
			<li class="li-content">
				<label for="notice_content">내용</label><br>
				<form:textarea path="notice_content"/>
				<form:errors path="notice_content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="submit-button">
			<input type="submit" value="등록">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">
		</div>
	</form:form>
	</div>
</div>