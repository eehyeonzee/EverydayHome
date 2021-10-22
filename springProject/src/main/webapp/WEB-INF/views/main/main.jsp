<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<!-- 메인 시작 -->
<!-- main 스타일 적용 -->
<style>

.main {
	display: flex;
	justify-content: center;
	align-item: center;
}

.main-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-auto-rows: minmax(180px, auto);
	grid-row-gap: 4 rem;
	grid-column-gap: 2rem;
}

.main-item:nth-child(1) {
	grid-column: 1/4;
	grid-row: 1/4;
}

.main-item:nth-child(2) {
	grid-column: 4/5;
	grid-row: 1/4;
}

.main-item:nth-child(3) {
	grid-column: 1/4;
	grid-row: 4/6;
}

.main-item:nth-child(4) {
	grid-column: 4/5;
	grid-row: 4/6;
}

.main-item:nth-child(5) {
	grid-column: 1/5;
	grid-row: 6/7;
}

.main-item:nth-child(6) {
	grid-column: 1/5;
	grid-row: 7/9;
}

.main-item:nth-child(7) {
	grid-column: 1/5;
	grid-row: 9/11;
}
.main-story{
	display:flex;
	flex-direction:column;
	align-items: stretch;
}
.main-story-link{
	height: 90px;
	width:397px;
	border : 1px solid white;
	background-color:rgb(250,250,250);
	border-radius:10px;
}
.description{
	padding : 25px 0px 0px 25px;
	font-weight : 700;
	font-color: gray;
	font-size: 9px;
}
.title{
	padding : 10px 0px 0px 25px;
	font-weight : 700;
	font-color: gray;
	font-size: 13px;
}
.rankfeedli{
display:inline;
}
.rankfeedul{
	text-align:center;
}
.rankfeed{
position:sticky;
}
.rankitemul{
float::inline-block ;
display:flex;
text-align:center;
width: 300px;
height: 280px;
background-color:black;
}
.rankcontent{
width: 1083px;
height : 150px;
text-align : center;
}

