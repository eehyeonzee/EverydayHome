<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<div class = "container">
	<h2>상품 등록</h2>
	<form:form id = "productRegister" action = "storeRegister.do" modelAttribute = "storeVO">
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
				<label for = "selec_product">상품선택1</label>
				<form:input path = "selec_product" />
				<form:errors path = "selec_product" cssClass = "error-color" />
				<input type = "button" class = "selec_product_plus" value = "+">
				<input type = "button" class = "selec_product_minus" value = "-">
			</li>
			<li>
				<label for = "prod_option1">상품옵션1</label>
				<form:input path = "prod_option1" />
				<form:errors path = "prod_option1" cssClass = "error-color" />
				<input type = "button" class = "selec_product_plus" value = "+">
				<input type = "button" class = "selec_product_minus" value = "-">
			</li>
			<li>
				<label for = "add_product">추가 상품</label>
				<form:input path = "add_product" />
				<form:errors path = "add_product" cssClass = "error-color" />
			</li>
			<li>
				<label for = "thumbnail_img">썸네일 이미지</label>
				<input type = "file" id = "thumbnail_img" accept = "image/gif,image/png,image/jpeg">
				<form:errors path = "thumbnail_img" cssClass = "error-color" />
				<form:hidden path="thumbnail_filename" />
			</li>
			<li>
				<label for = "prod_content">상품 내용</label>
				<form:textarea path = "prod_content" />
				<form:errors path = "prod_content" cssClass = "error-color" />
			</li>
			<li>
				<label for = "prod_img">상품 이미지</label>
				<input type = "file" id = "prod_img" accept = "image/gif,image/png,image/jpeg">
				<form:errors path = "prod_img" cssClass = "error-color" />
				<form:hidden path = "prod_filename" />
			</li>
		</ul>
		<div class = "align-center">
			<form:button>전송</form:button>
			<input type = "button" value = "홈으로" onclick = "location.href='${pageContext.request.contextPath}/store/storeMain.do'">
		</div>
	</form:form>
</div>