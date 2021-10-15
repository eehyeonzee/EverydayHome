<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<style>
	ul {
		list-style : none;
	}
	a {
		color : inherit;
		text-decoration : none;
	}
	li {
		margin : 0px;
		padding : 0px;
	}
	.wrap {
		margin-top : 40px;
	}
	.row {
		display: -webkit-box;
	    display: -webkit-flex;
	    display: -moz-flex;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-flex-wrap: wrap;
	    -moz-flex-wrap: wrap;
	    -ms-flex-wrap: wrap;
	    flex-wrap: wrap;
	    box-sizing: border-box;
	    margin-right: -10px;
	    margin-left: -10px;
	}
	.side-bar {
		display : bolck;
	}
	.content {
		position : relative;
	}
	.category-list {
		max-width: 160px;
	}
	.category-list-title {
		margin: 0 0 27px;
		font-size: 20px;
		font-weight: 700;
		color: #000;
	}
	.others {
		margin: 15px 0 30px;
		padding-top: 30px;
		border-top: 1px solid #dbdbdb;
	}
	.others li {
		margin-bottom: 20px;
		font-size: 20px;
		font-weight: 700;
		color: #000;
	}
	.product-item {
		padding: 0 0 30px;
		position : relative;
	}
	.product_overlay {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		z-index: 2;
	}
</style>
<div class = "container">
	<div class = "wrap container">
		<div class = "row">
			<div class = "side-bar col-12 col-md-3">
				<section class="category-list">
					<ul class = "category-list-title others">
						<li>
							<a href="#">가구</a>
						</li>
						<li>
							<a href="#">패브릭</a>
						</li>
						<li>
							<a href="#">조명</a>
						</li>
						<li>
							<a href="#">가전</a>
						</li>
						<li>
							<a href="#">주방용품</a>
						</li>
						<li>
							<a href="#">데코/취미</a>
						</li>
						<li>
							<a href="#">수납/정리</a>
						</li>
						<li>
							<a href="#">생활용품</a>
						</li>
						<li>
							<a href="#">생필품</a>
						</li>
						<li>
							<a href="#">공구/DIY</a>
						</li>
						<li>
							<a href="#">인테리어시공</a>
						</li>
						<li>
							<a href="#">반려동물</a>
						</li>
						<li>
							<a href="#">캠핑용품</a>
						</li>
						<li>
							<a href="#">실내운동</a>
						</li>
						<li>
							<a href="#">유아/아동</a>
						</li>
						<li>
							<a href="#">렌탈</a>
						</li>
					</ul>
				</section>
			</div>
			<div class = "content col-12 col-md-9">
				<h3>${storeVO.prod_cate}</h3>
				CAROUSEL
				
				<div class = "row" style="padding-top: 0px; padding-bottom: 5562px; transform: translateY(0px);">
					<c:forEach var = "storeVO" items = "${list}">
					<div class = "col-6 col-md-4">
						<article id = "product" class = "product-item">
							<div class = "align-center">
								<c:if test = "${!empty storeVO.thumbnail_filename}">
									<a class = "item-overlay" href = "storeDetail.do?prod_num=${storeVO.prod_num}">
									<img src = "imageView.do?prod_num=${storeVO.prod_num}" style = "width:240px; height:240px; max-width:240px; max-height:240px;"><br>
									${storeVO.prod_name}<br>
									${storeVO.prod_price}원
									</a>
								</c:if>	
							</div>
						</article>
					</div>
					</c:forEach>
				</div>
				<div class = "align-center">${pagingHtml}</div>
			</div>
		</div>
	</div>
</div>