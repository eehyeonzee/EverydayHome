<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.name-item{
	align-items: center;
}
.link-container{
width:1136px;
margin : 0 auto;
}
.link-tiem{
margin: 0 auto;
width : 100%;
}
.container{
margin : 0 auto;
width:1138px;
}
.link-item{
	border-bottom : 1px solid #dbdbdb;
	width : 900px;
	margin : 0 auto;
}
.title{
	font-size:18px;
	weight:800;
	padding: 10px 10px 10px 10px;
	text-align:left;

}
.reg_date{
	font-size:15px;
	padding: 0px 10px 20px 10px;
	text-align:right;
}
.paging {
	text-align:center;
	padding : 50px;
	margin-top : 40px;
}
h2{
	text-align:left;
	margin : 70px 0px 50px 130px;
}
.write-button{
	text-align: right;
	margin : 40px 100px 0px 30px;
}
</style>
<div class="container"> 
 <div class="main-container">
 	<div class="name-item" align="center">
 	<h2>공지사항</h2>
 	</div>
 	<div class="link-container">
 		<c:if test="${count==0}">
 		<div class="link-item">출력할 내용이 없습니다</div>
 		<div class="write-button">
 		<a href="${pageContext.request.contextPath}/notice/noticeWrite.do">공지 쓰기</a>
 		</div>
 		</c:if>
 		<c:if test="${count>0}">
 		<c:forEach var="notice" items="${list}">
 		<div class="link-item" onclick="location.href='noticeDetail.do?notice_num=${notice.notice_num}'">
 			<div class="title">
 			<p>${notice.notice_title}</p>
 			</div>
 			<div class="reg_date">
 			<span>${notice.notice_reg_date}</span>
 			</div>
 		</div>
 		</c:forEach>
 		</c:if>
 		<div class="paging">
 			<span>${pagingHtml}</span>
 		</div>
 		 <div class="write-button"> 		
 		<a href="${pageContext.request.contextPath}/notice/noticeWrite.do">공지 쓰기</a>
 		</div>
 	</div>
 </div>
 </div>
 
