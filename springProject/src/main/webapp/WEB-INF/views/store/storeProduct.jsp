<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<div>
<c:if test = "${storeVO.prod_cate == 'furniture'}">가구</c:if>
<c:if test = "${storeVO.prod_cate == 'fabric'}">패브릭</c:if>
<c:if test = "${storeVO.prod_cate == 'lamp'}">조명</c:if>
<c:if test = "${storeVO.prod_cate == 'electonic'}">가전</c:if>
<c:if test = "${storeVO.prod_cate == 'kitchen'}">주방용품</c:if>
<c:if test = "${storeVO.prod_cate == 'deco'}">데코/취미</c:if>
<c:if test = "${storeVO.prod_cate == 'storage'}">수납/정리</c:if>
<c:if test = "${storeVO.prod_cate == 'daily_necessities'}">생활용품</c:if>
<c:if test = "${storeVO.prod_cate == 'necessities'}">생필품</c:if>
<c:if test = "${storeVO.prod_cate == 'tool_diy'}">공구/DIY</c:if>
<c:if test = "${storeVO.prod_cate == 'interior'}">인테리어시공</c:if>
<c:if test = "${storeVO.prod_cate == 'pet'}">반려동물</c:if>
<c:if test = "${storeVO.prod_cate == 'camping'}">캠핑용품</c:if>
<c:if test = "${storeVO.prod_cate == 'indoor'}">실내운동</c:if>
<c:if test = "${storeVO.prod_cate == 'baby_pro'}">유아/아동</c:if>
<c:if test = "${storeVO.prod_cate == 'rental'}">렌탈</c:if>
</div>
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
<form:form id = "order_form" action = "${pageContext.request.contextPath}/order/orderMain.do" modelAttribute = "storeVO" method = "get">
	<form:hidden path = "prod_num" value = "${storeVO.prod_num}" />
<div>
	<c:if test = "${!empty storeVO.thumbnail_img}">
	<img src = "imageView.do?prod_num=${storeVO.prod_num}" style = "width:240px; height:240px; max-width:240px; max-height:240px;"><br>
	</c:if>
	<c:if test = "${empty storeVO.thumbnail_img}">
	<img src = "${pageContext.request.contextPath}/resources/images/gift.png">
	</c:if>
	${storeVO.prod_name}<br>
	가격 : ${storeVO.prod_price}원<br>
	배송비 : ${storeVO.delive_price}원<br>
	배송방법 : ${storeVO.delive_type}<br>
	<c:if test = "${!empty storeVO.prod_option1}">
	<select id = "product">
		<option value = "" id = "selec_option">${storeVO.selec_product}</option>
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option1}</option>
		<c:if test = "${!empty storeVO.prod_option2}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option2}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option3}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option3}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option4}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option4}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option5}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option5}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option6}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option6}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option7}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option7}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option8}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option8}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option9}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option9}</option>
		</c:if>
		<c:if test = "${!empty storeVO.prod_option10}">
		<option value = "${storeVO.prod_price}" id = "selec_option">${storeVO.prod_option10}</option>
		</c:if>
	</select><br>
	</c:if>
	<div>
		<c:if test = "${!empty storeVO.prod_option1}">
			<script type = "text/javascript">
				$(document).ready(function() {
					$('select').val('');
					$('#quan').hide();
					$('#quan').val('0');
					
					$('#product').change(function() {
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
							
							if(result != '') {
								$('#quan').show();
							}
						}
						
						if($('#product').val() == '') {
							$('#result').text('');
							$('#price').text('');
							$('#quan').hide();
						}
						
						$('#quan').change(function() {							
							var last_price = 0;
							var quantity = $('#quan').val();
							
							last_price = quantity * price;
							
							$('#last_price').text(last_price + '원');
						});
						
					});					
				});
			</script>
		</c:if>
		<div>
			<span id = "result"></span>
			<span id = "price"></span>
			<form:label path = "quan">수량 </form:label>
			<input type = "number" id = "quan" min = "0">
		</div>
		<c:if test = "${!empty storeVO.prod_img}">
		<img src = "contentImageView.do?prod_num=${storeVO.prod_num}"><br><br><br>
		</c:if>
		<div>
			${storeVO.prod_content}
		</div>
		<div>
			<span id = "last_price"></span>
		</div>
		<script type = "text/javascript">
			$(document).ready(function() {
				$('#quan').val('0');
				
				$('#quan').change(function() {							
					var last_price = 0;
					var quantity = $('#quan').val();
								
					last_price = quantity * ${storeVO.prod_price};
								
					$('#last_price').text(last_price + '원');
				});
			});
		</script>
		<div>
			<input type = "button" id = "btn_cart" value = "장바구니">
			<form:button id = "btn_order">구매하기</form:button>
		</div>
		<script type = "text/javascript">
			$('#btn_cart').click(function() {
				var quan = $('#quan').val();
				if(quan > ${storeVO.prod_quan}) {
					alert('재고가 부족합니다.');
					return false;
				}
				if($('select').val() != '') {
					if(quan > 0) {
						$.ajax({
							type : 'post',
							url : '${pageContext.request.contextPath}/cart/cartInsert.do',
							data : {
								prod_num : ${storeVO.prod_num},
								user_num : ${user_num},
								cart_quan : quan
							},
							dataType : 'json',
							cache : false,
							timeout : 30000,
							success : function(param) {
								if(param.result == 'add_success') {
									var check = confirm('카트에 등록 되었습니다. 카트를 확인해보시겠습니까?');
									if(check) {
										location.assign('${pageContext.request.contextPath}/cart/cartList.do');					
									}
								}else if(param.result == 'cart_update') {
									var check = confirm('카트 수량이 변경 되었습니다. 카트를 확인해보시겠습니까?');
									if(check) {
										location.assign('${pageContext.request.contextPath}/cart/cartList.do');					
									}
								}else {
									alert('장바구니 오류!');
								}
							},
							error : function() {
								alert('네트워크 오류!');
							}
							
						});
					}else {
						alert('수량을 입력해주세요!');
						return false;
					}
				}else{
					alert('${storeVO.selec_product}를 선택해주세요!');
					return false;
				}
			});
			
			$('#btn_order').click(function() {
				var quan = $('#quan').val();
				var price = $('#last_price');
				if(quan > ${storeVO.prod_quan}) {
					alert('재고가 부족합니다.');
					return false;
				}
			});
		</script>
	</div>
