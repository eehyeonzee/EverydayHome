<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main-container"> 
 <div class="container">
 	<div class="name-item" align="center">
 	<h2>${notice.notice_title}</h2>
 	</div>
 	<div class="date-item" align="center">
 	<span>${notice.notice_reg_date}</span>
 	</div>
 	<div class="content-item" align="center">
 	<span>${notice.notice_content}</span>
 	</div>
 	 <div class="icon-item" align="center">
 	<a href="${pageContext.request.contextPath}/notice/noticeList.do">목록으로 돌아가기</a>
 	<a href="${pageContext.request.contextPath}/notice/noticeUpdate.do?notice_content=${notice.notice_num}"></a>
 	</div>
 	</div>
 </div>
