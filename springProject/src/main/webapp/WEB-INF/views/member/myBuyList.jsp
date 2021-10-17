<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/member/common/myPageHeader.jsp" %>
<style>
.name-item{
	align-items: center;
}
.cart-container{
width:1136px;
margin : 0 auto;
}
.link-item{
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
<div class="container-fluid">
 <div class="main-container">
 	<div class="name-item">
 	<h2 style="font-family: 'Gowun Dodum', sans-serif;">리뷰목록</h2>
 	</div>
 	<div class="cart-container">
 	<c:if test="${count==0}">
 		<div class="link-item" style="font-family: 'Gowun Dodum', sans-serif;">구매한 내역이 없습니다.</div>
 	</c:if>
 	<c:if test="${count>0}">
 		<c:forEach var="list" items="${list}" varStatus="n">
 		<form:form id="${n.index}" action="reviewCheck.do" modelAttribute="reviewVO" method="post">
 		<div class="link-item" onclick="#">
 		<div class="title">${list.buis_name}</div><br>
 		<div class="title">${list.prod_name}</div>
 		<input type="hidden" name="prod_num"value="${list.prod_num}"/>
 		<div class="reg_date">${list.prod_price}</div>
 		<div class="reg_date"><form:button>리뷰작성</form:button></div>
 		</div>
 		</form:form>
 		</c:forEach>
 	</c:if>
	</div>

</div>
</div>
