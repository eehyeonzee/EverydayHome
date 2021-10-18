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

<!DOCTYPE html>
<html>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Qna 자주 묻는 질문 목록</title>
<script type="text/javascript">
 	$(function() {
 		
 		$('.slideToggle').click(function(){
 			$(this).parent().find('p').slideToggle("slow");
 		});
	});
         
</script>
</head>
<body>
<div class="container"> 
 <div class="main-container">
	<div class="name-item" align="center">
	   <h2 style="font-family: 'Gowun Dodum', sans-serif;">고객센터</h2>
	  </div>
	   <div class="align-left">
	   <c:if test="${user_auth != 4}">
	      <input type="button" value="이메일 문의하기" onclick="location.href='serviceBoardInsert.do'">
	   </c:if>
	   </div>
	   <div class="align-right">
	   <c:if test="${user_auth == 4 }"> 
		   	<input type="button" value="자주묻는 질문 list" onclick="location.href='qnaServiceList.do'">
	   		<input type="button" value="이메일 문의 list" onclick="location.href='serviceBoardList.do'"><br><br>
		</c:if> 
	   </div>
	   <br><br>
	   
	   <c:if test="${count==0 }">
	   <div class="result-display">출력할 내용이 없습니다.</div>
	   </c:if>
	   <c:if test="${count > 0 }">
	   <c:forEach var="qna" items="${list}" varStatus="class_count">
	   <div>
	   		 <button class="slideToggle">${qna.qna_content }</button>
	         <p style="display:none;">${qna.qna_reply }</p>
	   </div>
	   </c:forEach>
		</c:if>
	   <div class="align-center">${pagingHtml}</div>
	</div>
 </div>
	
	</body>

</html>