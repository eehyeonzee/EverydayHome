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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>이메일 문의 하기</h2>
	<hr size="1" noshade width="100%">
	<form:form action="serviceBoardInsert.do" modelAttribute="serviceBoardVO" enctype="multipart/form-data">
		<ul>
			<li><!-- 문의 유형 선택 카테고리 -->
				<label for="service_keyword"></label>
				<select name="service_keyword" id="service_keyword">
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
			</li><!-- 문의 유형 선택 카테고리 끝-->
			<li>
				<label for="service_title">제목</label>
				<form:input path="service_title"/>
				<form:errors path="service_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_nickname">닉네임</label>
				<c:if test="${empty user_num }">
					<input type="text" class="form-control" name="service_nickname" id="service_nickname" maxlength="10" placeholder="닉네임을 입력하세요"> 
				</c:if>
				<c:if test="${!empty user_num }">
					<input type="text" class="form-control" name="service_nickname" id="service_nickname" maxlength="12" value="${user_nickname }" readonly>
				</c:if>
				<form:errors path="service_nickname" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_email">이메일</label>
					<input type="text" class="form-control" name="service_email" id="service_email" maxlength="30" placeholder="이메일을 입력하세요"> 
				<form:errors path="service_email" cssClass="error-color"/>
			</li>
			<li>
				<label for="service_content">내용</label>
				<form:textarea path="service_content"/>
				<form:errors path="service_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">이미지 파일</label>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
			</li>
		</ul>

		<!-- 버튼 -->
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='qnaList.do'">
		</div>
		</form:form>
</div>
