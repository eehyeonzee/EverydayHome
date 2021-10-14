<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 10.
 * 작성자 : 이현지
 * 설명 : 집들이 게시판 글 수정 폼
 * 수정일 : 
--%>
<!-- 중앙 내용 시작 -->
<div class="page-main">
	<h2>글쓰기</h2>
	<hr size="1" noshade width="100%">
	<form:form id="register_form" action="update.do" modelAttribute="houseBoardVO" enctype="multipart/form-data">
		<form:hidden path="house_num"/>
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
					<option value="10평 미만" <c:if test="${houseBoardVO.house_area.equals('10평 미만')}">selected</c:if>>10평 미만</option>
					<option value="10평대" <c:if test="${houseBoardVO.house_area.equals('10평대')}">selected</c:if>>10평대</option>
					<option value="20평대" <c:if test="${houseBoardVO.house_area.equals('20평대')}">selected</c:if>>20평대</option>
					<option value="30평대" <c:if test="${houseBoardVO.house_area.equals('30평대')}">selected</c:if>>30평대</option>
					<option value="40평대" <c:if test="${houseBoardVO.house_area.equals('40평대')}">selected</c:if>>40평대</option>
					<option value="50평 이상" <c:if test="${houseBoardVO.house_area.equals('50평 이상')}"> selected </c:if>>50평 이상</option>
				</select>
				<form:errors path="house_area" cssClass="error-color"/>
				<label for="house_type"></label>
				<select name="house_type" id="house_type">
					<option value="">주거형태</option>
					<option value="원룸&오피스텔" <c:if test="${houseBoardVO.house_type.equals('원룸&오피스텔')}">selected</c:if>>원룸&오피스텔</option>
					<option value="아파트" <c:if test="${houseBoardVO.house_type.equals('아파트')}">selected</c:if>>아파트</option>
					<option value="빌라&연립" <c:if test="${houseBoardVO.house_type.equals('빌라&연립')}">selected</c:if>>빌라&연립</option>
					<option value="단독주택" <c:if test="${houseBoardVO.house_type.equals('단독주택')}">selected</c:if>>단독주택</option>
					<option value="사무공간" <c:if test="${houseBoardVO.house_type.equals('사무공간')}">selected</c:if>>사무공간</option>
					<option value="상업공간" <c:if test="${houseBoardVO.house_type.equals('상업공간')}">selected</c:if>>상업공간</option>
				</select>
				<form:errors path="house_type" cssClass="error-color"/>
				<label for="house_style"></label>
				<select name="house_style" id="house_style">
					<option value="">스타일</option>
					<option value="모던" <c:if test="${houseBoardVO.house_style.equals('모던')}">selected</c:if>>모던</option>
					<option value="북유럽" <c:if test="${houseBoardVO.house_style.equals('북유럽')}">selected</c:if>>북유럽</option>
					<option value="빈티지" <c:if test="${houseBoardVO.house_style.equals('빈티지')}">selected</c:if>>빈티지</option>
					<option value="내추럴" <c:if test="${houseBoardVO.house_style.equals('내추럴')}">selected</c:if>>내추럴</option>
					<option value="프로방스&로맨틱" <c:if test="${houseBoardVO.house_style.equals('프로방스&로맨틱')}">selected</c:if>>프로방스&로맨틱</option>
					<option value="클래식&앤틱" <c:if test="${houseBoardVO.house_style.equals('클래식&앤틱')}">selected</c:if>>클래식&앤틱</option>
					<option value="한국&아시아" <c:if test="${houseBoardVO.house_style.equals('한국&아시아')}">selected</c:if>>한국&아시아</option>
					<option value="유니크" <c:if test="${houseBoardVO.house_style.equals('유니크')}">selected</c:if>>유니크</option>
				</select>
				<form:errors path="house_style" cssClass="error-color"/>
			</li>
			<li>
				<label for="house_space"></label>
				<select name="house_space" id="house_space">
					<option value="">공간 (필수)</option>
					<option value="원룸" <c:if test="${houseBoardVO.house_space.equals('원룸')}">selected</c:if>>원룸</option>
					<option value="거실" <c:if test="${houseBoardVO.house_space.equals('거실')}">selected</c:if>>거실</option>
					<option value="침실" <c:if test="${houseBoardVO.house_space.equals('침실')}">selected</c:if>>침실</option>
					<option value="주방" <c:if test="${houseBoardVO.house_space.equals('주방')}">selected</c:if>>주방</option>
					<option value="욕실" <c:if test="${houseBoardVO.house_space.equals('욕실')}">selected</c:if>>욕실</option>
					<option value="아이방" <c:if test="${houseBoardVO.house_space.equals('아이방')}">selected</c:if>>아이방</option>
					<option value="드레스룸" <c:if test="${houseBoardVO.house_space.equals('드레스룸')}">selected</c:if>>드레스룸</option>
					<option value="서재&작업실" <c:if test="${houseBoardVO.house_space.equals('서재&작업실')}">selected</c:if>>서재&작업실</option>
					<option value="베란다" <c:if test="${houseBoardVO.house_space.equals('베란다')}">selected</c:if>>베란다</option>
					<option value="사무공간" <c:if test="${houseBoardVO.house_space.equals('사무공간')}">selected</c:if>>사무공간</option>
					<option value="상업공간" <c:if test="${houseBoardVO.house_space.equals('상업공간')}">selected</c:if>>상업공간</option>
					<option value="가구&소품" <c:if test="${houseBoardVO.house_space.equals('가구&소품')}">selected</c:if>>가구&소품</option>
					<option value="현관" <c:if test="${houseBoardVO.house_space.equals('현관')}">selected</c:if>>현관</option>
					<option value="외관&기타" <c:if test="${houseBoardVO.house_space.equals('외관&기타')}">selected</c:if>>외관&기타</option>
				</select>
				<form:errors path="house_space" cssClass="error-color"/>
			</li>
			<!-- 카테고리 끝 -->
			<!-- 내용 시작 -->
			<li>
				<label for="house_content"></label>
				<form:textarea path="house_content" rows="5" cols="60" placeholder="사진에 대해 설명해주세요"/>
				<form:errors path="house_content" cssClass="error-color"/>
			</li>
			<!-- 내용 끝 -->
			<!-- 이미지 파일 시작 -->
			<li>
				<label for="upload">썸네일 파일</label>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty houseBoardVO.thumbnail_filename}">
					<br>
					<span>(${houseBoardVO.thumbnail_filename}) 파일이 등록되어 있습니다.
					다시 업로드하면 기존 파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload2">이미지 파일</label>
				<input type="file" name="upload2" id="upload2" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty houseBoardVO.upload_filename}">
					<br>
					<span>(${houseBoardVO.upload_filename}) 파일이 등록되어 있습니다.
					다시 업로드하면 기존 파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<!-- 이미지 파일 끝 -->
		</ul>
		<!-- 버튼 시작 -->
		<div class="align-center">
			<form:button>수정</form:button>
			<input type="button" value="목록" onclick="location.href='list.do'">	
		</div>
		<!-- 버튼 끝 -->
	</form:form>
</div>
<!-- 중앙 내용 끝 -->
