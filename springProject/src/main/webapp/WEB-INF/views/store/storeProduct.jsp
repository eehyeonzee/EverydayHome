<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<nav>${storeVO.prod_cate}</nav>
<div>
	<c:if test = "${!empty user_num && user_num == storeVO.mem_num}">
			<input type = "button" value = "수정" onclick="location.href='updateProduct.do?prod_num=${storeVO.prod_num}'">
			<input type = "button" value = "삭제" id = "delete_btn">
			<script type = "text/javascript">
				var delete_btn = document.getElementById('delete_btn');
				delete_btn.onclick=function() {
					var choice = confirm('삭제하시겠습니까?');
					if(choice) {
						location.replace('productDelete.do?prod_num=${storeVO.prod_num}');
					}
				};
			</script>
	</c:if>
</div>
<div>
	<c:if test = "${!empty storeVO.thumbnail_img}">
	<img src = "imageView.do?prod_num=${storeVO.prod_num}" style = "width:240px; height:240px; max-width:240px; max-height:240px;"><br>
	</c:if>
	<c:if test = "${empty storeVO.thumbnail_img}">
	<img src = "${pageContext.request.contextPath}/resources/images/gift.png">
	</c:if>
	${storeVO.prod_name}
	${storeVO.prod_price}
	<c:if test = "${!empty storeVO.prod_option1}">
	<select id = "product">
		<option value = "" id = "selec_option">${storeVO.selec_product}</option>
		<option value = "${storeVO.prod_price}">${storeVO.prod_option1}</option>
		<c:if test = "${!empty storeVO.prod_option2}">
		<option value = "${storeVO.prod_price}">${storeVO.prod_option2}</option>
		</c:if>
	</select>
	</c:if>
	<c:if test = "${!empty storeVO.prod_img}">
	<img src = "contentImageView.do?prod_num=${storeVO.prod_num}">
	</c:if>
	<div>
		<c:if test = "${!empty storeVO.prod_option1}">
			<script type = "text/javascript">
				$(document).ready(function() {
					
					$('#product').click(function() {
						var result = '';
						var price = 0;						
						var productOption = $('#product option:selected').text();
						var productPrice = $('#product option:selected').val();
						
						if($('#product').val() != '') {
							result += productOption + " ";
							price += parseInt(productPrice);
						}
						
						if(price != 0) {
							$('#result').text(result);
							$('#price').text(price + '원');
						}
						
						if($('#product').val() == '') {
							$('#result').text('');
							$('#price').text('');
						}
					});
				});
			</script>
		</c:if>
		<div>
			<span id = "result"></span>
			<span id = "price"></span>
			<div id = "result-next">
			</div>
		</div>
		<div>
			<span id = "last_price">0원</span>
		</div>
	</div>
</div>