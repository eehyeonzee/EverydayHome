<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
.box {
	display: flex;
	flex-direction: row;
    flex-wrap: wrap;
    box-sizing: margin-box;
    justify-content: space-around;
    padding-right: 10px;
    padding-left: 10px;
    justify-content: space-between;
}
</style>

<div class="container"> 
 <div class="main-container">
 	<div class="name-item" align="center">
 		<h2 style="font-family: 'Gowun Dodum', sans-serif;">이벤트</h2>
 		<form id="search_form" action="eventList.do" method="get">
   		<ul class="search">
			<li>
				<select name="keyword" id="keyword">
					<option value="">전체</option>
					<option value="진행중">진행중</option>
					<option value="종료">종료</option>
				</select>
				<input type="submit" value="찾기" class="btn">
				<input type="button" value="목록" onclick="location.href='eventList.do'">
			</li>
		</ul>
   </form> 
 	</div>
 	<div class="link-container">
 		<c:if test="${user_auth==4}">
 			 <div class="write-button" align="right"> 		
 				<a href="${pageContext.request.contextPath}/event/eventWrite.do">이벤트 작성</a><br><br>
 				<hr size="1" width="100%" noshade="noshade"><br><br>
 			</div>
 		</c:if>
 	
	  <!-- 카드시작 -->
      <div class="box">
      <!-- 등록된 게시물이 없는 경우 -->
	      <c:if test="${ count == 0 }">
	      		<div align="center">
	      			등록된 게시물이 없습니다.
	      		</div>
	      </c:if>
      
      <!-- 카드 부분 -->
      <!-- 게시물이 있는 경우 -->
      <c:if test="${ count > 0 }">
      <!-- 반복문 시작 -->
		<c:forEach var="list" items="${ list }">
           <div class="items">
           	<div align="center" style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/event/eventDetail.do?event_num=${list.event_num}'">
           		<%-- <div>
           			<b>No. ${ list.event_num }</b> 
		           	<b style="font-size: 14px; color: red;"></b> 조회 ${ list.event_hits }<br>
	 				<p style="font-family: 'Gowun Dodum', sans-serif;">${list.event_title}</p>
	 			</div> --%>
           		<!-- 사진파일이 없는 경우 -->
	            <c:if test="${ empty list.event_filename }">
	            	<img src="${pageContext.request.contextPath}/resources/images/basic.jpg" style="width:600px; height:177px;" />
	            </c:if>
	            <!-- 사진파일이 있는 경우 -->
	            <c:if test="${ !empty list.event_filename }">
		            <img src="${pageContext.request.contextPath}/event/eventPhotoView.do?event_num=${list.event_num}" width="600px" height="177px" >
	            </c:if>
	            <c:if test="${list.event_type=='진행중' }">
		            <br><br><p style="font-family: 'Gowun Dodum', sans-serif; color:#35c5f0; display:inline; font-weight:bold;">${list.event_type}</p>
		            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		            ${list.event_day}<br><br><br><br><br>
	            </c:if>
	            <c:if test="${list.event_type=='종료' }">
		            <br><br><b style="font-family: 'Gowun Dodum', sans-serif; color:gray; display:inline; font-weight:bold;" >${list.event_type}</b>
		            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		            ${list.event_day}<br><br><br><br><br>
	            </c:if>
           </div>
           </div>
        </c:forEach>
	    <!-- 반복문 끝 -->
        </c:if>
        <!-- 카드끝 -->
 		 
        </div>
 	</div>
 		<div class="paging" align="center">
 			<span>${pagingHtml}</span>
 		</div>
 </div>
 </div>
