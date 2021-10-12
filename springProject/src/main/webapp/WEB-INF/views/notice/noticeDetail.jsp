<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 	<div class="title-item" align="center">
 	<h2>${notice.notice_title}</h2>
 	</div>
 	<div class="date-item" align="center">
 	<p>${notice.notice_reg_date}</p>
 	</div>
 	<div class="hits-item" align="center">
 	<p>hits : ${notice.notice_hits} 작성자 : 관리자</p>
 	</div>
 	<div class="content-item" align="center">
 	<span>${notice.notice_content}</span>
 	</div>
 	 <div class="icon-item" align="center">
 	<a href="${pageContext.request.contextPath}/notice/noticeList.do">목록으로 돌아가기</a>
 	<%-- <c:if test="${user_auth}!=3"> --%>
 	<a href="${pageContext.request.contextPath}/notice/noticeUpdate.do?notice_num=${notice.notice_num}">수정</a>
	<a href="${pageContext.request.contextPath}/notice/noticeDelete.do?notice_num=${notice.notice_num}">삭제</a>
	<%-- </c:if> --%>
 	</div>
 	</div>
 </div>
