<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<style>
	.carousel-indicators li {
	  	object-fit: cover;
    	object-position: top;
    	border-radius: 50%;
    	width: 7px;
    	height: 7px;
    	positon: absoulte;
	}
	
</style>

<div id = "carousel" class = "carousel slide" data-ride="carousel" role = "region" aria-roledescription = "carousel">
	<div class = "carousel-inner" aria-live = "off" style = "transform: translateX(0%);">
	<div class = "carousel-indicators-wrap">
		<ol class = "carousel-indicators">
			<li class = "carousel-indicators-item active" data-target="#carousel" data-slide-to="0" aria-current="true" aria-label="Slide 1">
				<button type = "button"></button>
			</li>
			<li class = "carousel-indicators-item" data-target="#carousel" data-slide-to="1" aria-label="Slide 2">
				<button type = "button"></button>
			</li>
			<li class = "carousel-indicators-item" data-target="#carousel" data-slide-to="2" aria-label="Slide 3">
				<button type = "button"></button>
			</li>
			<li class = "carousel-indicators-item" data-target="#carousel" data-slide-to="3" aria-label="Slide 4">
				<button type = "button"></button>
			</li>
			<li class = "carousel-indicators-item" data-target="#carousel" data-slide-to="4" aria-label="Slide 5">
				<button type = "button"></button>
			</li>
			<li class = "carousel-indicators-item" data-target="#carousel" data-slide-to="5" aria-label="Slide 6">
				<button type = "button"></button>
			</li>
			<li class = "carousel-indicators-item" data-target="#carousel" data-slide-to="6" aria-label="Slide 7">
				<button type = "button"></button>
			</li>
		</ol>
	</div>
		<div class="carousel-item active" style = "width: 100%;" role = "group" aria-roledescription = "slide" aria-label = "1 of 7">
			<div class = "container">
				<a href = "#">
					<img src = "${pageContext.request.contextPath}/resources/images/carousel1.png" class="d-block w-100">
				</a>
			</div>
		</div>
		<div class="carousel-item" style = "width: 100%;" role = "group" aria-roledescription = "slide" aria-label = "2 of 7">
			<div class = "container">
				<a href = "#">
					<img src = "${pageContext.request.contextPath}/resources/images/carousel2.png" class="d-block w-100">
				</a>
			</div>
		</div>
		<div class="carousel-item" style = "width: 100%;" role = "group" aria-roledescription = "slide" aria-label = "3 of 7">
			<div class = "container">
				<a href = "#">
					<img src = "${pageContext.request.contextPath}/resources/images/carousel3.png" class="d-block w-100">
				</a>
			</div>
		</div>
		<div class="carousel-item" style = "width: 100%;" role = "group" aria-roledescription = "slide" aria-label = "4 of 7">
			<div class = "container">
				<a href = "#">
					<img src = "${pageContext.request.contextPath}/resources/images/carousel4.png" class="d-block w-100">
				</a>
			</div>
		</div>
		<div class="carousel-item" style = "width: 100%;" role = "group" aria-roledescription = "slide" aria-label = "5 of 7">
			<div class = "container">
				<a href = "#">
					<img src = "${pageContext.request.contextPath}/resources/images/carousel5.png" class="d-block w-100">
				</a>
			</div>
		</div>
		<div class="carousel-item" style = "width: 100%;" role = "group" aria-roledescription = "slide" aria-label = "6 of 7">
			<div class = "container">
				<a href = "#">
					<img src = "${pageContext.request.contextPath}/resources/images/carousel6.png" class="d-block w-100">
				</a>
			</div>
		</div>
		<div class="carousel-item" style = "width: 100%;" role = "group" aria-roledescription = "slide" aria-label = "7 of 7">
			<div class = "container">
				<a href = "#">
					<img src = "${pageContext.request.contextPath}/resources/images/carousel7.png" class="d-block w-100">
				</a>
			</div>
		</div>
	</div>
	<div class="container">
		<ul>
			<li class = "active" role = "button">
				<span>연휴특가</span>
			</li>
			<li role = "button">
				<span>가을맞이 멍냥템 특가</span>
			</li>
			<li role = "button">
				<span>신혼 필수가전 추천</span>
			</li>
			<li role = "button">
				<span>인기가구 세일위크</span>
			</li>
			<li role = "button">
				<span>300개 브랜드 릴레이 세일</span>
			</li>
			<li role = "button">
				<span>신규브랜드 런칭특가</span>
			</li>
			<li role = "button">
				<span>원하는 날 무료배송</span>
			</li>
		</ul>
	</div>
</div> <!-- end of carousel -->

<script>
	// 캐러셀 동작
	$('#carousel').carousel({
		interval: 5000 // 속도
	})
</script>