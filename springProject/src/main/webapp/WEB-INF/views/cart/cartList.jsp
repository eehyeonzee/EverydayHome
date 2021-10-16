<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <div class="main-container">
 	<div class="name-item" align="center">
 	<h2 style="font-family: 'Gowun Dodum', sans-serif;">장바구니</h2>
 	</div>
 	<div class="cart-container">
 		<c:if test="${map.count==0}">
 		<div class="link-item" style="font-family: 'Gowun Dodum', sans-serif;">장바구니에 아무것도 없습니다.</div>
 		</c:if>
 		<c:if test="${map.count>0}">
		<form name="form1" id="form1" method="post" action="/cart/cartUpdate.do">
		<c:forEach var="row" items="${map.list}" varStatus="i">
			<!-- 상세페이지링크연결 -->
			<div class="link-item" onclick="location.href='#'"> 
 			<div class="title">
 			<p style="font-family: 'Gowun Dodum', sans-serif;">${row.prod_name}</p>
 			</div>
            <input type="number" style="width: 40px" name="amount" value="${row.cart_quan}" min="1">
            <input type="hidden" name="productId" value="${row.prod_num}">
 			<div class="reg_date">
 			<span style="font-family: 'Gowun Dodum', sans-serif;">
 			 <fmt:formatNumber pattern="###,###,###" value="${row.prod_price}"/>
 			 </span>
 			</div>
 		</div>
		</c:forEach>
		<hr>
		 장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
         배송료 : ${map.fee}<br>
         전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
		<input type="hidden" name="count" value="${map.count}">
		<button type="submit" id="btnUpdate">수정</button>
		</form>
 		</c:if>
 	</div>
 </div>
