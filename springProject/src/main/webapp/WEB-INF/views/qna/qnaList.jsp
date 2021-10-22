<%@page import="org.hibernate.validator.constraints.Length"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 
 * 작성일 : 2021. 10. 11.
 * 작성자 : 나윤경
 * 설명 : 
 * 수정일 : 
--%>
<style>
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
width: 99%; 
height: 286px; 
background-color: #dbf1ff;
position: relative;
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
	margin : 50px 0px 50px 105px;
}
.write-button{
	text-align: right;
	margin : 40px 100px 0px 30px;
}
.main-container{
	margin : 0 auto;
	width: 1177px; 
	
}
.qna-left-title{
	position: absolute;
	text-align: center;
}
.qna-right-title{
	position: absolute;
	top: 70px;
	right: 100px;
	text-align: center;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 	$(function() {
 		
 		$('.button-area button').click(function(){
 			$(this).parent().find('p').slideToggle("slow");
 		});
	});
         
</script>
<div class="main-container">
	<div class="container"> 
		<div class="qna-left-title">
			<h2 class="admin-page-h2">고객센터</h2>
			<div align="left">
			<c:if test="${user_auth != 4}">
				<input class = "btn btn-outline-dark" type="button" value="이메일 문의하기" onclick="location.href='serviceBoardInsert.do'">
			</c:if>
			</div>
		</div>
		
		<div class="qna-right-title">
			<div align="right">
			<c:if test="${user_auth == 4 }"> 
				<input class = "btn btn-outline-dark" type="button" value="자주묻는 질문 설정" onclick="location.href='qnaServiceList.do'">
				<input class = "btn btn-outline-dark" type="button" value="이메일 문의 내역" onclick="location.href='serviceBoardList.do'"><br><br>
			</c:if> 
			</div>  
		</div>
	
		   
	</div>
	<c:if test="${count==0 }">
	   <div class="result-display">출력할 내용이 없습니다.</div>
	</c:if>
	   <c:if test="${count > 0 }">
		   <c:forEach var="qna" items="${list}" varStatus="class_count">
		   <div class="button-area">
	   		 <button class = "btn btn-outline-dark" >${qna.qna_content }</button>
	         <p style="display:none;">${qna.qna_reply }</p>
		   </div>
		   </c:forEach>
		</c:if>
		<div class="align-center">${pagingHtml}</div>
</div>