/* 베스트아이템 */
.bestitemli {
	display: flex;
	flex-direction: column;
	margin-bottom: 2rem;
}
.bestimage {
	height: 0;
	padding-bottom: 60%;
	background-color: lightgray;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
.bestimage img {
	display: none;
}
.bestdesc {
	flex: 1 1 auto;
	padding: 5px;
	background: white;
}

@media (min-width: 600px) {
	.bestitemul {
		display: flex;
		flex-wrap: wrap;
		margin: 0 -1rem;
	}
	.bestitemli {
		width: 50%;
		padding: 0 1rem;
	}
}

@media (min-width: 1200px) {
	.bestitemli {
		width: 25%;
	}
	.carousel slide{
 	visibility : hidden ;  
	}
}

/* 인기사진 */
.popularli {
	display: flex;
	flex-direction: column;
	margin-bottom: 2rem;
}
.popularimage {
	height: 0;
	padding-bottom: 60%;
	background-color: lightgray;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
.popularimage img {
	display: none;
}
.populardesc {
	flex: 1 1 auto;
	padding: 5px;
	background: white;
}

@media (min-width: 600px) {
	.popularul {
		display: flex;
		flex-wrap: wrap;
		margin: 0 -1rem;
	}
	.popularli {
		width: 50%;
		padding: 0 1rem;
	}
}

@media (min-width: 1200px) {
	.popularli {
		width: 25%;
	}
}
/*인기사진 끝*/
/*매일의 스토리 */
.storyli {
	display: flex;
	flex-direction: column;
	margin-bottom: 2rem;
}
.storyimage {
	height: 0;
	padding-bottom: 60%;
	background-color: lightgray;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
.storyimage img {
	display: none;
}
.storydesc {
	flex: 1 1 auto;
	padding: 5px;
	background: white;
}

@media (min-width: 600px) {
	.storyul {
		display: flex;
		flex-wrap: wrap;
		margin: 0 -1rem;
	}
	.storyli {
		width: 50%;
		padding: 0 1rem;
	}
}

@media (min-width: 1200px) {
	.storyli {
		width: 33.33333%;
	}
}

	
.cateul {
    float: right;
    position: relative;
    left: -50%;
}
.cateli{
    float: left;
    position: relative;
    left: 50%;
    margin: 0 auto;
}

</style>

<script type="text/javascript">
	$(function(){
		//메뉴클릭시
		$('.rankfeedli').click(function(){
			var activeTab = $(this).attr('value');
			$('li').css('text-color','orange');
			$.getJSON("/main/main.do"+"?activeTab"+activeTab, function(data){
				var str="";
				$(data).each(function(){
					console.log(data);
					str +="<li"
				})
			})
		});
		
	$('.mainimgwrapper').hover(function() {
		  $("#mainimg1").css("transform", "scale(1.1)"),$("#mainimgbutton").css("color","blue");
		}, function(){
		  $("#mainimg1").css("transform", "scale(1)"),$("#mainimgbutton").css("color","");
		});
	});
</script>
<div class="page-main">
	<div>
		<c:if test="${ECount ==0 }">
		<div class="result-display">
			등록된 게시물이 없습니다.
		</div>
		</c:if>
		<c:if test="${ECount>0 }">
		<div>
			<c:forEach var="event" items="${EList }">
				<div class="horizontal-area">
					<a href="${pageContext.request.contextPath }/event/eventDetail.do?event_num=${event.event_num}">
					<c:if test="${!empty event.event_filename }">
					<img src="${pageContext.request.contextPath }/event/eventPhotoView.do?event_num=${event.event_num}">
					</c:if>
					<c:if test="${empty event.event_filename }">
					<img src="${pageContext.request.contextPath }/resources/images/basic.jpg">
					</c:if>
					<span>${event.event_title}</span>
					</a>	
				</div>
			</c:forEach>
		</div>
		</c:if>
		<div style="clear:both;">	<!-- clear:both 넣으면 floating이 해제되고 튀어올라가지 않음 -->
			<hr width="100%" size="1" noshade="noshade">
		</div>
	</div>
</div>
<!-- 메인 끝 -->
<div class="main">
	<div class="main-container">
<!-- 메인 이미지 박스 -->		
		<div class="main-item">
			<div class="mainimgwrapper" style="height:560px;width:1084px;">
			<div class="main-img" id="main-img" style="overflow: hidden;">
				<img src="${pageContext.request.contextPath}/resources/images/mainimg1.png" id="mainimg1" style="border-radius:1%;  transition: all 0.2s linear;">
			</div>
			<div class="mainimgtext" style="position: relative; bottom:130px;">
			<p style="font-size:40px; padding-left: 55px; font-family: 'Gowun Dodum', sans-serif; font-weight:bolder; color:white;">${houseBoard.house_title}</p><button type="button" class="btn btn-light btn-lg" id="mainimgbutton" style="float:right; margin-right:70px; font-family: 'Gowun Dodum', sans-serif; position: relative; bottom:50px;">보러가기</button>
			</div>
			</div>
		</div>
		<div class="main-item">
<!-- 메인 이미지박스 -->
<!-- 이벤트 캐러셀 시작 -->
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/event1.png" alt="First slide" style="border-radius:1%;"
      onclick="location.href='${pageContext.request.contextPath}/event/eventDetail.do?event_num=1'">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/event2.png" alt="Second slide" style="border-radius:1%;"
      onclick="location.href='${pageContext.request.contextPath}/event/eventDetail.do?event_num=2'">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/event3.png" alt="Third slide" style="border-radius:1%;"
      onclick="location.href='${pageContext.request.contextPath}/event/eventDetail.do?event_num=3'">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/event4.png" alt="Four slide" style="border-radius:1%;"
      onclick="location.href='${pageContext.request.contextPath}/event/eventDetail.do?event_num=4'">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<!-- 이벤트 캐러셀끝 -->
<!-- 사진 게시판 최신순 미리보기 시작 -->
		<c:if test="${ECount ==0 }">
		<div class="result-display">
			등록된 게시물이 없습니다.
		</div>
		</c:if>
		<c:if test="${ECount>0 }">
		<div>
	  	  <c:forEach var="houseBoard" items="${ HList }">
           <div class="card" style="height: 540px;">
            <div class="card-body">
            	<div align="center" style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/houseBoard/detail.do?house_num=${houseBoard.house_num}'">
           		<!-- 사진파일이 없는 경우 -->
	            <c:if test="${ empty houseBoard.thumbnail_filename }">
	            	<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/basic.jpg" style="border-radius:1%;"/>
	            </c:if>
	            <!-- 사진파일이 있는 경우 -->
	            <c:if test="${ !empty houseBoard.thumbnail_filename }">
		            <img class="d-block w-100" src="${pageContext.request.contextPath}/houseBoard/imageView.do?house_num=${houseBoard.house_num}" style="border-radius:1%;" >
	            </c:if>
	           </div>
            </div>
          </div>
        </c:forEach>
		</div>
		</c:if>
		<div style="clear:both;">	<!-- clear:both 넣으면 floating이 해제되고 튀어올라가지 않음 -->
			<hr width="100%" size="1" noshade="noshade">
		</div>
	</div>
</div>
		<div class="main-item">매일의 스토리
			<section class="everydaystory">
			<ul class="storyul">
				<li class="storyli">
					<figure class="storyimage"></figure>
					<div class="storydesc">
						<p>작성자</p>
					</div>
				</li>
				<li class="storyli">
					<figure class="storyimage"></figure>
					<div class="storydesc">
						<p>작성자</p>
					</div>
				</li>
				<li class="storyli">
					<figure class="storyimage"></figure>
					<div class="storydesc">
						<p>작성자</p>
					</div>
				</li>
			</ul>
		</section>
		</div>
<!-- 사진 게시판 미리보기 끝 -->
<!-- 두번째 쭐 오른쪽 바로가기 -->
		<div class="main-item" id="main-item-link">
			<div class="main-story">
			<div class="main-story-link" onclick="location.href='${pageContext.request.contextPath}/houseBoard/list.do';">
				<div class="description">예쁜집 구경하기</div>
				<div class="title">
					<span class="text">>집들이</span>
				</div>
			</div> 
			<div class="main-story-link" onclick="location.href='${pageContext.request.contextPath}/store/storeMain.do';">
				<div class="description">매일 자정, 새로운 특가상품</div>
				<div class="title">
					<span class="text">>스토어</span>
				</div>
			</div>
			<div class="main-story-link" onclick="location.href='${pageContext.request.contextPath}/event/eventList.do';">
				<div class="description">매일의 집은 처음이세요?</div>
				<div class="title">
					<span class="text">>이벤트</span>
				</div>
			</div>
			</div>
		</div>
<!-- 두번째 줄 오른쪽 바로가기끝 -->
<!-- 카테고리 이미지 시작 -->
		<div class="main-item" style="text-align :center; font-size:20px; font-weight:bold;">매일의 집의 카테고리<br>
	
			<ul class="cateul">
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category1.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category2.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category3.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category4.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category5.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category6.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category7.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category8.png"></a></li>
				<li class="cateli"><a><img src ="${pageContext.request.contextPath}/resources/images/category9.png"></a></li>
			</ul>
		</div>
<!-- 카테고리 이미지 끝 -->		
		<!-- 스토어 시작 -->
		<div class="main-item">
			<div class="rankfeed">
				<ol class="rankfeedul">
					<li class="rankfeedli" >전체</li>
					<li class="rankfeedli" value="">가구</li>
					<li class="rankfeedli" value="">패브릭</li>
					<li class="rankfeedli" value="light">조명</li>
					<li class="rankfeedli" value="">가전</li>
					<li class="rankfeedli" value="kitchen">주방용품</li>
					<li class="rankfeedli" value="deco">데코/취미</li>
					<li class="rankfeedli" value="">수납/정리</li>
					<li class="rankfeedli" value="">생필품</li>
					<li class="rankfeedli" value="DIY">공구/DIY</li>
					<li class="rankfeedli" value="pets">반려동물용품</li>
					<li class="rankfeedli" value="">실내운동</li>
					<li class="rankfeedli" value="baby">유아아동</li>
					<li class="rankfeedli" value="lental">렌탈</li>
				</ol>
			</div>
	  	  <c:forEach var="store" items="${ SList }">
	          <div class="card" style="height: 540px;">
	           <div class="card-body">
	           	<div align="center" style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/store/storeDetail.do?prod_num=${store.prod_num}'">
	          		<!-- 사진파일이 없는 경우 -->
	            <c:if test="${ empty store.thumbnail_filename }">
	            	<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/basic.jpg" style="border-radius:1%;"/>
	            </c:if>
	            <!-- 사진파일이 있는 경우 -->
	            <c:if test="${ !empty store.thumbnail_filename }">
		            <img class="d-block w-100" src="${pageContext.request.contextPath}/store/imageView.do?prod_num=${store.prod_num}" style="border-radius:1%;" >
	            </c:if>
	           </div>
	           </div>
	         </div>
	     		</c:forEach>

				<section class="bestitem">
			<ul class="bestitemul">
				<li class="bestitemli">
					<figure class="bestimage"></figure>
					<div class="bestdesc">
						제품명<br>
						가격
					</div>
				</li>
				<li class="bestitemli">
					<figure class="bestimage"></figure>
					<div class="bestdesc">
						제품명<br>
						가격
					</div>
				</li>
				<li class="bestitemli">
					<figure class="bestimage"></figure>
					<div class="bestdesc">
						제품명<br>
						가격
					</div>
				</li>
				<li class="bestitemli">
					<figure class="bestimage"></figure>
					<div class="bestdesc">
						제품명<br>
						가격
					</div>
				</li>
			</ul>
		</section>		
		</div>
		<!-- 스토어 끝 -->
		<!-- 사진 게시판 추천순 시작 -->
		<div class="main-item">매일의 인기사진
			<section class="popular">
			<ul class="popularul">
				<li class="popularli">
					<figure class="popularimage"></figure>
					<div class="populardesc">
						<p>작성자</p>	
					</div>
				</li>
				<li class="popularli">
					<figure class="popularimage"></figure>
					<div class="populardesc">
						<p>작성자</p>				
					</div>
				</li>
				<li class="popularli">
					<figure class="popularimage"></figure>
					<div class="populardesc">
					<p>작성자</p>	
					</div>
				</li>
				<li class="popularli">
					<figure class="popularimage"></figure>
					<div class="populardesc">
					<p>작성자</p>	
					</div>
				</li>
			</ul>
		</section>
		</div>
		<!-- 사진 게시판 추천순 끝 -->
	</div>
</div>
<!-- 메인 끝 -->