<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 내용 시작 -->
<div class = "container">
	<h2>상품 등록</h2>
	<form:form id = "productRegister" action = "storeRegister.do" modelAttribute = "storeVO"
	           enctype="multipart/form-data">
		<input type = "hidden" value = "${user_num}">
		<ul>
			<li>
				<label for = "prod_name">상품명</label>
				<form:input path = "prod_name"/>
				<form:errors path = "prod_name" cssClass = "error-color" />
			</li>
			<li>
				<label for = "prod_keyword">상품 키워드</label>
				<form:input path = "prod_keyword" />
				<form:errors path = "prod_keyword" cssClass = "error-color" />
			</li>
			<li>
				<label for = "prod_cate">카테고리</label>
				<form:select path="prod_cate">
					<form:option value = "furniture">가구</form:option>
					<form:option value = "fabric">패브릭</form:option>
					<form:option value = "lamp">조명</form:option>
					<form:option value = "electronic">가전</form:option>
					<form:option value = "kitchen">주방용품</form:option>
					<form:option value = "deco">데코/취미</form:option>
					<form:option value = "storage">수납/정리</form:option>
					<form:option value = "daily_necessities">생활용품</form:option>
					<form:option value = "necessities">생필품</form:option>
					<form:option value = "tool_diy">공구/DIY</form:option>
					<form:option value = "interior">인테리어시공</form:option>
					<form:option value = "pet">반려동물</form:option>
					<form:option value = "camping">캠핑용품</form:option>
					<form:option value = "indoor">실내운동</form:option>
					<form:option value = "baby_pro">유아/아동</form:option>
					<form:option value = "rental">렌탈</form:option>
				</form:select>
			</li>
			<li>
				<label for = "prod_price">가격</label>
				<form:input path = "prod_price"/>
				<form:errors path = "prod_price" cssClass = "error-color" />
			</li>
			<li>
				<label for = "delive_price">배송비</label>
				<form:input path = "delive_price" />
				<form:errors path = "delive_price" cssClass = "error-color" />
			</li>
			<li>
				<label for = "delive_type">배송방법</label>
				<form:input path = "delive_type" />
				<form:errors path = "delive_type" cssClass = "error-color" />
			</li>
			<li>
				<label for = "prod_quan">상품 수량</label>
				<form:input path = "prod_quan" />
				<form:errors path = "prod_quan" cssClass = "error-color" />
			</li>
			<li>
				<label for = "selec_product">상품선택</label>
				<form:input path = "selec_product" />
				<form:errors path = "selec_product" cssClass = "error-color" />
			</li>
			<li>
				<label for = "prod_option1">상품옵션1</label>
				<form:input path = "prod_option1" />
				<form:errors path = "prod_option1" cssClass = "error-color" />
			</li>
			<li>
				<label for = "prod_option2">상품옵션2</label>
				<form:input path = "prod_option2" />
				<form:errors path = "prod_option2" cssClass = "error-color" />
			</li>
			<li>
				<label for = "add_product">추가 상품</label>
				<form:input path = "add_product" />
				<form:errors path = "add_product" cssClass = "error-color" />
			</li>
			<li>
				<label for = "upload1">썸네일 이미지</label>
				<input type = "file" name = "upload1" id = "upload1" accept = "image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for = "prod_content">상품 내용</label>
				<form:textarea path = "prod_content" />
				<form:errors path = "prod_content" cssClass = "error-color" />
			</li>
			<li>
				<label for = "upload2">상품 이미지</label>
				<input type = "file" name = "upload2" id = "upload2" accept = "image/gif,image/png,image/jpeg">
			</li>
		</ul>
		<div class = "align-center">
			<input type = "submit" value = "상품 등록" id = "regist">
			<script type = "text/javascript">
				var regist = document.getElementById('regist');
				regist.onclick=function() {
					var choice = confirm('등록 하시겠습니까?');
					if(choice) {
						return;
					}else {
						return false;
					}
				};
			</script>
			<input type = "button" value = "홈으로" onclick = "location.href='${pageContext.request.contextPath}/store/storeMain.do'">
		</div>
	</form:form>
</div>