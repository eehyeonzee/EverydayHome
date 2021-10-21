<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>


<div class="container">
	<h2>장바구니 주문</h2>
	<!-- 상품정보 -->
	<!-- 주문 상품수대로 for문 나오게 정보 들어가게 -->
	<div class="item">
	<table class="table">
   		 <thead class="thead-light">
		    <tr>
		      <th>#</th>
		      <th>제품명</th>
		      <th>제품가격</th>
		      <th>주문수량</th>
		      <th>합계</th>
		    </tr>
	  	</thead>
 		 <tbody>
   			 <c:forEach var="cartVO" items="${cartVO}" varStatus="status">
		        <tr>
		            <th>${status.count}</th>
		            <td>${cartVO.prod_name}</td>
		            <td>${cartVO.prod_price}</td>
		            <td>${cartVO.cart_quan}</td>
		            <td>${cartVO.money}</td>
		        </tr>
 		    </c:forEach>
  		 </tbody>
    	 <tfoot>
    		<tr>
        		<td colspan="4"></td>
        		<td>${totalPrice}</td>
   			</tr>
  		 </tfoot>
	</table>
	<!-- 상품정보 끝 -->
	<!-- 배송-사용자정보-주문버튼-->
	<div class="item">
	<!-- 사용자정보 폼 -->
	<div class="memberInfo">
		<ul>
			<li> 주문자 정보 </li> <!-- 수정안되게하기 뭔가 수정할 수 잇는 척 -->
			<li>이름 : <input type="text" name="mem_name" value="${memberVO.mem_name}"></li>
			<li>이메일 : <input type="text" name="email_name" value="${memberVO.email}"></li>
			<li>연락처 : <input type="text" name="phone_name" value="${memberVO.phone}"></li>
		</ul>
	</div>
	<!-- 사용자 정보 폼 끝 -->
	<!-- 배송정보 폼 -->
	<form action="cartOrder.do" method="post">
	<div class="ShippingInfo">
		<ul>
			<li> 수령인 정보</li>
			<li>받는 사람 <input type="text" name="Receiver_name" value="${memberVO.mem_name}"> </li>
			<li>연락처 <input type="text" name="Receiver_phone" value="${memberVO.phone}"> </li>
			<li>주소 <input type="text" name="order_zipcode" value="${memberVO.zipcode}"> </li>
			<li>주소1 <input type="text" name="order_address1" value="${memberVO.address1}"> </li>
			<li>주소2 <input type="text" name="order_address2" value="${memberVO.address2}"> </li>
		</ul>
	</div>
	<!-- 배송정보 폼 긑 -->
	<!-- 배송 - 사용자정보 폼 -->
	<!-- 배열로 cart_num을 넘겨줌 -->
	<c:forEach var="cartVO" items="${cartVO}">
    <input type="hidden" name="cart_num" value="${cartVO.cart_num}" />
	</c:forEach>
	<input type="hidden" name="pay_price" value="${totalPrice}">
	
	<div class="orderInfo">결제금액 ${cart.totalPrice}</div>
    <button type="submit" class="btn btn-info">주문하기</button>
    <!-- 결제 api연동 -->
	</form>
	</div>
	</div>
</div>

<!-- 필요한거 목록 장바구니넘버, 멤버정보 , 총 카트 비용 계산, -->