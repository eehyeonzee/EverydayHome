<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 9.
 * 작성자 : 나윤경
 * 설명 : 고객센터 질문하기 폼
 * 수정일 : 
--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class = "container-fluid contents-wrap" style = "width:95%">
	<div class="text-center col-sm-30 my-5">
	<hr noshade="noshade" size="2">
		<div align = "left">
			<h2 class="admin-page-h2">이메일 문의</h2>
		</div>
		<div align="center" class = "container-fluid" style = "width:900px; border: 1px solid #d2f1f7; font-family: 'Gowun Dodum', sans-serif; ">
			<div class="text-center col-sm-12 my-5">
				<form:form action="serviceBoardInsert.do" modelAttribute="serviceBoardVO" enctype="multipart/form-data">
					<div style="flex: auto;" class="input-group-prepend col-xs-2">
						<label class="input-group-text" for="service_keyword"></label>
						<select  class="custom-select form-select-lg col-sm-3" name="service_keyword" id="service_keyword">
							<option value="">유형</option>
							<option value="회원 정보 문의">회원 정보 문의</option>
							<option value="쿠폰/포인트 문의">쿠폰/포인트 문의</option>
							<option value="주문/결제 관련 문의">주문/결제 관련 문의</option>
							<option value="취소/환불 관련 문의">취소/환불 관련 문의</option>
							<option value="배송 관련 문의">배송 관련 문의</option>
							<option value="주문 전 상품 정보 문의">주문 전 상품 정보 문의</option>
							<option value="서비스 개선 제안">서비스 개선 제안</option>
							<option value="시스템 오류 제보">시스템 오류 제보</option>
							<option value="불편 신고">불편 신고</option>
							<option value="기타 문의">기타 문의</option>
						</select>
						<form:errors path="service_keyword" cssClass="error-color"/>
					</div>
					<div style="display: inline-block;"><hr size="1" noshade="noshade"></div>
					<div class = "form-group row">
						<label class = "col-sm-3 col-form-label" for="service_title">제목</label>
						<form:input path="service_title"/>
						<form:errors path="service_title" cssClass="error-color"/>
					</div>
					<div class = "form-group row">
							<label class = "col-sm-3 col-form-label" for="service_nickname">닉네임</label>
							<c:if test="${empty user_num }">
								<input type="text" class="form-control" name="service_nickname" id="service_nickname" maxlength="10" placeholder="닉네임을 입력하세요"> 
							</c:if>
							<c:if test="${!empty user_num }">
								<input type="text" class="form-control" name="service_nickname" id="service_nickname" maxlength="12" value="${user_nickname }" readonly>
							</c:if>
							<form:errors path="service_nickname" cssClass="error-color"/>
					</div>
					<div class = "form-group row">		
							<label class = "col-sm-3 col-form-label" for="service_email">이메일</label>
							<input type="text" class="form-control" name="service_email" id="service_email" maxlength="30" placeholder="이메일을 입력하세요"> 
							<form:errors path="service_email" cssClass="error-color"/>
					</div>
					<div class = "form-group row">
							<label class = "col-sm-3 col-form-label" for="service_content">내용</label>
							<form:textarea path="service_content"/>
							<form:errors path="service_content" cssClass="error-color"/>
					</div>
					<div class = "form-group row">
						<label class = "col-sm-3 col-form-label" for="upload">이미지 파일</label>
						<input class = "btn btn-outline-dark" type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
					</div>
			
					<!-- 버튼 -->
					<div class="align-center">
						<form:button class = "btn btn-outline-dark">전송</form:button>
						<input class = "btn btn-outline-dark" type="button" value="목록" onclick="location.href='qnaList.do'">
					</div>
					</form:form>
			</div>
		</div>
	</div>
</div>
