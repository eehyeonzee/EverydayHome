<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
 * 작성일 : 2021. 10. 22.
 * 작성자 : 오상준
 * 설명 : 통합검색 출력
 * 수정일 : 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 사진게시판 시작 -->
<div align = "left">
			<div style="display: inline-block;">
				<h2 class="admin-page-h2" style="float: left;">분류 : 사진게시판 (제목 &amp; 내용 &amp; 카테고리)</h2>
				<h3 class="admin-page-h3"><span style="color: red;">'${keyword}'</span> 의 통합검색 결과 ( ${houseCount} )</h3><br>
			</div>
</div>
<div class = "container-fluid contents-wrap" style = "width:99%">
		<div class="text-center col-sm-10 my-5" style="float: right;">
		<%-- 카드시작 --%>
		<div class="row my-5 ml-5 mr-5" align="center">
		<%-- 등록된 게시물이 없는 경우 --%>
		<c:if test="${houseCount == 0}">
			<div class="result-display">
				등록된 게시물이 없습니다.
			</div>
		</c:if>
		<%-- 등록된 게시물이 있는 경우 --%>
		<c:if test="${houseCount > 0}">
			<!-- 반복문 시작 -->
			<c:forEach var="houseBoard" items="${houseList}">
				<div class="col-3">
					<div class="card" style="height: 465px; width: 220px;">
			            <div class="card-header">
			            	<div style="float: left;">
				         		<%-- 회원 프로필 사진이 없는 경우 --%>
								<c:if test="${empty houseBoard.profile_filename }">
									<img src="${pageContext.request.contextPath }/resources/images/basic.jpg" width="33" height="33" class="my-photo">
								</c:if>
								<%-- 회원 프로필 사진이 있는 경우 --%>
								<c:if test="${!empty houseBoard.profile_filename }">
									<img src="${pageContext.request.contextPath }/member/boardPhotoView.do?mem_num=${houseBoard.mem_num}" width="33" height="33" class="my-photo">
								</c:if>
								  <b style="font-size: 17px">${ houseBoard.nickname }</b>
			            	</div>
			            	<div style="float: right;">
			            		조회 : ${ houseBoard.house_hits }
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
					            	<img src="${pageContext.request.contextPath}/member/thumbnailPhotoView.do?house_num=${houseBoard.house_num}" style="height: 270px; width: 175px;" />
					            </c:if>
				            </div>
				           <div class="box">  
				           <br> 
				          
				              <div class="content">
				              		<h5 class="card-title"><a href="${pageContext.request.contextPath}/houseBoard/detail.do?house_num=${houseBoard.house_num}" class="btn btn-outline-dark">${ houseBoard.house_title }</a></h5>
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
	<div class="align-center">${housePagingHtml}</div>
</div>
</div>
<!-- 사진 게시판 끝 --> 

<div style="clear: both;">
	<hr noshade="noshade" size="1">
</div>

<!-- 이벤트 게시판 시작 -->

<div align = "left">
	<div style="display: inline-block;">
		<h2 class="admin-page-h2" style="float: left;">분류 : 이벤트 (제목 &amp; 내용 &amp; 카테고리)</h2>
		<h3 class="admin-page-h3"><span style="color: red;">'${keyword}'</span> 의 통합검색 결과 ( ${eventCount} )</h3><br>
	</div>
