<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 16.
 * 작성자 : 오상준
 * 설명 : 마이페이지 내가 쓴 글
 * 수정일 : 
--%>
<%@ include file="/WEB-INF/views/member/common/myPageHeader.jsp" %>
<%@ include file="/WEB-INF/views/member/common/myPageProfile.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		// 카드형 게시물 110글자 초과시 ... 처리
		$('.box').each(function(){
			var content = $(this).children('.card-title');
			var content_txt = content.text();
			var content_txt_short = content_txt.substring(0,10)+"...";
			if(content_txt.length >= 10){
				content.html(content_txt_short);
	        }
	    });
	});
</script>
	<div class="mypage-main-content" align="center">
		<%-- 카드시작 --%>
		<div class="row my-4 ml-4 mr-4">
		<%-- 등록된 게시물이 없는 경우 --%>
		<c:if test="${count == 0}">
			<div class="result-display">
				등록된 게시물이 없습니다.
			</div>
		</c:if>
		<%-- 등록된 게시물이 있는 경우 --%>
		<c:if test="${count > 0}">
			<!-- 반복문 시작 -->
			<c:forEach var="houseBoard" items="${list}">
				<div class="col-3">
					<div class="card" style="height: 470px; width: 220px;">
			            <div class="card-header">
			            	<div style="float: left; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/member/myPage.do'">
				         		<%-- 회원 프로필 사진이 없는 경우 --%>
								<c:if test="${empty member.profile_filename }">
									<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="33" height="33" class="my-photo">
								</c:if>
								<%-- 회원 프로필 사진이 있는 경우 --%>
								<c:if test="${!empty member.profile_filename }">
									<img src="${pageContext.request.contextPath }/member/photoView.do" width="33" height="33" class="my-photo">
								</c:if>
								  <b style="font-size: 17px">${ member.nickname }</b>
			            	</div>
			            </div>
			           
			            <div class="card-body">
				            <div align="center" style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/houseBoard/detail.do?house_num=${houseBoard.house_num}'">
					            <%-- 사진파일이 없는 경우 --%>
					            <c:if test="${ empty houseBoard.thumbnail_filename }">
					            	<img src="${pageContext.request.contextPath}/resources/images/basic.jpg" style="height: 270px; width: 175px;" />
					            </c:if>
					            <%-- 사진파일이 있는 경우 --%>
					            <c:if test="${!empty houseBoard.thumbnail_filename }">
					            	<img src="${pageContext.request.contextPath}/resources/image_upload/${ houseBoard.thumbnail_filename }" style="height: 270px; width: 175px;" />
					            </c:if>
				            </div>
				           <div class="box">   
				           	  <p class="card-title">${ houseBoard.house_title }</p>
				              <div class="content">
				              		<ul>
				              			<li style="display: inline-block; float: left;">
				              				<img style="margin-top: 1em; margin-bottom: 2px; width: 33px; height: 33px;" src="${pageContext.request.contextPath}/resources/images/heart.svg">
				              			</li>
				              			<li style="display: inline-block;">
				              				<img style="margin-top: 1em; margin-bottom: 2px; width: 33px; height: 33px;" src="${pageContext.request.contextPath}/resources/images/bookmark.svg">
				              			</li>
				              			<li style="display: inline-block; float: right;">
				              				<img style="margin-top: 1em; margin-bottom: 2px; width: 33px; height: 33px;" src="${pageContext.request.contextPath}/resources/images/coupon.png">
				              			</li>
				              		</ul>
				              </div>
				           </div>
			           <br>
		            </div>
		          </div>
				</div>
			</c:forEach>
			<!-- 반복문 끝 -->
		</c:if>
		<!-- 카드 끝 -->
	</div>
	<div class="align-center">${pagingHtml}</div>
</div>
</div>
<!-- 중앙 내용 끝 --> 