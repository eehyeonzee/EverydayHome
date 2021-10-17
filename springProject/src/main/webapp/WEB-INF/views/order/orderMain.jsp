<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<h2>주문/결제</h2>
<h3>주문자</h3>
<ul>
	<li>이름 <input type = "text" id = "name" value = "${memberVO.mem_name}"></li>
	<li>이메일 <input type = "email" id = "email" value = "${memberVO.email}"></li>
	<li>연락처 <input type = "text" id = "phone" value = "${memberVO.phone}"></li>
</ul>
<h3>배송지</h3>
<ul>
	<li>받는 사람 <input type = "text" id = "receiver_name"></li>
	<li>연락처 <input type = "text" id = "receiver_phone"></li>
	<li>주소 <input type = "text" id = "order_zipcode" value = "${memberVO.zipcode}"> 카카오 주소</li>
	<li><input type = "text" id = "order_address1" value = "${memberVO.address1}"></li>
	<li><input type = "text" id = "order_address2" value = "${memberVO.address2}"></li>
</ul>
<h3>상품 정보</h3>
<ul>
	<li></li>
</ul>