</div>
</form:form>
<!-- 리뷰부분 시작 -->
<!-- 리뷰 총합 -->
<c:if test="${rev_count>0}">
<div class="review-star mt-5">
	<div class="container" style="border:1px solid gray">
	<div class="star-name mt-2 mb-3" style="font-size:20px; text-align:center;">평균평점 : ${rev_grade} <div style="color:red;"><c:forEach var="var" items="${ratingOptions}" varStatus="status" begin="1" end="${rev_grade_round}">★</c:forEach></div>
	<hr>리뷰개수 : ${rev_count} </div>
	</div>
</div>
</c:if>
<c:if test="${rev_count==0}">
<div class="review-star mt-5">
	<div class="container" style="border:1px solid gray">
	<div class="star-name mt-2 mb-3" style="font-size:20px; text-align:center;">
	<hr>리뷰개수 : ${rev_count} </div>
	</div>
</div>
</c:if>
<!-- 리뷰 보기 -->
<div class="review-list mt-5">
	<div class="container">
		<c:if test="${rev_count==0}">
			<div class="reviewlist" style="border:1px solid;">작성한 리뷰가 없습니다.</div>
		</c:if>
		<c:if test="${rev_count>0}">
			<c:forEach var="reviewVO" items="${reviewVO}" varStatus="n">
			<div class="reviewList" style="text-align:center;">리뷰 리스트</div>
			<hr>
			<div class="rev-content">
			<div class="mem_name" style="font-size:21px;">ㅣ${reviewVO.mem_name}</div>
			<div class="rev_grade"><c:forEach var="var" items="${ratingOptions}" varStatus="status" begin="1" end="${reviewVO.rev_grade}">★</c:forEach></div>
			<br><div class="rev_content">${reviewVO.rev_content}</div>
			<div class="rev_reg_date" style="text-align:right">작성일 : ${reviewVO.rev_reg_date}</div>
			
			<c:if test="${!empty reviewVO.rev_filename}">
			<div class="file-item mt-5 mb-5" style="text-align:center">
			<img src="reviewImageView.do?rev_num=${reviewVO.rev_num}" style="max-width:500px">
			</div>
			</c:if>
			</div>
			<hr>
			</c:forEach>
		</c:if>
	</div>
</div>
<!-- 리뷰부분 끝 -->