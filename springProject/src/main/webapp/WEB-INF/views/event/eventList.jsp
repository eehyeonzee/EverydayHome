<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
.name-item{
	align-items: center;
}
.link-container{
width:1136px;
margin : 0 auto;
}
.link-tiem{
margin: 0 auto;
width : 100%;
}
.container{
margin : 0 auto;
width:1138px;
}
.link-item{
	border-bottom : 1px solid #dbdbdb;
	width : 900px;
	margin : 0 auto;
}
.title{
	font-size:18px;
	weight:800;
	padding: 10px 10px 10px 10px;
	text-align:left;

}
.reg_date{
	font-size:15px;
	padding: 0px 10px 20px 10px;
	text-align:right;
}
.paging {
	text-align:center;
	padding : 50px;
	margin-top : 40px;
}
h2{
	text-align:left;
	margin : 70px 0px 50px 130px;
}
.write-button{
	text-align: right;
	margin : 40px 100px 0px 30px;
}
</style>

<div class="container"> 
 <div class="main-container">
 	<div class="name-item" align="center">
 		<h2 style="font-family: 'Gowun Dodum', sans-serif;">이벤트</h2>
 	</div>
 	<div class="link-container">
 		<c:if test="${user_auth==4}">
 			 <div class="write-button"> 		
 				<a href="${pageContext.request.contextPath}/event/eventWrite.do">이벤트 작성</a><br><br>
 				<hr size="1" width="100%" noshade="noshade"><br><br>
 			</div>
 		</c:if>
 	
	  <!-- 카드시작 -->
      <div class="row my-5 ml-5 mr-5">
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
            	<b>No. ${ list.event_num }</b> 
	            <span style="float: right; font-size: 14px;">
	           		 <b style="font-size: 14px; color: red;"></b> 조회 ${ list.event_hits }
	            </span>
	            
	            <div class="card" style="height: 540px;">
		            <div class="card-body">
		            	<div align="center" style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/event/eventDetail.do?event_num=${list.event_num}'">
		           		<!-- 사진파일이 없는 경우 -->
			            <c:if test="${ empty list.event_filename }">
			            	<img src="${pageContext.request.contextPath}/resources/images/basic.jpg" style="height: 270px;" />
			            </c:if>
			            <!-- 사진파일이 있는 경우 -->
			            <c:if test="${ !empty list.event_filename }">
				            <img src="${pageContext.request.contextPath}/event/eventPhotoView.do?event_num=${list.event_num}" width="1000" height="250" >
			            </c:if>
			           </div>
		            </div>
		          </div>
        </c:forEach>
	    <!-- 반복문 끝 -->
        </c:if>
        <!-- 카드끝 -->
 		 
        </div>
 		<div class="paging">
 			<span>${pagingHtml}</span>
 		</div>
 	</div>
 </div>
 </div>