</div>
<div class="container" style="margin : 0 auto; width:1138px;"> 
	<div class="main-container">
 	<div class="link-container" align="left" style="width:1436px; margin : 0 auto; display: flex;">
	  <!-- 카드시작 -->
      <div class="row my-5 ml-5 mr-5">
      <!-- 등록된 게시물이 없는 경우 -->
	      <c:if test="${ eventCount == 0 }">
	      		<div align="center">
	      			등록된 게시물이 없습니다.
	      		</div>
	      </c:if>
      
      <!-- 카드 부분 -->
      <!-- 게시물이 있는 경우 -->
		<c:if test="${ eventCount > 0 }">
        <!-- 반복문 시작 -->
        <br>
        	<c:forEach var="event" items="${ eventList }">
            	<div align="left" style="width: 90%; word-break:break-all;">
	            	<b>No. ${ event.event_num }</b> 
		           <span style="float: right; font-size: 14px;">
		           		 <b style="font-size: 14px; color: red;"></b> 조회 ${ event.event_hits }
		            </span>
	      		</div>
	            <div class="card" style="height: 440px; width: 90%; clear: both;">
		            <div class="card-body">
		            	<div align="center" style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/event/eventDetail.do?event_num=${event.event_num}'">
		           		<div class="title" style="font-size:18px; weight:800px; padding: 10px 10px 10px 10px; text-align:left;">
			 				<p style="font-family: 'Gowun Dodum', sans-serif;">${event.event_title}</p>
			 			</div>
		           		<!-- 사진파일이 없는 경우 -->
			            <c:if test="${ empty event.event_filename }">
			            	<img src="${pageContext.request.contextPath}/resources/images/basic.jpg" style="width: 98%; height: 312px;" />
			            </c:if>
			            <!-- 사진파일이 있는 경우 -->
			            <c:if test="${ !empty event.event_filename }">
				            <img src="${pageContext.request.contextPath}/event/eventPhotoView.do?event_num=${event.event_num}" style="width: 98%; height: 312px;">
			            </c:if>
			            <p style="font-family: 'Gowun Dodum', sans-serif;">${event.event_type}	|	${event.event_day}</p>
			           </div>
		            </div>
		          </div>
        </c:forEach>
	    <!-- 반복문 끝 -->
        </c:if>
        <!-- 카드끝 -->
 		 
        </div>
 	</div>
 	<div class="align-center">
 			<span>${eventPagingHtml}</span>
 		</div>
 </div>
 </div>

<!-- 이벤트 게시판 끝 -->
<div style="clear: both;">
	<hr noshade="noshade" size="1">
</div>
<div align = "left">
	<div style="display: inline-block;">
		<h2 class="admin-page-h2" style="float: left;">분류 : 이벤트 (제목 &amp; 내용 &amp; 카테고리)</h2>
		<h3 class="admin-page-h3"><span style="color: red;">'${keyword}'</span> 의 통합검색 결과 ( ${productCount} )</h3><br>
	</div>
</div>
<div class = "container">
	<div class = "wrap container">
		<div class = "row">
			<div class = "content col-12 col-md-12">
				<c:if test="${ productCount == 0 }">
		      		<div align="center">
		      			등록된 게시물이 없습니다.
		      		</div>
	     		 </c:if>
	     		 
	     		 <c:if test="${ productCount > 0 }">
				<div class = "row" style="padding-top: 0px; padding-bottom: 50px; transform: translateY(0px);">
					<c:forEach var = "storeVO" items = "${productList}">
					<div class = "col-8 col-md-3">
						<article id = "product" class = "product-item">
							<div id = "page_font" class = "align-center">
								<c:if test = "${empty storeVO.thumbnail_filename}">
									<!-- 썸네일 이미지가 존재하지 않을 경우 -->
									<a class = "item-overlay" href = "${pageContext.request.contextPath}/store/storeDetail.do?prod_num=${storeVO.prod_num}">
									<img src = "${pageContext.request.contextPath}/resources/images/gift.png" style = "width:240px; height:240px; max-width:240px; max-height:240px;"><br>
										[${storeVO.buis_name}]
										${storeVO.prod_name}<br>
										#${storeVO.prod_keyword}<br>
										${storeVO.prod_price}원
									</a>
								</c:if>
								<c:if test = "${!empty storeVO.thumbnail_filename}">
									<!-- 썸네일 이미지가 존재 -->
									<a class = "item-overlay" href = "${pageContext.request.contextPath}/store/storeDetail.do?prod_num=${storeVO.prod_num}">
									<img src = "${pageContext.request.contextPath}/store/imageView.do?prod_num=${storeVO.prod_num}" style = "width:240px; height:240px; max-width:240px; max-height:240px;"><br>
									[${storeVO.buis_name}]
									${storeVO.prod_name}<br>
									#${storeVO.prod_keyword}<br>
									${storeVO.prod_price}원
									</a>
								</c:if>	
							</div>
						</article>
					</div>
					</c:forEach>
				</div>
				</c:if>
				<div class = "align-center">${productPagingHtml}</div>
			</div>
		</div>
	</div>
</div>
