<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 10.
 * 작성자 : 오상준
 * 설명 : 마이페이지
 * 수정일 : 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 프로필 버튼
		$(".profile_btn").hover(function(){
			$(this).css("background-color", "#f0e9e9");
		}, function() {
		        $(this).css("background-color","white");
		});
		
		
		// 사진 올리기
		$(".mypage-photo-write").hover(function(){
			$(this).css("color", "#d9d4d4");
		}, function() {
		        $(this).css("color","black");
		});
		
	});
</script>
<%@ include file="/WEB-INF/views/member/myPageHeader.jsp" %>
	<div class="mypage-main-content" align="center">
		<div class="mypage-photo-write-divi">
		<div align="left">사진 ${member.house_board_count}</div>
		<table style="border:1px dashed #b5b7ba;">
			<tr>
			<td style="border:1px dashed #b5b7ba;" class="mypage-photo-write" align="center" onclick="location.href='${pageContext.request.contextPath}/houseBoard/write.do'">
				<span style="font-size: 25px;">+</span>
				<span style="font-size: 14px;">사진을 올려보세요</span>
			</td>			
			</tr>
		</table>	
		<br><br>
		<div align="left">문의하기</div>
		<table style="border:1px dashed #b5b7ba;">
			<tr style="border-style: dotted;">
			<td style="border:1px dashed #b5b7ba;" class="mypage-photo-write" align="center" onclick="location.href='${pageContext.request.contextPath}/serviceBoard/serviceBoardList.do'">
				<span style="font-size: 25px;">+</span>
				<span style="font-size: 14px;">질문을 올려보세요</span>
			</td>			
			</tr>
		</table>
		</div>
	</div>
</div>
<!-- 중앙 내용 끝 -->