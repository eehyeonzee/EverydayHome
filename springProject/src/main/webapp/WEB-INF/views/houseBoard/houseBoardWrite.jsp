<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- 
 * 작성일 : 2021. 10. 10.
 * 작성자 : 이현지
 * 설명 : 집들이 게시판 글쓰기 폼
 * 수정일 : 
--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script>
	var ckeditor_config = {
		resize_enable: false,
		enterMode: CKEDITOR.ENTER_BR,
		shiftEnterMode: CKEDITOR.ENTER_P,
		filebrowserUploadUrl: "/common/ckUpload"
	};
</script>
<!-- 중앙 내용 시작 -->
<div class="page-main2">
	<h2>글쓰기</h2>
	<form:form id="register_form" action="write.do" modelAttribute="houseBoardVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<!-- 제목 시작 -->
			<li>
				<label for="house_title"></label>
				<form:input path="house_title" placeholder="제목을 입력하세요"/>
				<form:errors path="house_title" cssClass="error-color"/>
			</li>
			<!-- 제목 끝 -->
			<!-- 카테고리 시작 -->
			<li>
				<label for="house_area"></label>
				<select name="house_area" id="house_area">
					<option value="">평수</option>
					<option value="10평 미만">10평 미만</option>
					<option value="10평대">10평대</option>
					<option value="20평대">20평대</option>
					<option value="30평대">30평대</option>
					<option value="40평대">40평대</option>
					<option value="50평 이상">50평 이상</option>
				</select>
				<form:errors path="house_area" cssClass="error-color"/>
				<label for="house_type"></label>
				<select name="house_type" id="house_type">
					<option value="">주거형태</option>
					<option value="원룸&오피스텔">원룸&오피스텔</option>
					<option value="아파트">아파트</option>
					<option value="빌라&연립">빌라&연립</option>
					<option value="단독주택">단독주택</option>
					<option value="사무공간">사무공간</option>
					<option value="상업공간">상업공간</option>
				</select>
				<form:errors path="house_type" cssClass="error-color"/>
				<label for="house_style"></label>
				<select name="house_style" id="house_style">
					<option value="">스타일</option>
					<option value="모던">모던</option>
					<option value="북유럽">북유럽</option>
					<option value="빈티지">빈티지</option>
					<option value="내추럴">내추럴</option>
					<option value="프로방스&로맨틱">프로방스&로맨틱</option>
					<option value="클래식&앤틱">클래식&앤틱</option>
					<option value="한국&아시아">한국&아시아</option>
					<option value="유니크">유니크</option>
				</select>
				<form:errors path="house_style" cssClass="error-color"/>
			</li>
			<li>
				<label for="house_space"></label>
				<select name="house_space" id="house_space">
					<option value="">공간 (필수)</option>
					<option value="원룸">원룸</option>
					<option value="거실">거실</option>
					<option value="침실">침실</option>
					<option value="주방">주방</option>
					<option value="욕실">욕실</option>
					<option value="아이방">아이방</option>
					<option value="드레스룸">드레스룸</option>
					<option value="서재&작업실">서재&작업실</option>
					<option value="베란다">베란다</option>
					<option value="사무공간">사무공간</option>
					<option value="상업공간">상업공간</option>
					<option value="가구&소품">가구&소품</option>
					<option value="현관">현관</option>
					<option value="외관&기타">외관&기타</option>
				</select>
				<form:errors path="house_space" cssClass="error-color"/>
			</li>
			<!-- 카테고리 끝 -->
			<!-- 내용 시작 -->
			<li>
				<label for="house_content"></label>
				<form:textarea path="house_content" id="house_content" name="house_content"/>
				<script>
					CKEDITOR.replace("house_content", ckeditor_config);
				</script>
				<form:errors path="house_content" cssClass="error-color"/>
			</li>
			<!-- 내용 끝 -->
			<!-- 이미지 파일 시작 -->
			<li>
				<label for="upload">썸네일 파일</label>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
			</li>
			<!-- <li>
				<label for="upload2">이미지 파일</label>
				<input type="file" name="upload2" id="upload2" accept="image/gif,image/png,image/jpeg">
			</li> -->
			<!-- 이미지 파일 끝 -->
		</ul>
		<!-- 버튼 시작 -->
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="목록" onclick="location.href='list.do'">	
		</div>
		<!-- 버튼 끝 -->
	</form:form>
</div>
<!-- 중앙 내용 끝 -->