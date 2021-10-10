<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.name-item{
	align-items: center;
}
</style>
<div class="main-container"> 
 <div class="container">
 	<div class="name-item" align="center">
 	<h2>공지사항</h2>
 	</div>
 	<div class="link-container">
 		<c:if test="${count==0}">
 		<div class="link-item">출력할 내용이 없습니다</div>
 		</c:if>
 		<c:if test="${count>0}">
 		<center>
 		<c:forEach var="notice" items="${list}">
 		<div class="link-item" onclick="location.href='notice/noticeDetail.do?notice_num=${notice.notice_num}'">
 			<h3>${notice.notice_num}.${notice.notice_title}</h3>
 			<span>작성일 : ${notice.notice_reg_date}</span><br>
 			<span>조회수 : ${notice.notice_hits}</span>
 		</div>
 		</c:forEach>
		<center>
 		</c:if>
 	</div>
 </div>
 </div>
 
