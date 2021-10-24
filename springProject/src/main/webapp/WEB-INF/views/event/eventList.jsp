<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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

<div class = "container-fluid contents-wrap" style = "width:99%"> 
   <div align = "left">
 		<h3>이벤트</h3><br>
 	</div>
 	<form id="search_form" action="eventList.do" method="get" align="center">
   		<ul class="search"  >
			<li>
				<select name="keyword" id="keyword" style="align:center;">
					<option value="">전체</option>
					<option value="진행중">진행중</option>
					<option value="종료">종료</option>
				</select>&nbsp;&nbsp;
				<input class = "btn btn-outline-dark" type="submit" value="찾기">&nbsp;&nbsp;
				<input class = "btn btn-outline-dark" type="button" value="목록" onclick="location.href='eventList.do'">
			</li>
		</ul>
   </form> 
	<c:if test="${user_auth==4}">
		 <div align="right"> 		
			<input type = "button" class = "btn btn-outline-dark" value = "이벤트 작성" onclick = "location.href='eventWrite.do'">
		</div>
	</c:if>
 	<hr noshade="noshade" size="2">  
 	<div class="text-center col-sm-30 my-5">
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
